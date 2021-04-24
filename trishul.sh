#!/bin/bash


bold="\e[1m"
red="\e[1;31m"
green="\e[32m"
blue="\e[34m"
cyan="\e[0;36m"
end="\e[0m"

gpath=~/go/bin/
dir=~/Trishul/scripts

logo(){
echo -e '\e[0;36m  /###           /                              /                  ###    ';
echo -e '\e[0;36m /  ############/            #                #/                    ###   ';
echo -e '\e[0;36m/     #########             ###               ##                     ##   ';
echo -e '\e[0;36m#     /  #                   #                ##                     ##   ';
echo -e '\e[0;36m ##  /  ##                                    ##                     ##   ';
echo -e '\e[0;36m    /  ###     ###  /###   ###        /###    ##  /##  ##   ####     ##   ';
echo -e '\e[0;36m   ##   ##      ###/ #### / ###      / #### / ## / ###  ##    ###  / ##   ';
echo -e '\e[0;36m   ##   ##       ##   ###/   ##     ##  ###/  ##/   ### ##     ###/  ##   ';
echo -e '\e[0;36m   ##   ##       ##          ##    ####       ##     ## ##      ##   ##   ';
echo -e '\e[0;36m   ##   ##       ##          ##      ###      ##     ## ##      ##   ##   ';
echo -e '\e[0;36m    ##  ##       ##          ##        ###    ##     ## ##      ##   ##   ';
echo -e '\e[0;36m     ## #      / ##          ##          ###  ##     ## ##      ##   ##   ';
echo -e '\e[0;36m      ###     /  ##          ##     /###  ##  ##     ## ##      /#   ##   ';
echo -e '\e[0;36m       ######/   ###         ### / / #### /   ##     ##  ######/ ##  ### /';
echo -e '\e[0;36m         ###      ###         ##/     ###/     ##    ##   #####   ##  ##/ ';
echo -e '\e[0;36m                                                     /                    ';
echo -e '\e[0;36m                                                    /                     ';
echo -e '\e[0;36m                                                   /                      ';
echo -e '\e[0;36m                                                  /                       ';

echo -e '\e[91m		 Automated with <3 by Hitesh Patra (0xdeviner)\e[0m';
}

logo

help(){
	echo "
Usage: ./trishul.sh [options] -t target.txt -L 
Options:
	-h				Display this help message.
	-L 				Runs large scope scan.
	-M				Runs medium scope scan.
	-S				Runs small scope scan.
Target:
	-t				Specify the domains list.

Example:
	./trishul.sh -t targets.txt -L
	./trishul.sh -t small.txt -S
"
}


if [[ "$*" != *"-t"* ]]
then
	help
	exit
fi


large(){
	echo -e "${red}${bold} \n[+]${end} ${cyan}Starting large scope scan on${red}${bold}$t${end} ${cyan}...!!${end}"
    $dir/large.sh $target
    echo -e "${blue}${bold} \n[+]${end} ${green} Large Scope scan Completed...!!${end}"
}

medium(){
    echo -e "${red}${bold} \n[+]${end} ${cyan}Starting medium scope scan on ${red}${bold}$t${end} ${cyan}...!!${end}"
    $dir/medium.sh $target
    echo -e "${blue}${bold} \n[+]${end} ${green} Medium Scope scan Completed...!!${end}"
}

small(){
    echo -e "${red}${bold} \n[+]${end} ${cyan}Starting small scope scan on ${red}${bold}$t${end} ${cyan}...!!${end}"
    $dir/small.sh $target
    echo -e "${blue}${bold} \n[+]${end} ${green} Small Scope scan Completed...!!${end}"

}
while getopts ":t:eSMLh" opt; do
	case ${opt} in
		t ) target=$OPTARG
		    ;;
		e ) exclude=$OPTARG
		    ;;
		S ) small
		    ;;
		M ) medium
		    ;;
		L ) large
		    ;;
		h ) help
		    ;;
		: ) help
		    ;;
	esac
done
shift $((OPTIND -1))
