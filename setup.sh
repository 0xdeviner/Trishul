#!/bin/bash


bold="\e[1m"
red="\e[1;31m"
green="\e[32m"
blue="\e[34m"
cyan="\e[0;36m"
end="\e[0m"


cd ~/Trishul/scripts/
sudo chmod +x *
cd ~/

mkdir ~/recon/
source ~/.bashrc
notify
subfinder

echo -e "${bold}${red}\n[+] ${end}${cyan}Moving jaeles-signatures to categorized directory..!!${end}"
mkdir ~/Trishul/templates/jaeles-open-signatures/categorized;
mkdir ~/Trishul/templates/jaeles-open-signatures/categorized/xss;

xss=~/Trishul/templates/jaeles-open-signatures/categorized/xss;

cp ~/Trishul/templates/jaeles-open-signatures/ghsec-jaeles-signatures/Dom-xss.yaml $xss/
cp ~/Trishul/templates/jaeles-open-signatures/ghsec-jaeles-signatures/js-xss.yaml $xss/
cp ~/Trishul/templates/jaeles-open-signatures/ghsec-jaeles-signatures/XSS-Via-Header.yaml $xss/
cp ~/Trishul/templates/jaeles-open-signatures/jaeles-signatures/fuzz/common/simple-xss.yaml $xss/
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

