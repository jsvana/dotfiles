if &compatible
  set nocompatible
end

filetype off
call plug#begin('~/.vim/plugged')

" Fancy statusline
Plug 'vim-airline/vim-airline'

" Normally these set a separator between the statusline sections
" but you need a special font for it and I'm lazy
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Easy code commenting
Plug 'scrooloose/nerdcommenter'

" Better marks
Plug 'kshenoy/vim-signature'

" Fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" EditorConfig (http://editorconfig.org/)
Plug 'editorconfig/editorconfig-vim'

" Syntax error highlighting
"Plug 'scrooloose/syntastic'

" Best colorscheme
Plug 'w0ng/vim-hybrid'

" Maybe new best colorscheme
Plug 'jacoborus/tender'

" Live LaTeX PDF previewing
Plug 'xuhdev/vim-latex-live-preview'

" LSP support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_disable_startup_warning = 1
let g:coc_start_at_startup = 1

" Rust language support
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

call plug#end()

filetype on
