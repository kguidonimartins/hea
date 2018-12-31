" # Setup vim
"
" First, backup if there are any vim config file
"
" ```shell
" if [ -e .vimrc ]; then mv .vimrc .vimrc_bak; fi
" if [ -e .vim ]; then mv .vim .vim_bak; fi
" ```
"
" Once you are backed up, the vundle git repository can be cloned using:
"
" ```shell
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" ```
"
" Next, create a minimal ~/.vimrc file to get things started:
"
" ```shell
" vim ~/.vimrc
" ```
"
" Launch vim and run:
"
" ```shell
" :PluginInstall
" ```
"
" # Update VIM
"
" ```shell
" sudo add-apt-repository ppa:jonathonf/vim
" sudo apt update
" sudo apt install vim
" ```

" ~/.vimrc
"

" no vi compat
set nocompatible

" filetype func off
filetype off

" initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" start- all plugins below

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jalvesaq/Nvim-R.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'henrynewcomer/vim-theme-papaya'
Plugin 'plasticboy/vim-markdown'

" stop - all plugins above
call vundle#end()

" filetype func on
filetype plugin indent on

" lightline fix
set laststatus=2

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" Always show line number:
set number
" Always wrap long lines:
set wrap
" Enable colors:
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
colorscheme papaya
let g:papaya_gui_color='blue'

" http://chrisstrelioff.ws/sandbox/2016/09/21/vim_and_vundle_on_ubuntu_16_04.html
" http://vim.wikia.com/wiki/Vim_Tips_Wiki
" https://vimawesome.com/
" https://kadekillary.work/post/nvim-r/
