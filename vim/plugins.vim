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

" Better chef hilighting
Plug 'dougireton/vim-chef'

" Better thriftfile hilighting
Plug 'solarnz/thrift.vim'

" Best colorscheme
Plug 'w0ng/vim-hybrid'

" Arcanist inline
Plug 'jlfwong/vim-arcanist'

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

call plug#end()

filetype on
