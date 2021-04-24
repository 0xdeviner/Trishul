#!/bin/bash



mkdir ~/recon/$1/DirEnum;
results=~/recon/$1/DirEnum
data=~/recon/$1/Probed

echo -e "\n[+] Started fuzzing directories with ffuf...!!"

for url in `cat $data/$1_fine_alive_urls.txt`;do echo $url; ffuf -mc all -c -w ~/Trishul/wordlists/directory-list-2.3-medium.txt -fc 404,429 -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0" -u $url/FUZZ -D -e js,php,bak,txt,asp,aspx,jsp,html,zip,jar,sql,json,old,gz,shtml,log,swp,yaml,yml,config,save,rsa,ppk -t 50 -ac -o $results/$1_out.temp; cat $results/$1_out.temp | jq '[.results[]|{status: .status, length: .length, url: .url}]' | grep -oP "status\":\s(\d{3})|length\":\s(\d{1,7})|url\":\s\"(http[s]?:\/\/.*?)\"" | paste -d' ' - - - | awk '{print $2" "$4" "$6}' | sed 's/\"//g' | sort -u >> $results/$1_directory.txt;done

echo -e "\n[+] Completed...!! Results stored in: $results"

