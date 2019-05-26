" curtsey of https://github.com/mhartington/dotfiles/

" plugins  ------------------------------------------------------------------{{{
" setup dein begin {{{

  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))

  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('wsdjeg/dein-ui.vim')

"}}}

" system {{{
  " Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
  call dein#add('Raimondi/delimitMate')

  " sensible.vim: Defaults everyone can agree on
  call dein#add('tpope/vim-sensible')

  " Vim support for editing fish scripts
  call dein#add('dag/vim-fish')

  " Plugin to move lines and selections up and down
  call dein#add('matze/vim-move')

  " vimscript for gist
  call dein#add('mattn/webapi-vim')
  call dein#add('mattn/gist-vim')

  " True Sublime Text style multiple selections for Vim
  call dein#add('terryma/vim-multiple-cursors')
"" }}}

" UI {{{
  " Dark powered shell interface for NeoVim and Vim8.
  call dein#add('Shougo/deol.nvim')

  " The dark powered file explorer implementation
  call dein#add('Shougo/defx.nvim')
  call dein#add('kristijanhusak/defx-git')

  " A light and configurable statusline/tabline plugin for Vim
  call dein#add('itchyny/lightline.vim')

  " A vim plugin to display the indention levels with thin vertical lines
  call dein#add('Yggdroot/indentLine')

  " Vim plugin for selectively illuminating other uses of the word under the cursor
  call dein#add('RRethy/vim-illuminate')

  " Oceanic Next theme for neovim
  call dein#add('mhartington/oceanic-next')

  " Retro groove color scheme for Vim
  call dein#add('morhetz/gruvbox')

  " All the world's indeed a stage and we are merely players
  call dein#add('junegunn/limelight.vim')

  " Distraction-free writing in Vim
  call dein#add('junegunn/goyo.vim')
" }}}

" code style {{{
  " A (Neo)vim plugin for formatting code.
  call dein#add('sbdchd/neoformat')
" }}}

" completion {{{
  " Dark powered asynchronous completion framework for neovim/Vim8
  call dein#add('Shougo/deoplete.nvim')
" }}}

" denite {{{
  " Dark powered asynchronous unite all interfaces for Neovim/Vim8
  call dein#add('Shougo/denite.nvim')

  " Freaky fast fuzzy finder for (denite.nvim/CtrlP matcher) for vim/neovim
  if empty(glob("/usr/bin/rg"))
    echo "install ripgrep package"
  endif
  call dein#add('raghur/fruzzy', {'hook_post_update': 'call fruzzy#install()'})

  " MRU plugin includes unite.vim/denite.nvim MRU sources
  call dein#add('Shougo/neomru.vim')

  " Manger list of git objects with interface of denite.nvim
  call dein#add('neoclide/denite-git')

  " denite.nvim plugin for show and browse Gist
  call dein#add('pocari/vim-denite-gists')
  call dein#add('tyru/open-browser.vim')
  call dein#add('pocari/vim-denite-kind-open-browser')
" }}}

" snippets {{{
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('honza/vim-snippets')
" }}}

" markdown {{{
  " Fold markdown documents by section.
  call dein#add('nelstrom/vim-markdown-folding', {'on_ft': 'markdown'})

  " Vim plugin for Markdown : convert to HTML & realtime preview
  call dein#add('kurocode25/mdforvim')
" }}}

" python{{{
  "call dein#add('zchee/deoplete-jedi')
  "call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})
  "call dein#add('tmhedberg/SimpylFold', {'on_ft': 'python'})
" }}}

" go {{{
  "call dein#add('fatih/vim-go')
  "call dein#add('zchee/deoplete-go', {'build': 'make'})
" }}}

" I couldn't get to work {{{
  " call dein#add('junegunn/vim-easy-align')
" }}}

" setup dein end {{{
  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif

  call dein#end()
  filetype plugin indent on
" }}}

" }}}


" system settings  ----------------------------------------------------------{{{
  " highligh cursor
  set cursorline

  " leader is ,
  let mapleader = ','

  " highlight longer than 80
  match ErrorMsg '\%>80v.\+'

  if exists('g:GuiLoaded')
    Guifont Hasklig:h15
  endif

  " neovim Settings
  set termguicolors
  set mouse=c
  " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
  set clipboard+=unnamedplus
  set pastetoggle=<f6>
  set nopaste
  set hidden
  autocmd BufWritePre * %s/\s\+$//e
  set noshowmode
  set noswapfile
  filetype on
  " set  number
  " set numberwidth=1
  set tabstop=2 shiftwidth=2 expandtab
  set conceallevel=0
  set virtualedit=
  set wildmenu
  set laststatus=2
  set wrap linebreak nolist
  set wildmode=full
  set autoread
  set updatetime=500
  set fillchars+=vert:│
  " set numberwidth=5

  " remember cursor position between vim sessions
  autocmd BufReadPost *
             \ if line("'\"") > 0 && line ("'\"") <= line("$") |
             \   exe "normal! g'\"" |
             \ endif
             " center buffer around cursor when opening files
  autocmd BufRead * normal zz
  set complete=.,w,b,u,t,k
  autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
  autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
  set formatoptions+=t
  set inccommand=nosplit
  set shortmess=atIc
  set isfname-==
  " set spell
  let g:indentLine_color_gui = '#343d46'
  " set scrolloff=999
  " set sidescrolloff=999
  " let g:indentLine_char="⎸"

  "let g:clipboard = {
  "\ 'name': 'pbcopy',
  "\ 'copy': {
  "\    '+': 'pbcopy',
  "\    '*': 'pbcopy',
  "\  },
  "\ 'paste': {
  "\    '+': 'pbpaste',
  "\    '*': 'pbpaste',
  "\ },
  "\ 'cache_enabled': 0,
  "\ }
" }}}


" system mappings  ----------------------------------------------------------{{{
  " this is the best, let me tell you why
  " how annoying is that everytime you want to do something in vim
  " you have to do shift+; to get :, can't we just do ;?
  " plus what does ; do anyways??
  " if you do have a plugin that needs ;, you can just swap the mapping
  " nnoremap : ;
  " give it a try and you will like it
  nnoremap ; :

  " new tab
  map <Leader>t :tabnew<cr>

  " close tab
  map <Leader>w :tabclose<cr>

  " light on/off
  map <Leader>! :Limelight!!0.9<cr>

  " distraction free
  map <Leader>` :Goyo<cr>

  " no need for ex mode
  nnoremap Q <nop>
  vnoremap // y/<C-R>"<CR>

  " recording macros is not my thing
  map q <Nop>

  " exit insert, dd line, enter insert
  inoremap <c-d> <esc>ddi

  " navigate between display lines
  nnoremap <silent><expr> k      v:count == 0 ? 'gk' : 'k'
  nnoremap <silent><expr> j      v:count == 0 ? 'gj' : 'j'
  vnoremap <silent><expr> k      v:count == 0 ? 'gk' : 'k'
  vnoremap <silent><expr> j      v:count == 0 ? 'gj' : 'j'
  nnoremap <silent><expr> <Up>   v:count == 0 ? 'gk' : 'k'
  nnoremap <silent><expr> <Down> v:count == 0 ? 'gj' : 'j'
  noremap  <silent> <Home> g<Home>
  noremap  <silent> <End>  g<End>
  inoremap <silent> <Home> <C-o>g<Home>
  inoremap <silent> <End>  <C-o>g<End>

  " copy current files path to clipboard
  nmap cp :let @+= expand("%") <cr>

  " neovim terminal mapping
  " terminal 'normal mode'
  tmap <esc> <c-\><c-n><esc><cr>

  " exit insert, dd line, enter insert
  inoremap <c-d> <esc>ddi
  noremap H ^
  noremap L g_
  noremap J 5j
  noremap K 5k
  " nnoremap K 5k

  inoremap <c-f> <c-x><c-f>
  " copy to osx clipboard
  "vnoremap <C-c> "*y<CR>
  "vnoremap y "*y<CR>
  "noremap Y y$
  "vnoremap y myy`y
  "vnoremap Y myY`y
  "let g:multi_cursor_next_key='<C-n>'
  "let g:multi_cursor_prev_key='<C-p>'
  "let g:multi_cursor_skip_key='<C-x>'
  " let g:multi_cursor_quit_key='<Esc>'

  " align blocks of text and keep them selected
  vmap < <gv
  vmap > >gv
  nnoremap <leader>d "_d
  vnoremap <leader>d "_d
  vnoremap <c-/> :TComment<cr>
  nnoremap <silent> <esc> :noh<cr>
  nnoremap <leader>e :call <SID>SynStack()<CR>

  "vnoremap <leader>ga <Plug>(EasyAlign)
"}}}"


" themes, commands, etc  ----------------------------------------------------{{{
  syntax on

  " set theme based on daylight
  if strftime('%H') >= 7 && strftime('%H') < 14
    colorscheme OceanicNext
  else
    colorscheme gruvbox
  endif

  let g:one_allow_italics = 1
  let g:oceanic_next_terminal_bold = 1
  let g:oceanic_next_terminal_italic = 1
  " set pumblend=50

  let g:Illuminate_ftblacklist = ['nerdtree', 'gitconfig','gina-blame', 'defx', 'fugitive', 'git']

  set list
  set listchars=tab:‣\ ,trail:·

  " lightline
  " let g:lightline = {'colorscheme': 'solarized'}
"}}}


" code formatting -----------------------------------------------------------{{{
  " ,f to format code, requires formatters: read the docs
  noremap <silent> <leader>f :Neoformat<CR>
  let g:standard_prettier_settings = {
              \ 'exe': 'prettier',
              \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--single-quote'],
              \ 'stdin': 1,
              \ }
    let g:neoformat_zsh_shfmt = {
              \ 'exe': 'shfmt',
              \ 'args': ['-i ' . shiftwidth()],
              \ 'stdin': 1,
              \ }
  let g:neoformat_enabled_zsh = ['shfmt']
  let g:neoformat_try_formatprg = 1
" }}}


" fold, gets it's own section  ----------------------------------------------{{{
  function! MyFoldText() " {{{
      let line = getline(v:foldstart)
      let nucolwidth = &fdc + &number * &numberwidth
      let windowwidth = winwidth(0) - nucolwidth - 3
      let foldedlinecount = v:foldend - v:foldstart

      " expand tabs into spaces
      let onetab = strpart('          ', 0, &tabstop)
      let line = substitute(line, '\t', onetab, 'g')

      let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
      " let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines')
      " let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines   ')
      let fillcharcount = windowwidth - len(line)
      " return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . ' Lines'
      return line . '…'. repeat(" ",fillcharcount)
  endfunction " }}}

  set foldtext=MyFoldText()

  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

  " autocmd FileType vim setlocal fdc=1
  set foldlevel=99

  " space to toggle folds.
  nnoremap <Space> za
  vnoremap <Space> za
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevel=0

  autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99

  autocmd FileType css,scss,json setlocal foldmethod=marker
  autocmd FileType css,scss,json setlocal foldmarker={,}

  autocmd FileType coffee setl foldmethod=indent
  let g:xml_syntax_folding = 1
  autocmd FileType xml setl foldmethod=syntax

  autocmd FileType html setl foldmethod=expr
  autocmd FileType html setl foldexpr=HTMLFolds()

  " autocmd FileType javascript,typescript,json setl foldmethod=syntax
  autocmd FileType javascript,typescript,typescript.tsx,json setl foldmethod=syntax

  " fish
  autocmd FileType fish setl foldmethod=expr
" }}}


" denite --------------------------------------------------------------------{{{
  let s:menus = {}
  call denite#custom#option('_', {
        \ 'prompt': '❯',
        \ 'winheight': 10,
        \ 'updatetime': 1,
        \ 'auto_resize': 0,
        \ 'highlight_matched_char': 'Underlined',
        \ 'highlight_mode_normal': 'CursorLine',
        \ 'reversed': 1,
        \ 'auto-accel': 1,
        \})
  call denite#custom#option('TSDocumentSymbol', {
        \ 'prompt': ' @' ,
        \})
  call denite#custom#option('TSWorkspaceSymbol', {
        \ 'prompt': ' #' ,
        \})

  call denite#custom#source('file/rec', 'vars', {
        \'command': ['rg', '--files', '--glob', '!.git'],
        \'matchers': ['matcher/fruzzy'],
        \'sorters':['sorter_sublime'],
        \})
        " \'matchers': ['matcher/cpsm']
  let fruzzy#usenative = 1
  "     \ 'command': ['ag', '--follow','--nogroup','--hidden', '--column', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'node_modules'

 call denite#custom#source('grep', 'vars', {
        \'command': ['rg'],
        \'default_opts': ['-i', '--vimgrep'],
        \'recursive_opts': [],
        \'pattern_opt': [],
        \'separator': ['--'],
        \'final_opts': [],
        \'matchers': ['matcher/ignore_globs', 'matcher/regexp', 'matcher/pyfuzzy']
        \})

  nnoremap <silent> <c-p> :Denite file/rec<CR>
  nnoremap <silent> <leader>a :Denite grep:::!<CR>
  nnoremap <silent> <leader>b :Denite buffer<CR>
  nnoremap <silent> <leader>c :Denite -auto-preview colorscheme<CR>
  nnoremap <silent> <leader>g :Denite gitlog<CR>
  nnoremap <silent> <leader>h :Denite help<CR>
  nnoremap <silent> <Leader>i :Denite menu:ionic <CR>
  nnoremap <silent> <leader>l :Denite line<CR>
  nnoremap <silent> <leader>u :DeinUpdate<CR>
  nnoremap <silent> <leader>v :Denite vison<CR>
  call denite#custom#map('insert','<C-n>','<denite:move_to_next_line>','noremap')
  call denite#custom#map('insert','<C-p>','<denite:move_to_previous_line>','noremap')
  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
  call denite#custom#var('menu', 'menus', s:menus)
"}}}


" defx ----------------------------------------------------------------------{{{
  map <silent> - :call OpenDefx()<cr>
  let g:defx_open_path = getcwd()
  function! OpenDefx() abort
    if isdirectory(expand('%:p:h'))
      let g:defx_open_path = expand('%:p:h')
    endif
    execute('Defx
      \ -buffer-name=""
      \ -split=vertical
      \ -winwidth=25
      \ -direction=topleft
      \ -toggle
      \ -resume
      \ `g:defx_open_path`')
  endfunction

  autocmd FileType defx call s:defx_my_settings()
  function! s:defx_my_settings() abort
    IndentLinesDisable
    setl nospell
    setl signcolumn=no
    setl nonumber
    nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
    nnoremap <silent><buffer><expr> C defx#do_action('copy')
    nnoremap <silent><buffer><expr> P defx#do_action('paste')
    nnoremap <silent><buffer><expr> M defx#do_action('rename')
    nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
    nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
    nnoremap <silent><buffer><expr> R defx#do_action('redraw')
  endfunction

  let g:defx_git#show_ignored = 0
  let g:defx_git#raw_mode = 1
  let g:defx_git#column_length =2

  hi def link Defx_filename_directory NERDTreeDirSlash
  hi def link Defx_git_Modified Special
  hi def link Defx_git_Staged Function
  hi def link Defx_git_Renamed Title
  hi def link Defx_git_Unmerged Label
  hi def link Defx_git_Untracked Tag
  hi def link Defx_git_Ignored Comment
"  }}}


" nvim terminal -------------------------------------------------------------{{{
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  autocmd BufEnter term://* startinsert
  autocmd TermOpen * set bufhidden=hide
" }}}


" snipppets -----------------------------------------------------------------{{{
  " enable snipMate compatibility feature.
  let g:neosnippet#enable_completed_snippet=0
  let g:neosnippet#enable_snipmate_compatibility=0
  " let g:neosnippet#enable_conceal_markers=0
  " let g:neosnippet#snippets_directory='~/GitHub/ionic-snippets'
  " let g:neosnippet#expand_word_boundary = 1
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " superTab like snippets behavior.
  "   imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  "   \ "\<Plug>(neosnippet_expand_or_jump)"
  "   \: pumvisible() ? "\<C-n>" : "\<TAB>"
  "   smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  "   \ "\<Plug>(neosnippet_expand_or_jump)"
  "   \: "\<TAB>"
"}}}


" deoplete ------------------------------------------------------------------{{{
  " enable deoplete
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_delay = 0
  let g:echodoc_enable_at_startup=1
  let g:echodoc#type="virtual"
  set splitbelow
  set completeopt+=menuone,noinsert,noselect
  set completeopt-=preview
  autocmd CompleteDone * pclose

  function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete=2
  endfunction
  function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete=0
  endfunction
  let g:deoplete#file#enable_buffer_path=1
  " call deoplete#custom#source('buffer', 'mark', 'ℬ')
  " call deoplete#custom#source('tern', 'mark', '')
  " call deoplete#custom#source('omni', 'mark', '⌾')
  " call deoplete#custom#source('file', 'mark', '')
  " call deoplete#custom#source('jedi', 'mark', '')
  " call deoplete#custom#source('neosnippet', 'mark', '')
  " call deoplete#custom#source('LanguageClient', 'mark', '')
  " call deoplete#custom#source('typescript',  'rank', 630)
  " call deoplete#custom#source('_', 'matchers', ['matcher_cpsm'])
  " call deoplete#custom#source('_', 'sorters', [])
  let g:deoplete#omni_patterns = {
        \ 'html': '',
        \ 'css': '',
        \ 'scss': ''
        \}
  function! Preview_func()
    if &pvw
      setlocal nonumber norelativenumber
     endif
  endfunction
  autocmd WinEnter * call Preview_func()
  let g:deoplete#ignore_sources = {'_': ['around', 'buffer', 'member' ]}

  " let g:deoplete#enable_debug = 1
  " call deoplete#enable_logging('WARN', 'deoplete.log')
  " call deoplete#custom#source('typescript', 'is_debug_enabled', 1)
"}}}


" markdown ------------------------------------------------------------------{{{
  noremap <leader>TM :TableModeToggle<CR>
  let g:table_mode_corner="|"
  let g:markdown_fold_override_foldtext = 0
  let g:neomake_markdown_proselint_maker = {
      \ 'errorformat': '%W%f:%l:%c: %m',
      \ 'postprocess': function('neomake#postprocess#generic_length'),
      \}
  let g:neomake_markdown_enabled_makers = ['alex', 'proselint']
  let g:markdown_syntax_conceal = 0
  let g:mkdp_auto_start = 0
  let g:neoformat_markdown_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_markdown = ['prettier']
"}}}


" multicursor ---------------------------------------------------------------{{{
  let g:multi_cursor_exit_from_visual_mode=0
  let g:multi_cursor_exit_from_insert_mode=0
"}}}


" go ------------------------------------------------------------------------{{{
  "let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"}}}


" python --------------------------------------------------------------------{{{
  " let g:python_host_prog = '/usr/local/opt/python@2/bin/python2'
  "let g:loaded_python_provider = 0
  "let g:python3_host_prog = '/usr/bin/python3'
  "" let $NVIM_PYTHON_LOG_FILE='nvim-python.log'
  "let g:jedi#auto_vim_configuration = 0
  "let g:jedi#documentation_command = "<leader>k"
  "let g:jedi#completions_enabled = 0
  "let g:jedi#force_py_version=3
" }}}
