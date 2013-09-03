#!/bin/bash

# Get rid of old rules
sudo iptables -F
sudo iptables -X

# Accept loopback
sudo iptables -A INPUT -i lo -j ACCEPT

# Accept related and established connections
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow SSH, HTTP, and HTTPS
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 49621 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 8000 -j ACCEPT

# Allow ICMP
sudo iptables -A INPUT -p icmp --icmp-type 8 -s 0/0 -m state --state NEW,ESTABLISHED -j ACCEPT

# Allow mosh
sudo iptables -A INPUT -p udp -m multiport --dports 60000:61000 -j ACCEPT

# Drop INPUT and FORWARD, accept OUTPUT by default
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P FORWARD ACCEPT

# Clear sudo
sudo -k
