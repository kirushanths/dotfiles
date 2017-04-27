## ORDER IMPORTANT, ALL MUST BE RUN

# allow all input by default
sudo iptables -P INPUT ACCEPT
# clear out all input rules
sudo iptables -F INPUT
# allow incoming ssh connections (optionally only allow certain ips)
sudo iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
# allow outgoing ssh connections from inside server
sudo iptables -A INPUT -i eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
# allow incoming http connections
sudo iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
# allow incoming https connections
sudo iptables -A INPUT -i eth0 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
# allow outgoing https connections from inside server
sudo iptables -A INPUT -i eth0 -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT
# allow localhost to talk to localhost
sudo iptables -A INPUT -i lo -j ACCEPT
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
iptables -N LOGGING
# forward remaining packets from input to logging (must be at end, last rule)
iptables -A INPUT -j LOGGING
# log to syslog (/var/log/syslog or similar)
iptables -A LOGGING -m limit --limit 5/sec -j LOG --log-prefix "IPTables-Dropped: " --log-level 4
# drop remaiming packets after logging it
iptables -A LOGGING -j DROP
