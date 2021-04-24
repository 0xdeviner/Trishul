#!/bin/bash

HEADER="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36"

mkdir ~/recon/$1/nuclei
results=~/recon/$1/nuclei
target=~/recon/$1/Probed/$1_fine_alive_urls.txt


echo -e "\n[+] Updating Nuclei templates...!!"
cd ~/tools/nuclei-templates/
git pull;
cd ~/
echo -e "\n[+] Scanning begins now...."

printf "\n#########################################################\n"
echo -e "\n[+] Nuclei template scan started...!!"

printf "\n\n Running : Nuclei Technologies \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/technologies/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/technologies.txt;

printf "\n\n Running : Nuclei Headless \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/headless/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/headless.txt;

printf "\n\n Running : Nuclei Exposures \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/exposures/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/exposers.txt;

printf "\n\n Running : Nuclei CVEs \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/cves/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/cves.txt;

printf "\n\n Running : Nuclei Default Creds \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/default-logins/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/default-logins.txt;

printf "\n\n Running : Nuclei DNS \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/dns/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/dns.txt;

printf "\n\n Running : Nuclei Panels \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/exposed-panels/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/panels.txt;

printf "\n\n Running : Nuclei Security Misconfiguration \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/misconfiguration/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/misconfigurations.txt;

printf "\n\n Running : Nuclei Vulnerabilites \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/vulnerabilities/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/vulnerabilites.txt;

printf "\n\n Running : Nuclei fuzzing \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/fuzzing/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/fuzzing.txt;

printf "\n\n Running : Nuclei Helper \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/helpers/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/helper_payload.txt;

printf "\n\n Running : Nuclei IoT \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/iot/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/IoT.txt;

printf "\n\n Running : Nuclei miscellaneous \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/miscellaneous/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/miscellaneous.txt;

printf "\n\n Running : Nuclei network \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/network/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/network.txt;

printf "\n\n Running : Nuclei takovers \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/takeovers/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/takovers.txt;

printf "\n\n Running : Nuclei workflows \n\n"
cat $target | nuclei -silent -H "$HEADER" -t ~/tools/nuclei-templates/workflows/ -retries 1 -timeout 3 -c 100 -rl 100 -o $results/workflows.txt;

echo -e "\n[+] Completed...!! Results stored in: $results"
