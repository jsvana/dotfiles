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

" The futuuuuuuurrreeeeee
set ttyfast

set lazyredraw

if filereadable(expand("~/.vimrc.bundles"))
  source $DOTFILES/vimrc.bundles
endif

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Dat color scheme
set background=dark
colorscheme solarized
highlight ColorColumn ctermbg=7
highlight ColorColumn guibg=Gray

" For indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8
autocmd VimEnter * :IndentGuidesEnable

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

" Unload hidden buffers
function DeleteHiddenBuffers()
	let tpbl=[]
	call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
	for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
		silent execute 'bunload' buf
	endfor
endfunction

" Machine-specific configs
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
