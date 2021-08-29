## ASN & IP lookup database

ASN<->IP lookup using RIR published datasets


Example lookup of OpenDNS
```
$ ./lookup.sh 208.67.222.222
registry|cc|ip|range|date|asn|name
arin|US|208.67.216.0|2048|20060606|30607|302-DIRECT-MEDIA-ASN, US
arin|US|208.67.216.0|2048|20060606|36692|OPENDNS, US
```


### refs:
ftp://ftp.afrinic.net/stats/afrinic/delegated-afrinic-extended-latest
ftp://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest
ftp://ftp.apnic.net/public/apnic/stats/apnic/delegated-apnic-extended-latest
ftp://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-extended-latest
ftp://ftp.ripe.net/pub/stats/ripencc/delegated-ripencc-extended-latest
https://ron.sh/how-ip-to-country-lookup-work-under-the-hood/
https://ahermosilla.com/tools/2020/07/07/where-ip-data-lives.html
https://blogofsomeguy.com/a/fastmetrics-p4-mapping-ip-to-asn/
