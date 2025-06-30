---
tags:
- tools
- nmap
---
#  NMap

![](img/logo.jpg){.center width="20%"}

Nmap ("Network Mapper") is a free and open source (license) utility for network discovery and security auditing. Many systems and network administrators also find it useful for tasks such as network inventory, managing service upgrade schedules, and monitoring host or service uptime. Nmap uses raw IP packets in novel ways to determine what hosts are available on the network, what services (application name and version) those hosts are offering, what operating systems (and OS versions) they are running, what type of packet filters/firewalls are in use, and dozens of other characteristics. It was designed to rapidly scan large networks, but works fine against single hosts.

- [Nmap Download](https://nmap.org/download.html)
- [Nmap Manual](https://nmap.org/book/man.html) for creating commands

## Nmap Cheat Sheets
- [Nmap Basics](docs/romelsan_nmap-basics.pdf)
- [SANS Nmap Cheatsheet v1.0](docs/NmapCheatSheetv1.0.pdf)
- [See Security Technologies Nmap Cheatsheet v1.0](docs/nmapcheatsheet.pdf)

## Options

| Options                    | Description |
| -------------------------- | ----------------------------------- |
| `-O`                       | Enable Operating System Detection |
| `-sV`                      | Version Scan |
| `-sS`                      | TCP Port Scan |
| `-SU`                      | UDP Port Scan |
| `-p 20-25`                 | Scan Ports 20-25 |
| `-pU:53,U:110,T20-445`     | Mix TCP UDP Port Scan |
| `-F`                       | Fast (limited Port Scan) |

## Ports

| Port                | Description |
| ------------------- | ------------------------------- |
| `22`                | SSH |
| `80`                | HTTP |
| `443`               | HTTPS |
| `3389`              | RDP (Remote Desktop Protocol) |
| `5800`              | Java VNC |
| `5900`              | Native VNC |
| `11444`             | Secomea SiteManager Port |
| `55000 - 59999`     | Secomea Goto Appliances Port |


## Commands

## Basic scanning
``` bash
nmap target.host.com                     # scan one host
nmap 10.11.12.22

nmap target1.host.com target2.host.com   # scan multiple hosts
nmap 10.11.12.22 10.11.12.1

nmap -iL list.txt                        # scan targets from a list

nmap 10.11.12.0-50                       # scan a range of hosts

nmap 10.11.12.0/24                       # scan an entire subnet

nmap -iR 100                             # scan 100 random hosts

nmap 10.11.12.* --exclude 10.11.12.5     # exclude specific hosts
nmap 10.11.12.* --excludefile exclude.txt

nmap -A target.host.com                  # aggressive scan (OS, version, scripts, traceroute)

nmap -6 ipv6.target.host                 # scan IPv6 target
```

## Discovery Options$
``` bash
nmap -sP 10.11.12.0/24                   # ping scan only

nmap -PN target.host.com                 # skip host discovery (treat as up)

nmap -PS target.host.com                 # TCP SYN ping
nmap -PA target.host.com                 # TCP ACK ping
nmap -PU target.host.com                 # UDP ping
nmap -PY target.host.com                 # SCTP INIT ping

nmap -PE target.host.com                 # ICMP echo ping
nmap -PP target.host.com                 # ICMP timestamp ping
nmap -PM target.host.com                 # ICMP address-mask ping
nmap -PO target.host.com                 # IP protocol ping
nmap -PR 10.11.12.0/24                   # ARP ping (local network)

nmap --traceroute target.host.com        # traceroute
nmap -R target.host.com                  # force reverse DNS resolution
nmap -n target.host.com                  # disable DNS resolution
nmap --system-dns target.host.com        # use system DNS
nmap --dns-servers 8.8.8.8,1.1.1.1 target.host.com

nmap -sL 10.11.12.*                      # list hosts without scanning
```

## Firewall Evasion Techniques
```bash
nmap -f target.host.com                  # fragment packets
nmap --mtu 24 target.host.com            # specify MTU

nmap -D RND:10 target.host.com           # decoy scan with 10 random decoys

nmap -sI zombie.host.com target.host.com # idle zombie scan

nmap --source-port 53 target.host.com    # spoof source port (DNS)
nmap --data-length 200 target.host.com   # append random data
nmap --randomize-hosts 10.11.12.*        # randomize host scan order
nmap --spoof-mac 0 target.host.com       # spoof MAC (random vendor)
nmap --badsum target.host.com            # send bad checksums
```

## Version & OS Detection
```bash
nmap -O target.host.com                  # OS detection
nmap -O --osscan-guess target.host.com   # aggressive OS detection

nmap -sV target.host.com                 # service version detection
nmap -sV --version-trace target.host.com # debug version detection

nmap -sR target.host.com                 # RPC service scan
```

## Output options
```bash
nmap -oN scan.txt target.host.com         # normal text output
nmap -oX scan.xml target.host.com         # XML output
nmap -oG scan.gnmap target.host.com       # grepable output
nmap -oA scan_prefix target.host.com      # output in all major formats
nmap --stats-every 10s target.host.com    # display stats every 10 seconds
nmap -oS leet_scan.txt target.host.com    # 1337-style ASCII output
```
