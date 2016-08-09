### dotfiles

#### Setup
```bash
# install vim 
sudo apt-get install vim
# install tmux
sudo apt-get install tmux
# install silver_searcher
# https://github.com/ggreer/the_silver_searcher
cd /tmp/silver_searcher
git clone https://github.com/ggreer/the_silver_searcher
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
./build.sh
sudo make install
```
#### Install
```bash
git clone git@github.com:kirushanth-sakthivetpillai/dotfiles.git ~/dotfiles
# install vim plugins
git submodule update --init --recursive

# copy files to root user directory
ln -s ~/dotfiles/* ~/

# move nginx config
cp ~/dotfiles/nginx.router /etc/nginx/sites-available/nginx.router
# enable config
ln -s /etc/nginx/sites-available/nginx.router /etc/nginx/sites-enabled/nginx.router
```

##### Add Vim Bundle
```bash
cd ~/dotfiles/.vim/bundle
git submodule add <GIT_REPO_URL>
```
