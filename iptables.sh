## ORDER IMPORTANT, ALL MUST BE RUN

# Drop all IPV6 Traffic
sudo ip6tables -F
sudo ip6tables -P INPUT DROP
sudo ip6tables -P OUTPUT DROP
sudo ip6tables -P FORWARD DROP

# allow all input by default
sudo iptables -P INPUT ACCEPT
# drop forward packets
sudo iptables -P FORWARD DROP
# clear out all input/output rules
sudo iptables -F INPUT
sudo iptables -F OUTPUT
# allow incoming ssh connections (optionally only allow certain ips)
sudo iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
# allow outgoing ssh connections from inside server
sudo iptables -A INPUT -i eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
# allow outgoing https connections from inside server
sudo iptables -A INPUT -i eth0 -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT
# allow outgoing http connections from inside server
sudo iptables -A INPUT -i eth0 -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT
# allow localhost to talk to localhost
sudo iptables -A INPUT -i lo -j ACCEPT
# allow outgoing ntp time syncs from inside server
sudo iptables -A INPUT -p udp --sport 123 -j ACCEPT
# allow outgoing dns lookups from inside server
sudo iptables -A INPUT -p udp -i eth0 --sport 53 -j ACCEPT
# allow incoming pings
sudo iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
# allow outgoing pings from inside server
sudo iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
# allow git port from inside server
sudo iptables -A INPUT -i eth0 -p tcp --sport 9418 -m state --state ESTABLISHED -j ACCEPT
# allow docker communications
sudo iptables -A INPUT -i docker0 -j ACCEPT
# _allow_ all outgoing traffic from server
sudo iptables -P OUTPUT ACCEPT

## Following is to catch all skipped incoming packets and log them before dropping
# create new logging table
sudo iptables -N LOGGING
# forward remaining packets from input to logging (must be at end, last rule)
sudo iptables -A INPUT -j LOGGING
# log to syslog (/var/log/syslog or similar)
sudo iptables -A LOGGING -m limit --limit 5/sec -j LOG --log-prefix "IPTables-Dropped: " --log-level 4
# drop remaiming packets after logging it
sudo iptables -A LOGGING -j DROP

# To persist the above rules (they get cleared on restart automatically)
sudo apt-get install iptables-persistent
# Installation will ask to save current setup.
# To save any new changes:
sudo sh -c 'iptables-save > /etc/iptables/rules.v4'
sudo sh -c 'ip6tables-save > /etc/iptables/rules.v6'


### EXAMPLES
## To Allow connection to a specific external ip and port
# Notice the "-I" command which inserts the rule at a specific index in INPUT (you want this before the last line of LOGGING)
sudo iptables -I INPUT 2 -p tcp -s 50.19.103.36 --sport 5000 -j ACCEPT
