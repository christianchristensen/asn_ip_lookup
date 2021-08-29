#!/bin/bash

# echo 'cidr|aspath|as1|asN|dec_start|dec_end|dec_width' > eqix.csv # included in schema
rm eqix.csv

bgpdump -m rib.20210829.2000.bz2 | awk -F\| '(!($6~/:/))&&($6!="0.0.0.0/0")' | awk -F\| '{ipcidr=$6; split(ipcidr,cidr,"/"); ip=cidr[1]; cp=cidr[2]; dec=0; split(ip,octets,"."); for(i=1;i<=4;i++){dec+=octets[i]*256**(4-i)}; path=$7; n=split(path,patha," "); dece=dec+(2**(32-cp)); print ipcidr"|"path"|"patha[1]"|"patha[n]"|"dec"|"dece"|"dece-dec}' >> eqix.csv

echo -e ".separator "\|"\n.import eqix.csv routeviews_ipv4" | sqlite3 asn_ip.db
