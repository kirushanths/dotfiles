### dotfiles

#### Setup
```
# install vim 
sudo apt-get install vim
# install tmux
sudo apt-get install tmux
# install silver_searcher
# https://github.com/ggreer/the_silver_searcher)
```
#### Install
```
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
```
cd ~/dotfiles/.vim/bundle
git submodule add <GIT_REPO_URL>
```
