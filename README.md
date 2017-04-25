### dotfiles

#### Setup
```bash
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
#### Install
```bash
git clone git@github.com:kirushanth-sakthivetpillai/dotfiles.git ~/dotfiles
cd ~/dotfiles
# install vim plugins
git submodule update --init --recursive

# copy files to root user directory
cd ~/dotfiles
mdkir ~/.vim
ln -s .vim/ ~/.vim
ls -s .vimrc ~/.vimrc
ls -s .tmux.conf ~/.tmux.conf
ls -s nginx.router /etc/nginx/sites-available/nginx.router
# enable nginx config
ln -s /etc/nginx/sites-available/nginx.router /etc/nginx/sites-enabled/nginx.router
```

##### HOW-TO: Add Vim Bundle
```bash
cd ~/dotfiles/.vim/bundle
git submodule add <GIT_REPO_URL>
```
