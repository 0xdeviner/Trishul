#!/bin/bash

mkdir ~/recon/$1/PortScan
results=~/recon/$1/PortScan
subdata=~/recon/$1/Subdomains

echo -e "\n[+] Started Port Scanning with naabu and Nmap...!!"
naabu -host $1 -nmap-cli "nmap -sV -sC -oA $results/nmap-out"
echo -e "\n[+] Completed...!! Results stored in: $results"
