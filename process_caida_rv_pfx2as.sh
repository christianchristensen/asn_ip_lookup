#!/bin/bash

gzip -d caida_rv2_pfx2as.gz
#echo 'cidr|asn|dec_start|dec_end|dec_width' > caida_rv2_pfx2as.csv
rm caida_rv2_pfx2as.csv # Included in schema

sort -rn -k2 caida_rv2_pfx2as | awk '{ip=$1; cp=$2; asn=$3; dec=0; split(ip,octets,"."); for(i=1;i<=4;i++){dec+=octets[i]*256**(4-i)}; path=$7; n=split(path,patha," "); dece=dec+(2**(32-cp)); print ip"/"cp"|"asn"|"dec"|"dece"|"dece-dec}' >> caida_rv2_pfx2as.csv

echo -e ".separator "\|"\n.import caida_rv2_pfx2as.csv caida_rv2_pfx2as" | sqlite3 asn_ip.db
