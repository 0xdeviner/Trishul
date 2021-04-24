#!/bin/bash

mkdir -p ~/recon/$1/jexboss
results=~/recon/$1/jexboss

echo -e "\n[+] Started jexboss on each targets...!!"

python3 ~/tools/jexboss/jexboss.py -mode file-scan -file ~/recon/$1/Probed/$1_fine_alive_urls.txt -out $results/$1_jexboss_out.log
mv *.log $results/

echo -e "\n[+] Completed...!! Results stored in: $results"