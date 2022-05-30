#!/bin/bash  

# ---------------------------------
# Decoration
# BOLD
B0='\033[1m'
B1='\033[0m'

# Yellow
Yellow='\033[0;33m'

# Purple
Purple='\033[0;35m'

# Green
Green='\033[0;32m'

# Cyan
Cyan='\033[0;36m'

# No Color
NC='\033[0m'
# ---------------------------------

# Usage Banner
__usage="
Usage: 
  sploit.sh nmap-output
  sploit.sh rustscan-output
  sploit.sh rustscan-output | tee sploit.log
  
Example:
  sh sploit.sh nmap.log
  sh sploit.sh rustscan.log
"

if [ -z "$*" ]; 
	then 
		echo "$__usage"
		exit 0;
else
	printf "\n****************** ${Yellow}${B0}All services and Web Banner${B1}${NC} ******************\n"
	cat $1 | grep -v "|" | grep open | grep -vi "discovered" | awk -F "syn-ack" '{print $2}' | egrep -v "^$" > services.txt
	cat $1 | grep '_http-title:' | cut -d ':' -f2 >> services.txt
	cat services.txt
	
	
	services=./services.txt
	
	# Searchsploit Search
	echo "\n****************** ${Yellow}${B0}Local ExploitDB | Searchsploit${B1}${NC} ******************"
	while read -r line
	do
	  # echo "$line"
	  echo "\nSearching : $line"
	  echo "${Cyan}$ searchsploit $line ${NC}"
	  searchsploit $line
	done < "$services"
	
	# Metasploit ExploitDB Exploit Search
	services2=./services.txt
	
	echo "\n****************** ${Yellow}${B0}Searcing Metasploit Exloits${B1}${NC} ******************"
	while read -r line2
	do
		# echo "$line"
		echo "\nSearching : $line2"
		echo "${Cyan} grep -r -l -i $line2 /usr/share/exploitdb/exploits/ 2>error ${NC}"
		echo "Found : ""$(grep -r -l -i $line2 /usr/share/exploitdb/exploits/ 2>error | wc -l)"" Exploits"
		echo "Not found for : $(cat error | cut -f2 -d":")"
		rm error
	done < "$services2"
	
	# Metasploit Modules Search
	services3=./services.txt
	
	echo "\n****************** ${Yellow}${B0}Searcing Metasploit Modules${B1}${NC} ******************"
	while read -r line3
	do
		# echo "$line"
		echo "\nSearching : $line3"
		echo "${Cyan} grep -r -l -i $line3 /usr/share/metasploit-framework/modules 2>error ${NC}"
		echo "Found : ""$(grep -r -l -i $line3 /usr/share/metasploit-framework/modules 2>error | wc -l)"" Modules"
		echo "Not found for : $(cat error | cut -f2 -d":")"
		rm error
	done < "$services3"
fi