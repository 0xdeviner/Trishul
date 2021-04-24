#!/bin/bash

mkdir ~/recon/$1/JsFiles
results=~/recon/$1/JsFiles
data=~/recon/$1/Probed

echo -e "\n[+] Started Gathering JsFiles for $1...!!"

bash ~/tools/JSFScan/JSFScan.sh -l $data/$1_fine_alive_urls.txt --all -r -o $results/$1_JSFScan.out

echo -e "\n[+] Completed...!! Results stored in: $results"