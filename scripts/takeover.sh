#!/bin/bash

mkdir -p ~/recon/$1/Takeovers
results=~/recon/$1/Takeovers/

echo -e "\n[+] Checking for possible Takeovers...!!"
subzy -targets ~/recon/$1/Subdomains/$1_subdomains.txt --hide_fails >> $results/$1_subzy_result.txt

echo -e "\n[+] Completed...!! Results stored in: $results"