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
# without scm-breeze, rely on .bashrc aliases
cat .bashrc >> ~/.bashrc
# Get git-autocomplete
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
# install vim 
brew install vim
# install tmux
brew install tmux
# install silver_searcher
brew install the_silver_searcher
```

#### Install
```bash
git clone git@github.com:kirushanth-sakthivetpillai/dotfiles.git ~/dotfiles
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
