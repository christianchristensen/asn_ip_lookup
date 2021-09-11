#!/bin/sh

LATESTPATH=$(curl https://publicdata.caida.org/datasets/routing/routeviews-prefix2as/pfx2as-creation.log | tail -1 | awk '{print $NF}')
curl -o caida_rv2_pfx2as.gz "https://publicdata.caida.org/datasets/routing/routeviews-prefix2as/${LATESTPATH}"
