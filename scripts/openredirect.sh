#!/bin/bash

mkdir -p ~/recon/$1/OpenRedirect
results=~/recon/$1/OpenRedirect

echo -e "\n[+] gathering Open Redirect urls for $1...!!"
cat ~/recon/$1/Extraction/GF/$1_redirect.txt | qsreplace FUZZ | tee -a $results/$1_potential_redirects.txt
cat ~/recon/$1/Extraction/$1_param_value.txt | qsreplace FUZZ | tee -a $results/$1_potential_redirects.txt
cat $results/$1_potential_redirects.txt | sort -u | tee -a $results/$1_potential_unique_redirects.txt

echo -e "\n[+] Running OpenRedireX on $1...!!"

python3 ~/tools/OpenRedireX/openredirex.py -l $results/$1_potential_unique_redirects.txt -p ~/tools/OpenRedireX/payloads.txt --keyword FUZZ | tee -a $results/$1_open_redirects.txt


echo -e "\n[+] Completed...!! Results stored in: $results"