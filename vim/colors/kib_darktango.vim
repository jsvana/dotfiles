" Vim color file
" Name: kib_darktango
" Maintainer: Kib² <kib2@free.fr>
" Version: 0.3
" Last Time Modified: 01.01.2007

" Couleur du fond d'ecran
set background=dark
if version > 580
	" Pas de versions inferieures a la 5.80, mais cela
	" fait en sorte que Vim ne se plaint pas
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name="kib_darktango"

" To help you visit this page : http://www.vim.org/htmldoc/syntax.html#tag-highlight

" ======================================================
" ==================================== normal Mode:
" ======================================================
" {{{ syntax


" ==== Some constants :

" Normal : foreground and background
hi Normal	guibg=#2e3436 guifg=#d3d7cf ctermfg=grey
" ==== Titles : ?
hi Title	guifg=#4e9a06 ctermfg=green


" ==== Comments : any comment
hi Comment	guifg=#edd400 ctermfg=yellow " any comment

" ===== Constants :
hi Constants guifg=#e9b96e ctermfg=lightmagenta " any constant
hi String guifg=#729fcf ctermfg=lightblue " a string constant: "this is a string"
hi Character guifg=#3465a4 ctermfg=blue  " a character constant: 'c', '\n'
hi Number guifg=#e9b96e ctermfg=lightmagenta  " a number constant: 234, 0xff
hi Boolean guifg=#c1c144 ctermfg=lightcyan  " a boolean constant: TRUE, false
hi Float guifg=#c1c144 ctermfg=lightcyan  " a floating point constant: 2.3e10

" ===== Identifier : any variable name
hi Identifier	guifg=#f57900 ctermfg=magenta " function name (also: methods for classes)

" ===== Statements : Les mots cles de chaque language
hi Statement	guifg=#729fcf ctermfg=lightblue " par défaut
hi Conditional guifg=#4e9a06 ctermfg=green " if, then, else, endif, switch, etc.
hi Repeat guifg=#73d216 ctermfg=green " boucles for, do, while, etc.
hi Label guifg=#8ae234 ctermfg=green " case, default, etc.
hi Operator guifg=#fcaf3e ctermfg=cyan  " "sizeof", "+", "*", etc.
hi Keyword guifg=#f57900 ctermfg=magenta  " any other keyword
hi Exception guifg=#ce5c00 ctermfg=magenta  " try, catch, throw

" ==== PreProc : generic Preprocessor
hi PreProc	guifg=#eeeeec ctermfg=grey " generic Preprocessor
hi Include guifg=#eeeeec ctermfg=grey  " preprocessor #include
hi Define guifg=#eeeeec ctermfg=grey " preprocessor #define
hi Macro guifg=#eeeeec ctermfg=grey  " same as Define
hi PreCondit guifg=#eeeeec ctermfg=grey  " preprocessor #if, #else, #endif, etc.

" ==== Types : int, long, char, etc.
hi Type		guifg=#ffffff ctermfg=white  " int, long, char, etc.
hi StorageClass guifg=#ffffff ctermfg=white  " static, register, volatile, etc.
hi Structure guifg=#ffffff ctermfg=white  " struct, union, enum, etc.
hi Typedef guifg=#ffffff ctermfg=white  " A typedef

" ==== Special : any special symbol
hi Special	guifg=#eeeeec ctermfg=grey " any special symbol
hi SpecialChar guifg=#eeeeec ctermfg=grey  " special character in a constant
hi Tag guifg=#eeeeec ctermfg=grey  " you can use CTRL-] on this
hi Delimiter guifg=#eeeeec ctermfg=grey  " character that needs attention
hi SpecialComment guifg=#eeeeec ctermfg=grey  " special things inside a comment
hi Debug guifg=#eeeeec ctermfg=grey  " debugging statements

" ==== Underlined : text that stands out, liens HTML
hi Underlined	guifg=#20b0eF ctermfg=blue gui=none

" ==== Ignore :
hi Ignore guifg=#f57900 ctermfg=magenta  " left blank, hidden

" ==== Error : any erroneous construct
hi Error guifg=#f57900 ctermfg=magenta  "

" ==== Todo :
hi Todo		guibg=#ce5c00 guifg=#eeeeec ctermfg=grey " keywords TODO FIXME and XXX

" ======================================================
" ==================================== End Normal mode
" ======================================================

" ======================================================
" ==================================== Start Python Mode:
" ======================================================

" pythonStatement:
hi pythonStatement guifg=#729fcf ctermfg=lightblue
" pythonRepeat:
hi pythonRepeat guifg=#8ae234 ctermfg=green
" pythonConditional:
hi pythonConditional guifg=#73d216 ctermfg=green
" pythonPrecondit:
hi pythonPrecondit guifg=#ef2929 ctermfg=red
" pythonOperator:
hi pythonOperator guifg=#ad7fa8 ctermfg=blue
" pythonComment:
hi pythonComment guifg=#edd400 ctermfg=yellow
" pythonEscape:
hi pythonEscape guifg=#3465a4 ctermfg=blue
" pythonRawString:
hi pythonRawString guifg=#ad9361 ctermfg=cyan
" pythonBuiltin:
hi pythonBuiltin guifg=#729fcf ctermfg=lightblue
" pythonException:
hi pythonException guifg=#cc0000 ctermfg=darkgrey
" pythonFunction:
" pythonTodo:
" pythonDecorator:
" pythonString:
" pythonNumber:
" pythonSpaceError:
" pythonSync:

" ======================================================
" ==================================== End Python Mode:
" ======================================================

" {{{ groups
hi Cursor	guibg=#fcaf3e guifg=#2e3436 ctermfg=cyan
"hi CursorIM
hi Directory	guifg=#bbd0df
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit	guibg=#888a85 guifg=#2e3436 gui=none
hi Folded	guibg=#555753 guifg=#eeeeec
hi FoldColumn	guibg=#2e3436 guifg=#555753
hi LineNr	guibg=#2e3436 guifg=#c4a000
hi MatchParen	guibg=#babdb6 guifg=#2e3436
hi ModeMsg	guifg=#f57900 ctermfg=magenta
hi MoreMsg	guifg=#f57900 ctermfg=magenta
hi NonText	guibg=#2e3436 guifg=#555753
hi Question	guifg=#aabbcc
hi Search	guibg=#fce94f guifg=#c4a000
hi IncSearch	guibg=#c4a000 guifg=#fce94f
hi SpecialKey	guifg=#ce5c00
hi StatusLine	guibg=#888a85 guifg=#2e3436 gui=none
hi StatusLineNC	guibg=#888a85 guifg=#fce94f gui=none
hi Visual	guibg=#fcaf3e guifg=#ce5c00
"hi VisualNOS
hi WarningMsg	guifg=salmon
"hi WildMenu
"hi Menu
"hi Scrollbar  guibg=grey30 guifg=tan
"hi Tooltip
hi Pmenu	guibg=#babdb6 guifg=#555753
hi PmenuSel	guibg=#eeeeec guifg=#2e3436
hi CursorLine	guibg=#212628
" }}}

"  {{{ terminal

" }}}

"vim: sw=4
