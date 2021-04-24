#!/bin/bash

mkdir ~/recon/$1/PortScan
results=~/recon/$1/PortScan
subdata=~/recon/$1/Subdomains

echo -e "\n[+] Started Port Scanning with naabu and Nmap...!!"
naabu -iL $subdata/$1_subdomains.txt -nmap-cli "nmap -sV -sC -oA $results/nmap-out"
echo -e "\n[+] Completed...!! Results stored in: $results"
