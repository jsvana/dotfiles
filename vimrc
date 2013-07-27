set nocompatible

set backspace=indent,eol,start

set mouse=a

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

set rtp+=/usr/local/Cellar/go/1.1.1/misc/vim

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
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'mattn/zencoding-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'kshenoy/vim-signature'
Bundle 'vim-scripts/a.vim'
Bundle 'chreekat/vim-paren-crosshairs'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/vitality.vim'

" Dat color scheme
"color kib_darktango
set background=dark
colorscheme vimbrant
highlight ColorColumn ctermbg=7
highlight ColorColumn guibg=Gray

" Well this is nice.
set rnu

set laststatus=2
set encoding=utf-8

filetype plugin indent on
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

" Toggle hlsearch
let hlstate=0
nmap <leader>s :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<CR>

" Quick buffer switching
nmap <leader>bn :bnext<CR>

" Boo gofmt
autocmd BufWritePre *.go Fmt

" Dat whitespace
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/\n\{3,}/\r\r/e

" More than a now-arbitrary limit is bad, you know.
set colorcolumn=81

" Show whitespace
set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>

set ttimeout ttimeoutlen=0

" Remember last location in file
set viminfo='10,\"100,:20,%,n~/.viminfo'

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Set up cursor on insert
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif
