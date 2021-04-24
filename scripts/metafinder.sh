#!/bin/bash


mkdir ~/recon/$1/Metadata;
results=~/recon/$1/Metadata

echo -e "\n[+] Finding files for metadata...!!"
for host in `cat ~/recon/$1/Probed/$1_fine_alive_urls.txt`; do echo $host; metafinder -d $host -l 20 -o $results/$_data -t 10 -go -bi ; done

echo -e "\n[+] Completed...!! Results stored in: $results"