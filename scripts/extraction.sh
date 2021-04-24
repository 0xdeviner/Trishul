#!/bin/bash

mkdir ~/recon/$1/Extraction;
results=~/recon/$1/Extraction
mkdir ~/recon/$1/Extraction/GF
gfdata=~/recon/$1/Extraction/GF

echo -e "\n[+] Gathering all URLS from $1...!!"
echo $1 | gau -subs >> $results/$1_extracted_urls.txt
echo $1 | waybackurls | tee -a $results/$1_extracted_urls.txt >/dev/null 2>&1;
python3 ~/tools/ParamSpider/paramspider.py -d $1 -s true -o $results/$1_extracted_params.txt;

echo -e "\n[+] Sorting urls...!!"
cat $results/$1_extracted_params.txt | tee -a $results/$1_extracted_urls.txt;
cat $results/$1_extracted_urls.txt | sort -u | tee -a $results/$1_unique.txt;

echo -e "\n[+] Filtering the urls....!!"
cat $results/$1_unique.txt | grep "=" | sort -u | egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | \
qsreplace -a | \
tee -a $results/$1_param_value.txt
cat $results/$1_param_value.txt | gf xss | tee -a $gfdata/$1_xss.txt
cat $results/$1_param_value.txt | gf lfi | tee -a $gfdata/$1_lfi.txt
cat $results/$1_param_value.txt | gf rce | tee -a $gfdata/$1_rce.txt
cat $results/$1_param_value.txt | gf sqli | tee -a $gfdata/$1_sqli.txt
cat $results/$1_param_value.txt | gf redirect | tee -a $gfdata/$1_redirect.txt
cat $results/$1_param_value.txt | gf ssrf | tee -a $gfdata/$1_ssrf.txt
cat $results/$1_param_value.txt | gf ssti | tee -a $gfdata/$1_ssti.txt
cat $results/$1_param_value.txt | gf idor | tee -a $gfdata/$1_idor.txt


echo -e "\n[+] Completed...!! Results stored in: $results"