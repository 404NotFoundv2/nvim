set nocompatible


" Vim-Plug https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')

" General
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
  Plug 'davidhalter/jedi-vim'
  Plug 'zchee/deoplete-jedi', { 'for': 'python' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim'
" else
"   if has('lua')
"     Plug 'Shougo/neocomplete.vim'
"   end
" end

Plug 'SirVer/ultisnips'
Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf'                               , { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'mattn/emmet-vim'                            , { 'for': ['html', 'htmldjango', 'jinja'] }
Plug 'rking/ag.vim'                               , { 'on': [ 'Ag' ] }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'                    , { 'on': [ '<Plug>(EasyAlign)' ] }
Plug 'moll/vim-bbye'
Plug 'mbbill/undotree'                            , { 'on': [ 'UndotreeToggle' ] }
Plug 'majutsushi/tagbar'                          , { 'on': [ 'TagbarToggle' ] }
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-easytags'
Plug 'tpope/vim-dispatch'                         , { 'on': [ 'Dispatch', 'Start' ] }
Plug 'justinmk/vim-gtfo'
Plug 'junegunn/vim-peekaboo'
Plug 'epeli/slimux'                               , { 'on': [ 'SlimuxREPLSendBuffer', 'SlimuxREPLSendLine', 'SlimuxREPLSendSelection' ] }
Plug 'ap/vim-buftabline'
Plug 'dhruvasagar/vim-table-mode'                 , { 'on': [ 'TableModeToggle' ] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tmhedberg/SimpylFold'
Plug 'zhimsel/vim-stay'

" Syntax
Plug 'digitaltoad/vim-pug'                       , { 'for': ['jade'] }
Plug 'marijnh/tern_for_vim'                       , { 'for': ['javascript'], 'do': 'npm i' }
Plug 'jelera/vim-javascript-syntax'               , { 'for': ['javascript'] }
Plug 'pangloss/vim-javascript'                    , { 'for': ['javascript'] }
Plug 'moll/vim-node'                              , { 'for': ['javascript'] }
Plug 'mxw/vim-jsx'                                , { 'for': ['jsx', 'javascript.jsx'] }
Plug 'othree/html5.vim'                           , { 'for': ['html', 'htmldjango', 'jinja'] }
Plug 'Glench/Vim-Jinja2-Syntax'                   , { 'for': ['htmldjango', 'jinja'] }
Plug 'tpope/vim-markdown'                         , { 'for': ['markdown'] }
Plug 'wavded/vim-stylus'                          , { 'for': ['stylus'] }
Plug 'ap/vim-css-color'                           , { 'for': ['css', 'sass', 'scss', 'less', 'stylus'] }
Plug 'elzr/vim-json'                              , { 'for': ['json'] }
Plug 'tpope/vim-haml'                             , { 'for': ['sass', 'scss', 'haml'] }
Plug 'mustache/vim-mustache-handlebars'           , { 'for': ['mustache', 'html.handlebars'] }
Plug 'kewah/vim-cssfmt'                           , { 'on': [ 'Cssfmt', 'CssfmtVisual' ] }
Plug 'stephenway/postcss.vim'                     , { 'for': ['css'] }

" Linters & Code quality
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/syntastic'

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'reedes/vim-colors-pencil'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'geoffharcourt/one-dark.vim'
Plug 'tomasr/molokai'
Plug 'ayu-theme/ayu-vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'tpope/vim-fugitive'

" Distraction-free writing
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

call plug#end()

syntax enable
filetype plugin indent on


" Plugins settings
"================================================================================

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
end

set background=dark
let g:pencil_terminal_italics = 1
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
" colorscheme onedark
"
" Molokai used previously:
" colorscheme molokai

" Ayu colorscheme
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

highlight Comment cterm=italic gui=italic

" Airline
let g:airline_theme='murmur'

aug omnicomplete
  autocmd!
  autocmd FileType css,scss,sass,stylus,less setl omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,htmldjango,jinja,markdown setl omnifunc=emmet#completeTag
  autocmd FileType javascript,javascript.jsx,jsx setl omnifunc=tern#Complete
  autocmd FileType python setl omnifunc=pythoncomplete#Complete
  autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
aug END

if has('nvim')
  " Enable deoplete at startup and make sure the autocompletion will actually trigger
  let g:deoplete#enable_at_startup = 1
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  let g:deoplete#disable_auto_complete = 1
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

  " omnifuncs
  augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  augroup end

  " tern
  if exists('g:plugs["tern_for_vim"]')
    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature_in_pum = 1
    autocmd FileType javascript setlocal omnifunc=tern#Complete
  endif

  " deoplete tab-complete
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  " tern
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

  " let g:deoplete#auto_completion_start_length = 1
  " let g:deoplete#deoplete_omni_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})
  " let g:deoplete#deoplete_omni_patterns.javascript = '[^. \t]\.\w*'
  " set completeopt+=noinsert
else
  if has('lua')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#auto_completion_start_length = 1
    let g:neocomplete#sources#buffer#cache_limit_size = 50000
    let g:neocomplete#data_directory = $HOME.'/.vim/cache/noecompl'
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#force_omni_input_patterns = get(g:, 'neocomplete#force_omni_input_patterns', {})
    let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
  end
end

" Tab completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" JavaScript
let g:javascript_enable_domhtmlcss = 1

" JSX
" let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Syntastic
let g:syntastic_scss_checkers = ['stylelint']
let g:syntastic_css_checkers = ['stylelint']

let g:syntastic_mode_map = { "mode": "active",
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['html'] }
autocmd FileType javascript let b:syntastic_checkers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']
" ~/.dotfiles/bin/syntastic more info https://github.com/eslint/eslint/issues/1214#issuecomment-101012992 & https://github.com/scrooloose/syntastic/issues/1247#issuecomment-63020503
let g:syntastic_javascript_eslint_exec='syntastic'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '!'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3

" Remove bg color from gutter signs
highlight SyntasticErrorSign ctermbg=None guibg=None guifg=red
highlight SyntasticStyleErrorSign ctermbg=None guifg=None guifg=red
highlight SyntasticWarningSign ctermbg=None guibg=None guifg=yellow
highlight SyntasticStyleWarningSign ctermbg=None guibg=None guifg=yellow

" highlight error and warning lines
highlight SyntasticErrorLine ctermbg=None ctermfg=009 guifg=red gui=italic
highlight SyntasticStyleErrorLine ctermbg=None ctermfg=009 guifg=red gui=italic
highlight SyntasticWarningLine ctermbg=None ctermfg=003 guifg=yellow
highlight SyntasticStyleWarningLine ctermbg=None ctermfg=003 guifg=yellow

" Ag
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
  let g:ag_prg="ag --column"
endif

" Emmet
let g:user_emmet_install_global = 0
" let g:user_emmet_leader_key = '<Leader>'
let user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_next_key='<C-n>'
let g:use_emmet_complete_tag = 1
autocmd FileType html,htmldjango,jinja EmmetInstall

" Tagbar
let g:tagabar_show_linenumbers = -1
let g:tagbar_singleclick = 1
let g:tagbar_auto_open = 1

" DelimitMate
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_excluded_regions = ''

" SuperTab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabCrMapping = 1
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \ endif


" Github Auth
let g:github_user = $GITHUB_USER
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_get_multiplefile = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" File Explorer
let g:netrw_liststyle = 3
let g:netrw_banner = 0
" Next lines are taken from here https://github.com/h3xx/dotfiles/blob/master/vim/.vimrc#L543-L582
" horizontally split the window when opening a file via <cr>
let g:netrw_browse_split = 4
" preview window shown in a vertically split window.
let g:netrw_preview = 1
" split files below, right
let g:netrw_alto = 1
let g:netrw_altv = 1
let g:netrw_hide = 1

" bug workaround:
" set bufhidden=wipe in netrw windows to circumvent a bug where vim won't let
" you quit (!!!) if a netrw buffer doesn't like it
" also buftype should prevent you from :w
" (reproduce bug by opening netrw, :e ., :q)
let g:netrw_bufsettings = 'noma nomod nonu nobl nowrap ro' " default
let g:netrw_bufsettings .= ' buftype=nofile bufhidden=wipe'

" Vim Commentary
autocmd FileType jade set commentstring=//-\ %s
autocmd FileType ruby set commentstring=#\ %s
autocmd FileType htmldjango,jinja set commentstring={#\ %s\ #}

" Linewidth
let g:syntastic_python_flake8_config_file='.flake8'
let g:syntastic_python_pylint_post_args="--max-line-length=120"

" JSON
let g:vim_json_syntax_conceal = 0

" Goyo
let g:goyo_width=120

" Limelight
let g:limelight_conceal_ctermfg = 240

" Markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=json', 'ruby', 'sass', 'scss=sass', 'xml', 'html', 'python', 'stylus=css', 'less=css']

" Easytags
set tags=./.tags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
" let g:easytags_suppress_ctags_warning = 1

" gitgutter
highlight clear SignColumn
highlight GitGutterAdd ctermbg=None guifg=green
highlight GitGutterChange ctermbg=None guifg=orange
highlight GitGutterDelete ctermbg=None guifg=red
highlight GitGutterChangeDelete ctermbg=None guifg=DarkRed
set signcolumn=yes
let g:gitgutter_eager = 0
" let g:gitgutter_realtime = 0

" Undotree
let g:undotree_WindowLayout= 2
let g:undotree_SplitWidth= 50
let g:undotree_SetFocusWhenToggle= 1

" Peekaboo
let g:peekaboo_window = 'vertical botright 60new'

" Tern
let g:tern_show_argument_hints = 'on_move'
let g:tern_show_signature_in_pum = 1

" Buftabline
let g:buftabline_indicators=1

" Settings
"================================================================================
" Dynamically getting the fg/bg colors from the current colorscheme, returns hex which is enough for me to use in Neovim
" Needs to figure out how to return cterm values too
let fgcolor=synIDattr(synIDtrans(hlID("Normal")), "fg", "gui")
let bgcolor=synIDattr(synIDtrans(hlID("Normal")), "bg", "gui")

" Tabline/Buffer line
set showtabline=2
set tabline="%1T"
" reverse hybrid tabline colors
if g:colors_name == 'hybrid'
  highlight TabLineFill cterm=none gui=none
  highlight TabLine cterm=none gui=none
  " This doesn't work, odd!
  " highlight TabLineSel ctermfg=black ctermfg=white guibg=fgcolor guifg=bgcolor
  highlight TabLineSel ctermfg=black ctermfg=white guibg=#c5c8c6 guifg=#1d1f21
  highlight BufTabLineActive cterm=none gui=none
endif

" UI Configs
"-----------------
" number of visual spaces per TAB
set tabstop=2
" insert mode tab and backspace, number of spaces in tab when editing
set softtabstop=2
" expand tabs to spaces
set expandtab
" normal mode indentation commands use 2 spaces
set shiftwidth=2
set autoindent
set shiftround

" For python files set tab to 4 spaces
autocmd FileType python setlocal ts=4 sts=4 sw=4 et
filetype plugin indent on

" set nowrap

" highlight ColorColumn ctermbg=235 guibg=#2c2d27
set colorcolumn=101
set textwidth=99

" show line numbers, hybrid. Relative with absolute for the line you are on.
set number
" set relativenumber

" show command in bottom bar
set showcmd

" Display the mode you're in.
set showmode

" show a navigable menu for tab completion
set wildmenu
set wildmode=longest,list,full
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*.swp,*~,._*,*.jpg,*.png,*.gif,*.jpeg
set wildignore+=*/.DS_Store,*/tmp/*


set complete+=kspell
set completeopt+=menuone
set completeopt-=preview

" Display as much as possibe of a window's last line.
set display+=lastline

" highlight current line (Check auto groups too)
set cursorline

" redraw only when we need to.
set lazyredraw

" highlight matching [{()}]
set showmatch
set title
highlight MatchParen cterm=none ctermbg=black ctermfg=yellow

" More natural splitting
" set splitbelow
set splitright

" Search
"-----------------
" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" Ignore case in search.
set ignorecase

" But case-sensitive if expression contains a capital letter.
set smartcase
"
" stolen from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Movement
"-----------------
" highlight last inserted text
nnoremap gV `[v`]

" Other
" TODO: Cleanup.
"-----------------
" fix slight delay after pressing ESC then O http://ksjoberg.com/vim-esckeys.html
" set timeout timeoutlen=500 ttimeoutlen=100
set timeoutlen=1000 ttimeoutlen=0

" nofold
set nofoldenable

" No beeping.
set visualbell

set linebreak

" No flashing.
set noerrorbells

" History
set history=200

" reload files when changed on disk, i.e. via `git checkout`
set autoread

" Fix broken backspace in some setups
set backspace=2

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=5
set sidescrolloff=5

" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1

" yank and paste with the system clipboard
set clipboard=unnamed

if !has('nvim')
  " Alwyas use UTF-8, not required for Neovim
  set encoding=utf-8
endif

" show trailing whitespace
set list
set listchars=tab:▸\ ,trail:·,nbsp:_,precedes:«,extends:»,nbsp:░
" show where you are
set ruler

set smartindent

set noswapfile

set hidden

" Enable mouse support
" set mouse=a
" Swap iTerm2 cursors in [n]vim insert mode when using tmux, more here https://gist.github.com/andyfowler/1195581
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set ttyfast

set formatoptions=qrn1

" No backups.
set nobackup
set nowritebackup
set noswapfile

" Make tilde command behave like an operator.
set tildeop

" Avoid unnecessary hit-enter prompts.
set shortmess+=atI

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Autocommands
"================================================================================
" Automatically make splits equal in size
autocmd VimResized * wincmd =

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Some file types use real tabs
  autocmd FileType {make,gitconfig} setl noexpandtab

  autocmd BufWritePre * call Preserve("%s/\\s\\+$//e")

  " Make sure all markdown files have the correct filetype set and setup wrapping
  autocmd FileType markdown setl shiftwidth=4 softtabstop=4 tabstop=4 wrap linebreak nolist wrap lbr colorcolumn=0 synmaxcol=999999 statusline+=%9*\ %-3(%{WordCount()}%)\ Words

  autocmd BufEnter *.{markdown,md,text,txt,mkd} setl conceallevel=0

  " #2 http://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message
  autocmd Filetype gitcommit setl spell textwidth=72

  " fdoc is yaml
  autocmd BufRead,BufNewFile *.fdoc set ft=yaml
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby
  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  autocmd BufEnter *.py silent! match OverLength /\%81v.\+/
  autocmd FileType python setl softtabstop=4 tabstop=4 shiftwidth=4 textwidth=99 commentstring=#\ %s

  autocmd BufRead,BufNewFile *.json set ft=json
  autocmd BufNewFile,BufRead,BufWrite * if getline(1) =~ '^\#!.*node' | setf javascript | endif
  autocmd BufNewFile,BufRead .tags set ft=tags

  " Wrap quickfix window
  autocmd FileType qf setlocal wrap linebreak
augroup END

" Activate goyo with Markdown files
function! s:auto_goyo()
  if &ft == 'markdown'
    Goyo 120
  elseif exists('#goyo')
    let bufnr = bufnr('%')
    Goyo!
    execute 'b '.bufnr
  endif
endfunction

" augroup goyo_markdown
"   au!
"   autocmd BufNewFile,BufRead * call s:auto_goyo()
" augroup END

" Key mappings
"================================================================================

" leader is <space>
let mapleader = ' '
nnoremap <space> <nop>

" Treat overflowing lines as having line breaks.
map j gj
map k gk

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Disable arrow keys (hardcore)
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>

" Make arrowkey do something usefull, resize the viewports accordingly
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

nnoremap <silent> <leader>sv :so $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>

nnoremap gb  :Gbrowse<CR> " Open current file on github.com
vnoremap gb  :Gbrowse<CR> " Make it work in Visual mode to open with highlighted linenumbers

inoremap jjj <ESC>
nnoremap <Leader>e :e<SPACE>
nnoremap \ :Ag<SPACE>
nnoremap <Leader>x :SlimuxREPLSendBuffer<CR>
vnoremap <Leader>x :SlimuxREPLSendSelection<CR>
nnoremap <Leader>n :call ToggleNumber()<CR>
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <silent> <leader>d :20Lex<CR>
nnoremap <Leader>bd :Bdelete<CR>
nnoremap <Leader><TAB> <C-w><C-w>
" set text wrapping toggles
nnoremap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>
nnoremap <leader>ss :mksession<CR>
nnoremap -- :UndotreeToggle<CR>
nnoremap == <C-w>t<C-w>K<CR>
nnoremap \|\| <C-w>t<C-w>H<CR>
nnoremap <leader>ll :Limelight!!<CR>
nnoremap <leader>fm :Goyo<CR>

" bind K to grep word under cursor
nnoremap K :silent! grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" new file in current directory
map <Leader>nf :e <C-R>=expand("%:p:h") . "/" <CR>
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Tab and Shift + Tab Circular buffer navigation
nnoremap <tab>   :bnext<CR>
nnoremap <S-tab> :bprevious<CR>

" qq to record, Q to replay
nnoremap Q @q

" Make dot work in visual mode
vmap . :norm.<CR>

" :h magic
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/

nnoremap <silent> <leader><leader> :call fzf#run({
      \ 'up': '30%',
      \ 'sink': 'e',
      \ 'window': 'topleft split',
      \ 'options': '-m'
      \ })<CR>

" Choose a color scheme with fzf
nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':     'colo',
\   'options':  '+m',
\   'left':     20,
\   'launcher': 'xterm -geometry 20x30 -e bash -ic %s'
\ })<CR>


" List of buffers
function! BufList()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! BufOpen(e)
  execute 'buffer '. matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(BufList()),
\   'sink':    function('BufOpen'),
\   'options': '+m',
\ })<CR>

" Open files in horizontal split
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '30%',
\   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>

function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()


" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        exec t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>

" Convenience commands and cabbrev's
"================================================================================
"
" Make these commonly mistyped commands still work
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

" Use :C to clear hlsearch
command! C nohlsearch
command! Light set background=light

" Delete the current file and clear the buffer
command! Del :call delete(@%) | bdelete!

" Force write readonly files using sudo
command! WS w !sudo tee %

" open help in a new tab
cabbrev help tab help

" Functions
"================================================================================

function! ClearRegisters()
  let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
  let i=0
  while (i<strlen(regs))
    exec 'let @'.regs[i].'=""'
    let i=i+1
  endwhile
endfunction

command! ClearRegisters call ClearRegisters()

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nnoremap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nnoremap _= :call Preserve("normal gg=G")<CR>

" word count, taken from
" http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
function! WordCount()
  " let s:old_status = v:statusmsg
  " let position = getpos(".")
  " exe ":silent normal g\<c-g>"
  " let stat = v:statusmsg
  " let s:word_count = 0
  " if stat != '--No lines in buffer--'
  "   let s:word_count = str2nr(split(v:statusmsg)[11])
  "   let v:statusmsg = s:old_status
  " end
  " call setpos('.', position)
  " return s:word_count
endfunction

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=99
endfunction

" --------------- Folding! ----------------------------------------------------

set fdm=indent

" Map space to toggle current fold
noremap <Space> za

highlight Folded ctermbg=254

" Configure fold status text
if has("folding")
  function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
  endfunction
  set foldtext=NeatFoldText()
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
" https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim#L88
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

let g:SimpylFold_docstring_preview = 1

" Overrrides
" =================
if filereadable(expand("~/.vimrc.local"))
  so ~/.vimrc.local
endif

if filereadable('.local.vim')
  so .local.vim
endif

