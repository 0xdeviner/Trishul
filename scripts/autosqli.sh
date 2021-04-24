#!/bin/bash

mkdir ~/recon/$1/sqli
results=~/recon/$1/sqli
gfdata=~/recon/$1/Extraction/GF


echo -e "\n[+] Started SQLi Scan with sqlmap...!!"
cat $gfdata/$1_sqli.txt | qsreplace FUZZ | anew $results/$1_tmp_sqli.txt;
interlace -tL $results/$1_tmp_sqli.txt -threads 10 -c "python3 ~/tools/sqlmap/sqlmap.py -u _target_ --banner --batch --disable-coloring --random-agent --output-dir=~/recon/$1/sqli/sqlmap" &>/dev/null

echo -e "\n[+] Completed...!! Results stored in: $results"