set nocompatible

set backspace=indent,eol,start

set mouse=a

" Blasted highlighting is so obnoxious.
set nohlsearch

" Because auto and smart are no longer cool.
set cindent

" Two is good. We'll go with two.
set tabstop=2
set shiftwidth=2

" Search is now interactive!
set incsearch

" Ew, folding
set nofoldenable

" Why show mode when we've got vim-airline?
set noshowmode

" Wrapping bad.
set nowrap

" Vundle is just so darn convenient.
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" The futuuuuuuurrreeeeee
set ttyfast

Bundle 'gmarik/vundle'

" Each and every one is a little bundle of joy.
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'phleet/vim-arcanist'
Bundle 'myusuf3/numbers.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'Shougo/unite.vim'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/Tabmerge'
Bundle 'mattn/zencoding-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'kshenoy/vim-signature'
Bundle 'vim-scripts/a.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'chriskempson/base16-vim'

" Dat color scheme
color kib_darktango

" Well this is nice.
set rnu

set laststatus=2
set encoding=utf-8

syntax on

" Let's show a little more when scrolling, eh?
set scrolloff=5

" Pasting is so much nicer when formatting is preserved.
set pastetoggle=<F2>
nmap <c-v> <F2>

set directory=/tmp

set autoread

set shiftround

" Easy block movement
nmap <S-k> <S-{>
nmap <S-j> <S-}>
vmap <S-k> <S-{>
vmap <S-j> <S-}>

nmap <S-=> <c-w><S-=>
nmap <S--> <c-w><S-->
vmap <S-=> <c-w><S-=>
vmap <S--> <c-w><S-->

" Set leader
let mapleader = ","

" Easy tab creation
nmap <leader>t :tabnew<CR>

" Easy splits
nmap <leader>v :vsp<CR>
nmap <leader>h :sp<CR>

" Yay emmet
nmap <TAB> <c-y>,

" Easy .c(pp)/.h switching
nmap <leader>a :A<CR>

" Quick buffer switching
nmap <leader>bn :bnext<CR>

" More than a now-arbitrary limit is bad, you know.
set colorcolumn=81

" Show whitespace
set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>

set ttimeout ttimeoutlen=0

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>f :Unite -no-split -buffer-name=files   -start-insert file<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
