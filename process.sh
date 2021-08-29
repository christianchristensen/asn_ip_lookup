#!/bin/bash

# Select specific sections from delegated-* file, based on 
#  https://www.arin.net/reference/research/statistics/nro_extended_stats_format.pdf
# Convert IP into numeric and range
# Import each row into sqlite
#

echo 'asn|name' > asn_names.csv
sed -e s'/\ /|/' asn.txt >> asn_names.csv

###

# Check for unprocessed lines
# awk -F\| '($6!="summary"&&$3!="asn"&&$3!="ipv4"&&$3!="ipv6")' delegated-* | grep -v "^#" | wc -l

# Version lines
echo 'version|registry|serial|records|startdate|enddate|UTCoffset' > version.csv
awk -F\| '($6!="summary"&&$3!="asn"&&$3!="ipv4"&&$3!="ipv6")' delegated-* | grep -v "^#" >> version.csv

# Summary
echo 'registry|N1|type|N2|count|summary' > summary.csv
awk -F\| '($6=="summary")' delegated-* >> summary.csv

# ASN
echo 'registry|cc|type|start|value|date|status|reg_id' > asn.csv
awk -F\| '($6!="summary"&&$3=="asn")' delegated-* | awk -F\| '($6!="summary"&&$3=="asn"&&$1=="ripencc"&&($7=="reserved"||$7=="available")) {$0=$0"|"} {print}' | awk -F\| '($6!="summary"&&$3=="asn"&&$1=="lacnic"&&($7=="available")) {$0=$0"|"} {print}' >> asn.csv
# Fix ripencc & lacnic last column

# IPv4
# https://stackoverflow.com/questions/10768160/ip-address-converter
echo 'registry|cc|type|start|value|date|status|reg_id|dec_start|dec_end' > ipv4.csv
awk -F\| '($6!="summary"&&$3=="ipv4"&&$1=="ripencc"&&($7=="available"||$7=="reserved")) {$0=$0"|"} {print}' delegated-* | awk -F\| '($6!="summary"&&$3=="ipv4"&&$1=="lacnic"&&($7=="available")) {$0=$0"|"} {print}' | awk -F\| '($6!="summary"&&$3=="ipv4") { ip=$4; split(ip, octets, "."); dec=0; for(i=1;i<=4;i++){dec+=octets[i]*256 **(4-i)}; print $0"|"dec"|"dec+$5}' >> ipv4.csv
# Fix ripencc last column

# IPv6

###

# Create sqlite db
sqlite3 asn_ip.db < schema.sql
echo -e ".separator "\|"\n.import asn_names.csv asn_names" | sqlite3 asn_ip.db
echo -e ".separator "\|"\n.import version.csv version" | sqlite3 asn_ip.db
echo -e ".separator "\|"\n.import summary.csv summary" | sqlite3 asn_ip.db
echo -e ".separator "\|"\n.import asn.csv asn" | sqlite3 asn_ip.db
echo -e ".separator "\|"\n.import ipv4.csv ipv4" | sqlite3 asn_ip.db
