# Setup vim

First, backup if there are any vim config file

```shell 
if [ -e .vimrc ]; then mv .vimrc .vimrc_bak; fi
if [ -e .vim ]; then mv .vim .vim_bak; fi
```

Once you are backed up, the vundle git repository can be cloned using:

```shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Next, create a minimal ~/.vimrc file to get things started:

```shell
vim ~/.vimrc
```

Launch vim and run:

```shell
:PluginInstall
```

# Update VIM

```shell
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```



