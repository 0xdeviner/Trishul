#!/bin/bash

mkdir ~/recon/$1/cors
results=~/recon/$1/cors
data=~/recon/$1/Subdomains


echo -e "\n[+] Started Cors Scan with CORScanner...!!"
python3 ~/tools/CORScanner/cors_scan.py -i $data/$1_subdomains.txt -t 70 -o $results/$1_cors.out
echo -e "\n[+] Completed...!! Results stored in: $results"