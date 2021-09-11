#!/bin/sh

./get.sh
./process.sh
./get_caida_rv_pfx2as.sh
./process_caida_rv_pfx2as.sh
./lookup.sh 1.1.1.1
