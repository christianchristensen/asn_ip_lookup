#!/bin/sh

curl -O ftp://ftp.afrinic.net/stats/afrinic/delegated-afrinic-extended-latest
curl -O ftp://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest
curl -O ftp://ftp.apnic.net/public/apnic/stats/apnic/delegated-apnic-extended-latest
curl -O ftp://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-extended-latest
curl -O ftp://ftp.ripe.net/pub/stats/ripencc/delegated-ripencc-extended-latest

# RIPE includes all ASNs (todo: validate this)
curl -O https://ftp.ripe.net/ripe/asnames/asn.txt

# Print summary
head -200 delegated-* | grep "^==\|\|summary"
