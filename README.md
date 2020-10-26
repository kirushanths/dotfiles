### dotfiles

#### Setup (Linux)
```bash
# install git shortcut aliases
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
source ~/.bashrc
# install vim 
sudo apt-get install vim
# install tmux
sudo apt-get install tmux
# install nginx
sudo apt-get install nginx
# install silver_searcher
# https://github.com/ggreer/the_silver_searcher
cd /tmp
git clone https://github.com/ggreer/the_silver_searcher
cd /tmp/the_silver_searcher
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
./build.sh
sudo make install
```

#### Setup (MacOS)
```bash
# install git shortcut aliases
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
source ~/.bashrc
# Get git-autocomplete
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
# install vim 
brew install vim
# install tmux
brew install tmux
# install silver_searcher
brew install the_silver_searcher
```

#### Linux IPTables Secure Setup (w/ Docker Support)

Notes:
- DO NOT use UFW (doesn't work with Docker)
- Add IPTable Rules before setting up Docker

```bash
# ASSUME <remote_ip> as secure IP to reach out to Linux Box
iptables -F
iptables -A INPUT -p tcp -s <remote_ip> -j ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# RESTART docker daemon (to reinstall docker rules)

## DON"T USE THIS, IT DOESN"T SUPPORT OUTBOUND CALLS from Containers
iptables -I DOCKER-USER -i eth0 ! -s <remote_ip> -j DROP

# THIS WORKS (Source: https://kfkelvinng.github.io/2017/12/07/Firewall-Docker-with-Iptables.html)
# Default rule that created by Docker
# iptables -I DOCKER-USER -j RETURN
# Drop only incoming, allowing outgoing connection for DNS, apt-get, pip
iptables -I DOCKER-USER -i eth0 -j DROP
# Return from where we jump if it is a connection we initial (otherwise apt wouldn't work inside docker)
iptables -I DOCKER-USER -m conntrack --ctstate RELATED,ESTABLISHED -j RETURN
# Return from where we jump if it is an IP we trust (replace XXX with an IP you trust)
iptables -I DOCKER-USER -s XXX.XXX.XXX.XXX/32 -i eth0 -j RETURN
# Logging for debug (see below)
# iptables -A DOCKER-USER -j LOG
```

#### Install
```bash
git clone git@github.com:kirushanths/dotfiles.git ~/dotfiles
cd ~/dotfiles
# install vim plugins
git submodule update --init --recursive

# copy files to root user directory
cd ~/dotfiles
cp -R .vim/ ~/.vim
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf
cp nginx.* /etc/nginx/sites-available/

# without scm-breeze, rely on .bashrc aliases
cat .bashrc >> ~/.bashrc
echo "source ~/.bashrc" >> ~/.bash_profile

# enable nginx config
ln -s /etc/nginx/sites-available/nginx.drb.router /etc/nginx/sites-enabled/nginx.drb.router
ln -s /etc/nginx/sites-available/nginx.qrble.router /etc/nginx/sites-enabled/nginx.qrble.router
```

##### HOW-TO: Add Vim Bundle
```bash
cd ~/dotfiles/.vim/bundle
git submodule add <GIT_REPO_URL>
```
