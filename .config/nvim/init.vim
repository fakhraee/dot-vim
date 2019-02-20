set nocompatible
command W w !sudo tee % > /dev/null

" file
filetype off
filetype plugin indent on
filetype plugin on

" ident, tab and 80 column
set tabstop=2		"Tab is 4 spaces in length."
set shiftwidth=2	"Indentation is 4 spaces in length."
set expandtab		"Inserts space chars instead of tab."
set softtabstop=2	"Spaces in place of tabs still behave like tabs"
set smarttab
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set backspace=indent,eol,start
match ErrorMsg '\%>80v.\+'

" syntax
syntax on
syntax enable
set background=dark

" search
set ignorecase
set smartcase
set hlsearch
set incsearch 

"
set encoding=utf8
set ffs=unix,dos,mac

" backup
set nobackup
set nowb
set noswapfile

" status
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" netrw
let g:netrw_banner=0
let g:netrw_browse_split=1

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" fold functions in bash
" zR: unfold all
" zM: fold all
" zo: unfold this
" zc: fold this
let g:sh_fold_enabled=1
