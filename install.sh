#!/bin/bash



bold="\e[1m"
red="\e[1;31m"
green="\e[32m"
blue="\e[34m"
cyan="\e[0;36m"
end="\e[0m"

echo -e "${bold}${red}\n[+] ${end}${cyan}Installing base Dependencies..!!${end}"
sudo apt-get update;
sudo apt-get upgrade -y;
sudo apt install -y libpcap-dev;
sudo apt-get install python3 -y;
sudo apt-get install python3-pip -y;
sudo apt-get install -y python-pip -y;
sudo apt-get install ruby -y;
sudo apt-get install jq -y;
sudo apt-get install screen -y;
sudo apt install nmap -y;
sudo pip3 install aiohttp;
sudo apt-get install git -y;
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"


mkdir ~/tools;
mkdir ~/.gf;
dir=~/tools;
mkdir ~/Trishul/templates/



echo -e "${bold}${red}\n[+] ${end}${cyan}Installing go..!!${end}"
sudo wget https://go.dev/dl/go1.20.4.linux-amd64.tar.gz;
sudo tar -xvf go1.20.4.linux-amd64.tar.gz;
sudo mv go /usr/local;
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go'	>> ~/.bashrc			
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
sudo rm -rf go1.20.4.linux-amd64.tar.gz;
sleep 2
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install subfinder
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing subfinder..!!${end}"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install assetfinder
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing assetfinder..!!${end}"
go install -v github.com/tomnomnom/assetfinder@latest
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install httpx
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing httpx..!!${end}"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install gau
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing gau..!!${end}"
go install github.com/lc/gau/v2/cmd/gau@latest
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install waybackurls
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing waybackurls..!!${end}"
go install github.com/tomnomnom/waybackurls@latest
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install gf
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing gf & Gf-Patterns..!!${end}"
go install github.com/tomnomnom/gf@latest;
git clone https://github.com/1ndianl33t/Gf-Patterns $dir/Gf-Patterns;
mv $dir/Gf-Patterns/*.json ~/.gf/;
sudo rm -r $dir/Gf-Patterns;
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install jaeles
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing jaeles & jaeles-signatures..!!${end}"
GO111MODULE=on go install github.com/jaeles-project/jaeles@latest
mkdir ~/Trishul/templates/jaeles-open-signatures;
git clone --depth=1 https://github.com/jaeles-project/jaeles-signatures ~/Trishul/templates/jaeles-open-signatures/jaeles-signatures/
jaeles config -a reload --signDir ~/Trishul/templates/jaeles-open-signatures/jaeles-signatures/
git clone https://github.com/ghsec/ghsec-jaeles-signatures.git ~/Trishul/templates/jaeles-open-signatures/ghsec-jaeles-signatures/
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install kxss
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing kxss..!!${end}"
go install github.com/Emoe/kxss@latest
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install ffuf
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing ffuf..!!${end}"
go install github.com/ffuf/ffuf/v2@latest
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install naabu
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing naabu..!!${end}"
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install findomain
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing findomain..!!${end}"
wget https://github.com/Findomain/Findomain/releases/download/4.0.1/findomain-linux
mv findomain-linux findomain
chmod +x findomain
sudo mv findomain /usr/bin
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install CORScanner
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing CORScanner..!!${end}"
git clone https://github.com/chenjj/CORScanner.git ~/tools/CORScanner
cd ~/tools/CORScanner
pip3 install -r requirements.txt
cd ~/
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"


#install dalfox
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing dalfox..!!${end}"
go install github.com/hahwul/dalfox/v2@latest
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install subzy
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing subzy..!!${end}"
go install -v github.com/LukaSikic/subzy@latest
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install anew
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing anew..!!${end}"
go install -v github.com/tomnomnom/anew@latest
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install metafinder
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing Metafinder..!!${end}"
sudo pip3 install metafinder
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install notify
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing notify..!!${end}"
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install openredirex
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing OpenRedireX..!!${end}"
git clone https://github.com/devanshbatham/OpenRedireX ~/tools/OpenRedireX/
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install paramspider
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing paramspider..!!${end}"
git clone https://github.com/devanshbatham/ParamSpider ~/tools/ParamSpider
cd ~/tools/ParamSpider/
pip3 install -r requirements.txt
cd ~/
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install git clone degoogle_hunter
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing Degoogle_hunter..!!${end}"
git clone https://github.com/six2dez/degoogle_hunter ~/tools/degoogle_hunter
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install git-hound
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing git-hound..!!${end}"
wget https://github.com/tillson/git-hound/releases/download/v1.3/git-hound_1.3_Linux_x86_64.tar.gz
tar -xvf git-hound_1.3_Linux_x86_64.tar.gz;
sudo chmod +x git-hound;
sudo mv git-hound /usr/bin;
mkdir ~/.githound;
cd ~/.githound/;
touch config.yml;
wget https://raw.githubusercontent.com/tillson/git-hound/master/config.example.yml;
cd ~/;
rm git-hound_1.3_Linux_x86_64.tar.gz LICENSE README.md;
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install JSFScan
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing JSFScan..!!${end}"
git clone https://github.com/KathanP19/JSFScan.sh.git ~/tools/JSFScan.sh
cd ~/tools/JSFScan.sh
chmod +x install.sh JSFScan.sh report.sh
./install.sh
cd ~/tools/JSFScan.sh/tools
chmod +x *
cd ~/
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install interlace
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing Interlace..!!${end}"
git clone https://github.com/codingo/Interlace.git ~/tools/Interlace
cd ~/tools/Interlace
sudo python3 setup.py install
cd ~/
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install sqlmap
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing sqlmap..!!${end}"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git ~/tools/sqlmap
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"


#install qsreplace
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing qsreplace..!!${end}"
go install github.com/tomnomnom/qsreplace@latest
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"


#install knockpy
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing knockpy..!!${end}"
git clone https://github.com/guelfoweb/knock.git ~/tools/knock/
cd ~/tools/knock/
sudo python3 setup.py install
cd ~/
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install jexboss
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing jexboss..!!${end}"
git clone https://github.com/joaomatosf/jexboss.git ~/tools/jexboss/
cd ~/tools/jexboss/
sudo pip3 install -r requires.txt
sudo pip install -r requires.txt
cd ~/
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

#install nuclei
echo -e "${bold}${red}\n[+] ${end}${cyan}Installing nuclei..!!${end}"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
git clone https://github.com/projectdiscovery/nuclei-templates ~/tools/nuclei-templates;
echo -e "${bold}${blue}\n[+] ${end}${green}Completed...!!${end}"

echo -e "${bold}${red}\n[+] ${end}${cyan}Starting Setup..!!${end}"
cd ~/Trishul/
chmod +x setup.sh
./setup.sh
cd ~/


source ~/.bashrc

echo -e "${bold}${blue}\n[+] ${end}${blue}Setup Completed...!!${end}"

echo -e "${bold}${red}\n[+] ${end}${cyan}Make sure to setup naabu NMAP command, git-hound username and password, subfinder config, notify config${end}"
