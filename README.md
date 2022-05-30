# Sploit3NUM
**A standalone bash script which takes output of nmap (including web title) to find the relevant exploits in local exploitDB/Searchsploit and in metasploit location.**

**Reason to use this tool?**
- This reduces the effort to manually copy-paste or type the results from nmap output and search them in SearchsploitDB.

> **Aimed for OSCP. No auto exploitation. No violation of tool restrictions.**

**Why I made this?**
- For easing the process of exploit search in OSCP exam.
- I didn't wanted to copy-paste output from nmap results and webpages and search them in SearchsploitDB.
- There are still many modules and exploits which searchsploit can't find.

### Tested on
- Kali Linux 2021.3 (PWK VM)

### Prerequisite
- exploitdb

### Download / Config
```
wget "https://raw.githubusercontent.com/akashJx/Sploit3NUM/main/sploit.sh"

sudo cp sploit.sh /usr/local/bin/

sudo chmod a+x /usr/local/bin/sploit.sh
```

### Usage
```
$ sh sploit.sh                          

Usage: 
  sploit.sh nmap-output
  sploit.sh rustscan-output
  sploit.sh rustscan-output | tee sploit.log
  
Example:
  sh sploit.sh nmap.log
  sh sploit.sh rustscan.log
```

### Screenshot
- Screenshot taken with results of rustscan from PG-Practice Machine Clyde.
![[Pasted image 20220530142606.png]]
![[Pasted image 20220530142707.png]]
![[Pasted image 20220530142746.png]]

---

**My Discord :** akashx#4733

DM to discuss about this tool / about improvements. 

---
