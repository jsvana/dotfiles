if &compatible
  set nocompatible
end

filetype off
call plug#begin('~/.vim/plugged')

" Fancy statusline
Plug 'bling/vim-airline'

" Normally these set a separator between the statusline sections
" but you need a special font for it and I'm lazy
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Easy code commenting
Plug 'scrooloose/nerdcommenter'

" Better marks
Plug 'kshenoy/vim-signature'

" Python folding
Plug 'tmhedberg/SimpylFold'

" Don't fold docstrings
let g:SimpylFold_fold_docstring = 0

" Necessary for proper fold handling on startup
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" flake8 plugin for vim
Plug 'nvie/vim-flake8'

" Syntax error highlighting
Plug 'scrooloose/syntastic'

let g:syntastic_stl_format = "[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]"
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['flake8']

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Better chef hilighting
Plug 'dougireton/vim-chef'

" Better thriftfile hilighting
Plug 'solarnz/thrift.vim'

" Best colorscheme
Plug 'w0ng/vim-hybrid'

" Maybe new best colorscheme
Plug 'jacoborus/tender'

" Arcanist inline
Plug 'jlfwong/vim-arcanist'

" ChaiScript highlighting
Plug 'ChaiScript/vim-chaiscript'

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

call plug#end()

filetype on
