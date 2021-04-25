#!/bin/bash

dir=~/Trishul/scripts
mkdir ~/recon/$domain
results=~/recon/$domain

for domain in $(cat $1); do
	#Probing
	echo -e "\n[+] ****************Started Subdomain Probing for $domain****************"
	$dir/probing_small.sh $domain;
	echo -e "\n[+] ****************Completed****************"
	#port scan
	echo -e "\n[+] ****************Started Port Scanning for $domain****************"
	$dir/portscan_small.sh $domain;
	echo -e "\n[+] ****************Completed****************"
	#nuclei scan
	echo -e "\n[+] ****************Started Nuclei Template scan for $domain****************"
	$dir/nuclei.sh $domain;
	echo -e "\n[+] ****************Completed****************"
	#Extraction
	echo -e "\n[+] ****************Started Extracting for $domain****************"
	$dir/extraction.sh $domain;
	echo -e "\n[+] ****************Completed****************"
	#directory fuzzing
	echo -e "\n[+] ****************Started Directory fuzzing for $domain****************"
	$dir/fuzzdir.sh $domain;
	echo -e "\n[+] ****************Completed****************"
	#cors scan
	echo -e "\n[+] ****************Started CORS Scan for $domain****************"
	$dir/corsy.sh $domain;
	echo -e "\n[+] ****************Completed****************"
	#jexboss 
	echo -e "\n[+] ****************Started Jexboss vuln scanner for $domain****************"
	$dir/jexboss.sh $domain;
	echo -e "\n[+] ****************Completed****************"
	#JSfile enum
	echo -e "\n[+] ****************Started JS file Enumeration for $domain****************"
	$dir/jsgather.sh $domain;
	echo -e "\n[+] ****************Completed****************"
	#metadata finder
	echo -e "\n[+] ****************Started Metadata finder for $domain****************"
	$dir/metafinder.sh $domain;
	echo -e "\n[+] ****************Completed****************"
	#dorks
	echo -e "\n[+] ****************Started Google Dorking for $domain****************"
	$dir/dorks.sh $domain;
	echo -e "\n[+] ****************Completed****************"
	#gitscan
	echo -e "\n[+] ****************Started github scan for $domain****************"
	$dir/gitscan.sh $domain;
	echo -e "\n[+] ****************Completed****************"
	#openredirect
	echo -e "\n[+] ****************Started Finding for Open Redirect for $domain****************"
	$dir/openredirect.sh $domain;
	echo -e "\n[+] ****************Completed****************"
	#autoxss
	echo -e "\n[+] ****************Started Finding XSS for $domain****************"
	$dir/autoxss.sh $domain;
	echo -e "\n[+] ****************Completed****************"
	#autosqli
	echo -e "\n[+] ****************Started Finding Sqli for $domain****************"
	$dir/autosqli.sh $domain;
	echo -e "\n[+] ****************Completed****************"

	echo "Small Scan completed for $domain" | notify
done