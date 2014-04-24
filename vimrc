set nocompatible

set backspace=indent,eol,start

set mouse=a

set autoindent

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

" Increment/decrement characters, too!
set nrformats+=alpha

" Well this is nice.
set rnu
set nu

" Vundle is just so darn convenient.
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" The futuuuuuuurrreeeeee
set ttyfast

set lazyredraw

Bundle 'gmarik/vundle'

" Each and every one is a little bundle of joy.
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'phleet/vim-arcanist'
Bundle 'leafgarland/typescript-vim'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'mattn/emmet-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'kshenoy/vim-signature'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/vitality.vim'
Bundle 'sjl/clam.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'markcornick/vim-vagrant'
Bundle 'juvenn/mustache.vim'
Bundle 'rosenfeld/conque-term'
Bundle 'tomtom/tlib_vim'
Bundle 'tomtom/viki_vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'bmchrist/a.vim'
Bundle 'pct/present.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'altercation/vim-colors-solarized'
Bundle 'evidens/vim-twig'
Bundle 'Keithbsmiley/investigate.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdcommenter'

" tpope's my hero
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-sleuth'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Dat color scheme
set background=dark
colorscheme solarized
highlight ColorColumn ctermbg=7
highlight ColorColumn guibg=Gray

set laststatus=2
set encoding=utf-8

filetype plugin indent on
syntax on

set splitbelow
set splitright

" Let's show a little more when scrolling, eh?
set scrolloff=5

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

"nmap <Space> :
"vmap <Space> :

"""""""""""
""" Leaders
"""""""""""

" Set leader
let mapleader = "-"
let mapleader = "\<Space>"
let maplocalleader = "\\"

" Easy tab creation
nmap <Leader>t :tabnew<CR>

" Easy splits
nmap <Leader>V :vsp<CR>
nmap <Leader>H :sp<CR>

" Pasting is so much nicer when formatting is preserved.
set pastetoggle=<F2>
nmap <Leader>p <F2>

" Split resizing
nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>= :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Yay emmet
nmap <TAB> <c-y>,

" Easy .c(pp)/.h switching
nmap <leader>a :A<CR>

" Toggle hlsearch
let hlstate=0
nmap <Leader>s :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<CR>

" Quick buffer switching
nmap <Leader>bn :bnext<CR>

" Dash search
nmap <silent> <Leader>d <Plug>DashSearch

" Reload vimrc
map <silent> <Leader>R :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" For iTerm2
nmap ✠ <C-CR>

" Brief crosshairs on the cursor
function! CursorPing()
	set cursorline cursorcolumn
	redraw
	sleep 100m
	set nocursorline nocursorcolumn
endfunction
nmap <Leader><Leader> :call CursorPing()<CR>

" Dat whitespace
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/\n\{3,}/\r\r/e

" More than a now-arbitrary limit is bad, you know.
set colorcolumn=81

" Show whitespace
set listchars=tab:▸\ ,eol:¬
nmap <Leader>l :set list!<CR>

set ttimeout ttimeoutlen=0

" Remember last location in file
set viminfo='10,\"100,:20,%,n~/.viminfo'

" All the colors
set t_Co=256

let g:investigate_use_dash=1

autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

" NERDTree stuff
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Expansions
iab #i #include
iab #d #define

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

" Machine-specific configs
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
