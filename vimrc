set nocompatible
set backspace=indent,eol,start

set mouse=a
set nohlsearch

color kib_darktango

"set autoindent
"set smartindent
set cindent

set tabstop=2
set shiftwidth=2

set incsearch

set nofoldenable

set noshowmode

let mapleader = ","

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-powerline'
Bundle 'phleet/vim-arcanist'
Bundle 'myusuf3/numbers.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'Shougo/unite.vim'

set rnu

set laststatus=2
set encoding=utf-8
syntax on

set scrolloff=5

set pastetoggle=<F2>
nmap <c-v> <F2>

nnoremap <leader>b :b#<CR>

set directory=/tmp

set autoread

set shiftround

nmap <S-k> <S-{>
nmap <S-j> <S-}>
vmap <S-k> <S-{>
vmap <S-j> <S-}>

nmap <S-=> <c-w><S-=>
nmap <S--> <c-w><S-->
vmap <S-=> <c-w><S-=>
vmap <S--> <c-w><S-->

set colorcolumn=80

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
