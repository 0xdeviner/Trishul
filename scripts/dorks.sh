#!/bin/bash


mkdir ~/recon/$1/Dorks;
results=~/recon/$1/Dorks
data=~/recon/$1/Subdomains

echo -e "\n[+] Started google dorking for $1...!!"
for url in `cat $data/$1_subdomains.txt`; do echo $url; ~/tools/degoogle_hunter/degoogle_hunter.sh $url | tee -a $results/$url_dorkresult.txt; done

echo -e "\n[+] Completed...!! Results stored in: $results"
