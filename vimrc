set nocompatible
set backspace=indent,eol,start

set mouse=a
set nohlsearch

color kib_darktango

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-powerline'
Bundle 'phleet/vim-arcanist'
Bundle 'myusuf3/numbers.vim'

set rnu

set laststatus=2
set encoding=utf-8
syntax on

set colorcolumn=80

set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>

set ttimeout ttimeoutlen=0
