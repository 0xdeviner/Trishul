#!/bin/bash

mkdir -p ~/recon/$1/Probed
results=~/recon/$1/Probed

echo -e "\n[+] Probing Active targets...!!"
#cat $results/$1_subdomains.txt | httpx -follow-redirects -status-code -vhost -threads 300 -silent | sort -u | grep "[200]" | cut -d [ -f1 | sort -u | sed 's/https\?:\/\///' >> $results/$1_probed.txt;
echo $1 | httpx -follow-redirects -status-code -vhost -title -threads 300 -silent | sort -u >> $results/$1_alive_with_status.txt;
echo $1 | httpx -follow-redirects -status-code -vhost -threads 300 -silent | sort -u | grep "[200]" | cut -d [ -f1 | sort -u | sed 's/[[:blank:]]"$//' >> $results/$1_fine_alive_urls.txt;

cat $results/$1_fine_alive_urls.txt | sed 's/https\?:\/\///' | tee -a $results/$1_probed_host_only.txt

echo -e "\n[+] Completed...!!"