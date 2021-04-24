#!/bin/bash


mkdir ~/recon/$1
mkdir ~/recon/$1/Subdomains
results=~/recon/$1/Subdomains

echo -e "\n[+] Gathering all subdomains of $1 from Subfinder...!!"
subfinder -d $1 -o $results/$1_all_subdomains.txt;
echo -e "\n[+] Gathering all subdomains of $1 from assetfinder...!!"
assetfinder -subs-only $1 >> $results/$1_all_subdomains.txt;
echo -e "\n[+] Gathering all subdomains of $1 from findomain...!!"
findomain --target $1 -q | tee -a $results/$1_all_subdomains.txt;
echo -e "\n[+] Gathering all subdomains of $1 from knockpy...!!"
knockpy $1 -o $results;
cat $results/*.json | grep "$1" | sed 's/": {//' | awk '{print $1}' | sed 's/"//g' | sed 's/domain://' | sort -u >> $results/$1_all_subdomains.txt
cat $results/$1_all_subdomains.txt | sort -u >> $results/$1_temp_subdomains.txt;
cat $results/$1_temp_subdomains.txt | sort -u | tee  $results/$1_subdomains.txt
rm $results/$1_all_subdomains.txt $results/$1_temp_subdomains.txt;


echo -e "\n[+] Completed...!! Results stored in: $results"

