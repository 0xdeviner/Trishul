#!/bin/bash

mkdir ~/recon/$1/GitScan
results=~/recon/$1/GitScan
data=~/recon/$1/Probed


echo -e "\n[+] Started github recon for $1...!!"
cat $data/$1_probed_host_only.txt | git-hound --dig-files --dig-commits >> $results/$1_git-hound.out

echo -e "\n[+] Completed...!!"