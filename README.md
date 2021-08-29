## ASN & IP lookup database

ASN<->IP lookup using RIR published datasets


Example lookup of OpenDNS
```
$ ./lookup.sh 208.67.222.222
registry|cc|ip|range|date|asn|name
arin|US|208.67.216.0|2048|20060606|30607|302-DIRECT-MEDIA-ASN, US
arin|US|208.67.216.0|2048|20060606|36692|OPENDNS, US
```


Example full setup (build of asn_ip.db)
```
$ ./get.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  647k  100  647k    0     0  54348      0  0:00:12  0:00:12 --:--:--  101k
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 10.1M  100 10.1M    0     0  1717k      0  0:00:06  0:00:06 --:--:-- 2168k
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 6954k  100 6954k    0     0   328k      0  0:00:21  0:00:21 --:--:--  829k
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 3751k  100 3751k    0     0   742k      0  0:00:05  0:00:05 --:--:--  856k
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 15.0M  100 15.0M    0     0  1913k      0  0:00:08  0:00:08 --:--:-- 3000k
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 3956k  100 3956k    0     0   578k      0  0:00:06  0:00:06 --:--:--  785k
==> delegated-afrinic-extended-latest <==
afrinic|*|asn|*|3326|summary
afrinic|*|ipv4|*|4561|summary
afrinic|*|ipv6|*|5123|summary
==> delegated-apnic-extended-latest <==
apnic|*|asn|*|11551|summary
apnic|*|ipv4|*|49235|summary
apnic|*|ipv6|*|85679|summary
==> delegated-arin-extended-latest <==
arin|*|asn|*|29808|summary
arin|*|ipv4|*|69542|summary
arin|*|ipv6|*|64976|summary
==> delegated-lacnic-extended-latest <==
lacnic|*|ipv4|*|19124|summary
lacnic|*|ipv6|*|48550|summary
lacnic|*|asn|*|13156|summary
==> delegated-ripencc-extended-latest <==
ripencc|*|ipv4|*|86777|summary
ripencc|*|asn|*|42533|summary
ripencc|*|ipv6|*|97111|summary
$ ./process.sh
$ ./lookup.sh 1.1.1.1
registry|cc|ip|range|date|asn|name
apnic|AU|1.1.1.0|256|20110811|9838|APNIC-DEBOGON-AS-AP APNIC Debogon Project, AU
apnic|AU|1.1.1.0|256|20110811|24021|APNICRANDNET-TUI-AU TUI experiment, AU
apnic|AU|1.1.1.0|256|20110811|38610|APNIC-JP-RD APNIC R&D Centre, JP
apnic|AU|1.1.1.0|256|20110811|131072|APNIC-RD-AP APNIC R&D Centre, AU
apnic|AU|1.1.1.0|256|20110811|131074|APNIC-JP-RD APNIC R&D Centre JP, AU
$ ls
README.md                               delegated-afrinic-extended-latest       ipv4.csv
TODO                                    delegated-apnic-extended-latest         lookup.sh
asn.csv                                 delegated-arin-extended-latest          process.sh
asn.txt                                 delegated-lacnic-extended-latest        schema.sql
asn_ip.db                               delegated-ripencc-extended-latest       summary.csv
asn_names.csv                           get.sh
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
