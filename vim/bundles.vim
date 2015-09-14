if &compatible
  set nocompatible
end

filetype off
call plug#begin('~/.vim/plugged')

Plug 'gmarik/vundle'

" Each and every one is a little bundle of joy.
Plug 'bling/vim-airline'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/syntastic'
Plug 'sjl/vitality.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'bmchrist/a.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'lilydjwg/colorizer'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Syntax and Theming
Plug 'wting/rust.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'evidens/vim-twig'
Plug 'guns/vim-clojure-static'
Plug 'jelera/vim-javascript-syntax'
Plug 'digitaltoad/vim-jade'
Plug 'leafgarland/typescript-vim'
Plug 'dougireton/vim-chef'
Plug 'w0ng/vim-hybrid'
Plug 'markcornick/vim-vagrant'
Plug 'solarnz/thrift.vim'
Plug 'flazz/vim-colorschemes'
Plug 'gilgigilgil/anderson.vim'

" tpope's my hero
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-dispatch'

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

call plug#end()

filetype on
