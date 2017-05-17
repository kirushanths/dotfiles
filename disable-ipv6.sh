# Should also have IP6tables edits...

sudo vim /etc/sysctl.conf
# Add following lines to end of the file
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
# save and exit

# load new config
sudo sysctl -p
