#### dotfiles

```
# install vim 
sudo apt-get install vim
# install tmux
sudo apt-get install tmux
# install silver_searcher
# https://github.com/ggreer/the_silver_searcher)
```

```
git clone git@github.com:kirushanth-sakthivetpillai/dotfiles.git ~/dotfiles
# install vim plugins
git submodule update --init --recursive
ln -s ~/dotfiles/* ~/
```
