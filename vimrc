" vim: set foldmethod=marker:

" ============================================================================
" GUI Settings {{{

" Set correct font for the GUI
if has('gui_running') && !has('nvim')
  set guifont=Source\ Code\ Pro\ plus\ Devicons:h12
  set guioptions-=L
  set linespace=2
  set guioptions-=r
  set guioptions-=e
  if has('gui_macvim')
    set macligatures                  " Enable ligatures
    set macthinstrokes              " Use thin strokes in dark colorscheme
  endif
endif

" }}}
" ============================================================================

" ============================================================================
" Plugins {{{

" Load Plugins
call plug#begin('~/.vim/plugged')

" Startup, shutdown, saving and session management {{{
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'kopischke/vim-stay', { 'branch': 'release/1.4.0' }
Plug '907th/vim-auto-save', { 'for': 'tex' }
" }}}

" Versioning plugins {{{
Plug 'mhinz/vim-signify' " Show signs for diffs beside line numbers column
Plug 'tpope/vim-fugitive' " Best git integration for Vim
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }
" }}}

" Tmux plugins {{{
Plug 'jpalardy/vim-slime'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-dispatch'
Plug 'christoomey/vim-tmux-navigator' " Better vim/tmux split navigation
" }}}

" Commenting, aligning, folding and Indenting Plugs {{{
let g:plug_url_format = 'git@github.com:%s.git'
Plug 'cHoco/AwesomeFoldText'
unlet g:plug_url_format
Plug 'tweekmonster/braceless.vim'
Plug 'tomtom/tcomment_vim' " Easily comment stuff in/out
Plug 'Yggdroot/indentLine'
" Align text easily
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
" }}}

" Color schemes {{{
let g:plug_url_format = 'git@github.com:%s.git'
Plug 'cHoco/base16-eighties'
unlet g:plug_url_format
" }}}

" Splits navigation look and feel {{{
let g:plug_url_format = 'git@github.com:%s.git'
Plug 'cHoco/GoldenView.Vim'
unlet g:plug_url_format
" }}}

" Compiling and building helpers {{{
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" }}}

" Text editing look and feel {{{
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'osyo-manga/vim-jplus'
Plug 'kovisoft/paredit', { 'for': 'racket' }
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " Distraction-free writing
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'kennykaye/vim-relativity'            " Toggle relativenumber base on events
Plug 'itchyny/vim-highlighturl'
Plug 'tpope/vim-sleuth'                    " Guess indentation values from buffer
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'
" }}}

" Text objects and movements {{{
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/matchit'
" }}}

" File navigation {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}

" Language specific Plugs {{{
" LaTeX
Plug 'lervag/vimtex', { 'for': 'tex'}
" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Markdown
Plug 'plasticboy/vim-markdown'
" Tmux syntax
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
" JSON
Plug 'leshill/vim-json'
" C/C++
Plug 'justinmk/vim-syntax-extra', { 'for': ['lex', 'yacc'] }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp', 'objc'] }
Plug 'vim-jp/cpp-vim', { 'for': ['c', 'cpp', 'objc'] }
" Objective-C
Plug 'b4winckler/vim-objc', { 'for': 'objc' }
" C#
Plug 'OrangeT/vim-csharp', { 'for': 'cs' }
" GLSL
Plug 'tikhomirov/vim-glsl'
" HTML/CSS
Plug 'JulesWang/css.vim', { 'for': ['css', 'html', 'html5', 'less'] }
Plug 'ap/vim-css-color', { 'for': ['css', 'html', 'html5', 'less'] }
Plug 'othree/html5.vim', { 'for': ['css', 'html', 'html5'] }
" Less
Plug 'groenewege/vim-less', { 'for': 'Less' }
" Go
Plug 'fatih/vim-go', { 'for': 'Go' }
" Git
Plug 'tpope/vim-git'
" Scheme - Racket dialect
Plug 'wlangstroth/vim-racket'
" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" Swift
Plug 'bumaociyuan/vim-swift', { 'for': 'swift' }
" CSV
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
" }}}

" Ctags plugins {{{
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
" }}}

" Autocompleter and snippets {{{
function! BuildYCM(info)
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'), 'on': [] }
Plug 'davidhalter/jedi-vim'
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'honza/vim-snippets'
" Defer YouCompleteMe and UltiSnips loading until insert mode is entered {{{
augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * if !exists(':UltiSnipsEdit')
        \|      call plug#load('ultisnips', 'YouCompleteMe')
        \|  else
        \|      call plug#load('YouCompleteMe')
        \|  endif
        \|  silent! call feedkeys("\<Plug>indentLineReset")
        \|  autocmd! load_us_ycm
augroup END
" }}}
let g:plug_url_format = 'git@github.com:%s.git'
Plug 'cHoco/vide'
unlet g:plug_url_format
" }}}

" Other vim features extensions {{{
Plug 'ciaranm/securemodelines'
Plug 'kopischke/vim-fetch'
Plug 'metakirby5/codi.vim'
" }}}

" Statusbar/tabbar look and feel plugins {{{
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'gcmt/taboo.vim'
Plug 'ryanoasis/vim-devicons'
" }}}

call plug#end()


" }}}
" ============================================================================

" ============================================================================
" General Settings {{{

" Faster startup time on neovim
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

" Enable syntax highlighting
syntax enable

" Some standard settings to make vim better
set autoindent
set autoread                            " reload files when changed on disk
set backspace=indent,eol,start
set clipboard=unnamed                   " yank & paste with system clipboard
if !has('nvim')
  set encoding=utf-8
endif
set hidden                              " allow buffer switching without saving
set expandtab                           " expand tabs to spaces
set laststatus=2                        " always show statusline
set list                                " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                              " show line numbers
set ruler                               " show where you are
set linebreak                           " break properly, don't split words
set formatoptions+=j
let &showbreak = '↳ '
set breakindent
set breakindentopt=sbr
set shiftround
set scrolloff=4                         " show context above/below cursorline
set sidescrolloff=5
set display+=lastline
set showcmd
set noshowmode
set shiftwidth=4                        " normal mode indentation use 4 spaces
set softtabstop=4                       " tab and backspace use 4 spaces
set tabstop=4                           " actual tabs occupy 4 characters
set wildmenu                            " show navigable menu for tab completion
set wildmode=list:full
set wildignorecase
set showfulltag
set synmaxcol=1000
" Update syntax highlighting for more lines increased scrolling performance
syntax sync minlines=256
set colorcolumn=80
set cursorline
augroup cursorline_au
  au!
  autocmd InsertLeave * set cursorline
  autocmd InsertEnter * set nocursorline
augroup END
set nostartofline                       " Keep the cursor on the same column

" Use The Silver Searcher instead of grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif

set ignorecase                          " case-insensitive search
set incsearch                           " search as you type
set smartcase                           " case-sensitive search if any caps
set showmatch                           " show matching brackets pair
set gdefault                            " assume the /g flag on :s substitutions
                                        " to replace all matches in a line

set complete-=i
set smarttab
set timeout                             " timeout on key codes
set timeoutlen=800
set ttimeout                            " but not on mappings
set ttimeoutlen=10
set fileformats+=mac                    " because Mac is the way
set lazyredraw
if !has('nvim')
  set ttyfast                           " faster rendering
  set ttymouse=sgr
endif
set secure                              " stay safe
set nomodeline                          " use securemodeline instead
set noerrorbells                        " Disable any annoying beeps on errors.
set visualbell
set shortmess=FTc

set splitbelow                          " Open new split panes to right and
set splitright                          " bottom which feels more natural

" Folding
nnoremap <CR> za
vnoremap <CR> zf
if &diff
  set foldmethod=diff
else
  set foldmethod=syntax
endif
" Open folds by default (without changing fold level)
augroup open_folds
  au!
  autocmd BufWinEnter * if !exists('b:folds_opened')
                      \|  silent! :%foldopen!
                      \|  let b:folds_opened = 1
                      \|endif
augroup END

" Session and view options to save
set sessionoptions=buffers,folds,tabpages,curdir,globals
set viewoptions=cursor,folds

set undofile
set backup
set swapfile

set undodir=~/.vim/tmp/undo//           " undo files
set backupdir=~/.vim/tmp/backup//       " backups
set directory=~/.vim/tmp/swap//         " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
map <ScrollWheelUp>   <C-Y>
map <ScrollWheelDown> <C-E>

" Let them know you are the king
let mapleader = " "

" Make Y behave like other capitals
nnoremap Y y$

" qq to record, Q to replay
nmap Q @q

" Move between tabs faster
nnoremap <silent> <C-S-b> :silent :tabp<CR>
nnoremap <silent> <C-S-n> :silent :tabn<CR>
" Stupid hack to support Terminal.app with modified profile mapping
nnoremap <silent> <F11> :silent :tabp<CR>
nnoremap <silent> <F12> :silent :tabn<CR>

" Move between buffers faster
nnoremap <silent> <C-b> :silent :bp<CR>
nnoremap <silent> <C-n> :silent :bn<CR>

" Reload vimrc
augroup reload_vimrc
  au!
  " Automatically load .vimrc changes
  autocmd BufWritePost .vimrc,$MYVIMRC,~/Projects/dotFiles/vimrc nested source $MYVIMRC
augroup END

" Move between visual lines, not literal ones!
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"
noremap , ;
noremap ; ,

" Yeah I know... I'm weak
noremap <Down> <NOP>
noremap <Up> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Down> <NOP>
inoremap <Up> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Reselect visual selection after indent
xnoremap < <gv
xnoremap > >gv

" In case you forgot to sudo
cmap w!! %!sudo tee > /dev/null %


" Jump function definition
nnoremap <leader>cd <C-]>

" Enable 24-bit colors
set termguicolors
" Color scheme preferences {{{
if (exists('$TMUX') && system('tmux show-env TERMINAL_THEME') == "TERMINAL_THEME=light\n") || $TERMINAL_THEME == "light"
  set background=light
else
  set background=dark
endif
colorscheme base16-eighties
" Toggle between light and dark version
noremap <F6> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" }}}

" Cursor configuration {{{
" Use a blinking upright bar cursor in Insert mode, a solid block in normal
" and a blinking underline in replace mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let &t_SI                         = "\<Esc>[5 q"
let &t_SR                         = "\<Esc>[3 q"
let &t_EI                         = "\<Esc>[2 q"
" }}}

" Toggle paste mode for code
set pastetoggle=<F2>

" Automatically set tmux window name
if exists('$TMUX') && !exists('$NORENAME')
  augroup tmux_window_rename
    au!
    au BufEnter * if empty(&buftype) && !pumvisible() | call system('tmux rename-window '.expand('%:t:S')) | endif
    au VimLeave * call system('tmux set-window automatic-rename on')
  augroup END
endif

" }}}
" ============================================================================

" ============================================================================
" FileType specific configurations {{{

" Support for AMPL
augroup filetype_specific
  au!
  autocmd BufNewFile,BufRead *.mod,*.dat,*.ampl set filetype=ampl
  " Enable spell checking for Markdown and wrap at 80 characters for Markdown
  autocmd FileType markdown setlocal spell | setlocal textwidth=80
  " Enable spell checking for Git commits
  autocmd FileType gitcommit setlocal spell
  " Enable Rainbow Parentheses for racket
  autocmd FileType racket RainbowParentheses
augroup END

" }}}
" ============================================================================

" ============================================================================
" Plugins configurations {{{
" Doxygen configuration {{{
let g:load_doxygen_syntax = 1
" }}}

" vimtex configuration {{{
let g:vimtex_view_general_viewer
  \ = '/Applications/PDF Expert.app/Contents/MacOS/PDF Expert'
let g:vimtex_view_general_options = '@line @pdf @tex'
let g:vimtex_echo_ignore_wait = 1
" }}}

" delimitMate configuration {{{
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1
" }}}

" NERDTree configuration {{{
let g:NERDTreeIgnore     = ['\.DS_Store$']
let g:NERDTreeShowHidden = 1
let g:NERDSpaceDelims    = 1
let g:NERDTreeMinimalUI  = 1
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>D :NERDTreeFind<CR>
" }}}

" YouCompleteMe configuration {{{
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
augroup disable_identifier_compl_for_python
  au!
  autocmd FileType python let g:ycm_min_num_of_chars_for_completion = 99
augroup END
let g:ycm_semantic_triggers.python = ['re!(?=[a-zA-Z_]{2})']
let g:ycm_semantic_triggers.cpp = ['->', '.', '::', 're!gl']
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
      \ 're!\\hyperref\[[^]]*',
      \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\(include(only)?|input){[^}]*',
      \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
      \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
      \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
      \ ]
let g:ycm_use_ultisnips_completer = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/conf/ycm_conf.py'
let g:ycm_extra_conf_vim_data   = [ '&filetype' ]
let g:ycm_extra_conf_globlist = [
    \ '~/Projects/*' ]
" }}}

" jedi-vim configuration {{{
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled    = 0
let g:jedi#use_tabs_not_buffers   = 0
let g:jedi#show_call_signatures_delay = 0
" }}}

" UltiSnips configuration {{{
let g:UltiSnipsEnableSnipMate = 0
noremap <Plug>(Ultisnips-savelastvisualsel) :call LoadUltisnipsAndSaveSel()<cr>gvs
function! LoadUltisnipsAndSaveSel()
  if !exists(':UltiSnipsEdit')
    call plug#load('ultisnips')
  endif
  call UltiSnips#SaveLastVisualSelection()
endfunction
xmap <silent> s <Plug>(Ultisnips-savelastvisualsel)
" }}}

" Airline configuration {{{
let g:airline_powerline_fonts                      = 1
let g:airline#extensions#tabline#enabled           = 1
let g:airline#extensions#tabline#show_tab_nr       = 0
let g:airline#extensions#tabline#show_buffers      = 1
let g:airline#extensions#tabline#buffer_min_count  = 2
let g:airline#extensions#tabline#left_sep          = ' '
let g:airline#extensions#tabline#left_alt_sep      = ' '
let g:airline#extensions#tabline#exclude_preview   = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#ycm#enabled               = 1
let g:airline_exclude_preview                      = 1
let g:airline_theme                                = 'base16'
" }}}

" EasyAlign configuration {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Leader>l <Plug>(EasyAlign)

let g:easy_align_delimiters = {
\ '"': {
\        'pattern':       '"',
\        'ignore_groups': ['String'],
\        'ignore_unmatched': 0
\      }
\ }
" }}}

" Goyo configuration {{{
nnoremap <Leader>G :Goyo<CR>
let g:goyo_height = '95%'
function! s:goyo_enter()
  set noshowcmd
  set scrolloff=999
  DisableGoldenViewAutoResize
  Relativity!
  set nonumber norelativenumber
  Limelight
endfunction
function! s:goyo_leave()
  set showcmd
  set scrolloff=4
  EnableGoldenViewAutoResize
  Relativity
  Limelight!
endfunction

augroup goyo_conf
  au!
  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup END
" }}}

" Vim-Signify configuration {{{
let g:signify_vcs_list           = [ 'git', 'hg' ]
let g:signify_disable_by_default = 1
nnoremap <leader>gt :SignifyToggle<CR>
" Hunk jumping
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" }}}

" Fzf configuration {{{
nnoremap <silent> <leader>t :silent :Files<CR>
nnoremap <silent> <Leader><CR> :silent :Buffers<CR>
nnoremap <silent> <Leader>f :silent :Lines<CR>
nnoremap <silent> <Leader>u :silent :Tags<CR>
" }}}

" Tagbar configuration {{{
" add a definition for Objective-C to tagbar
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }
nnoremap <leader>o :TagbarToggle<CR>
" }}}

" indentLine configuration {{{
let g:indentLine_char = '┊'
" }}}

" slime configuration {{{
let g:slime_target = "tmux"
" }}}

" GoldenView configuration {{{
let g:goldenview__enable_at_startup = 1
let g:goldenview__enable_default_mapping = 0
" 1. Split to tiled windows
nmap <silent> <leader>s <Plug>GoldenViewSplit
" 2. Quickly switch current window with the main pane and toggle back
nmap <silent> <leader>m <Plug>GoldenViewSwitchMain
nmap <silent> <leader>b <Plug>GoldenViewSwitchToggle
" }}}

" vim-startify configuration {{{
let g:startify_files_number           = 5
let g:startify_skiplist               = [
      \ 'COMMIT_EDITMSG',
\ ]
let g:startify_session_remove_lines   = ['set winheight=1 winwidth=1']
let g:startify_session_autoload       = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence    = 1
let g:startify_custom_header          = [
\ '                                                                 ',
\ '                 ,╓╦╢╣┘                         ╣╩▄              ',
\ '                ╣╬╬░▒Γ                ,╢Ç╖RφQ▒▄▓▒╬╬              ',
\ '            ,▄▄▒▒▒▒╬▒╣╣@╗╗╖,       ╒╦██▄▓▄▒█▒╬▓▓▌╣╬τ             ',
\ '         ` ΓΓ    └╚╬░╣▒▒╙╨╩░╬╬╬▒╣@╗▓▓▓▌╬╣╣╬╬╬▓▓▓█▌╝▐M            ',
\ '                             ^δ╬╬▄▓█▓█▒╣▒▒╬▀█τ²▀<                ',
\ '                            ,Q███░╬░╣Σ▀╬╬╬░▒╣╗╖            ƒΓ  ▄m',
\ '                        ,▄▒██░╬░╬╫░░╣▒δ`╨╚▒░╬╬╬╬╣╗╖      ╓╣ ╔▓█  ',
\ '                     ▄▒█▌░╣╩╨Σ▓▓█▀▓▌╬▒Γ      ╚Å▒░╬╬╬╣╗,╔╬▒ ▄█▀   ',
\ '                 ╓▄▀▀╝╜`  ,▄▓▓█▐█▓▓█δ╨          ╙δ╬╬╬╣▒▒Ñ▄▓█     ',
\ '               ²`      ▄▄▓█▀Γ                      ▄░▒Ñ▓▓▓.      ',
\ '                  ,▄▄▓▀Γ                         ╦╣▒Ñ╒▓█         ',
\ '                ▄▄█▀                              Ä ▄█           ',
\ '            ,▄█▀.                               @╨▄▀             ',
\ '          ▄▀Γ                                   ,█.              ',
\ '',
\ '',
\ '',
\ '',
\ ]
highlight default link StartifyHeader String
highlight default link StartifySection Label
" }}}

" taboo.vim configuration {{{
let g:taboo_tabline            = 0
let g:taboo_tab_format         = "%N%U %f%m"
let g:taboo_renamed_tab_format = "%N%U %l%m"
" }}}

" Sayonara configuration {{{
nnoremap <silent> <leader>q :silent :Sayonara<cr>
nnoremap <silent> <leader>Q :silent :Sayonara!<cr>
" }}}

" vim-gutentags configuration {{{
let g:gutentags_cache_dir = $HOME . '/.vim/tags/'
let g:gutentags_resolve_symlinks = 1
" }}}

" vim-auto-save configuration {{{
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_silent = 1
"}}}

" securemodelines configuration {{{
let g:secure_modelines_allowed_items = [
      \ "textwidth",       "tw",
      \ "softtabstop",     "sts",
      \ "tabstop",         "ts",
      \ "shiftwidth",      "sw",
      \ "expandtab",       "et",        "noexpandtab",    "noet",
      \ "filetype",        "ft",
      \ "foldmarker",      "fmr",
      \ "foldclose",
      \ "foldmethod",      "fdm",
      \ "commentstring",   "cms",
      \ "formatoptions",   "fo",
      \ "readonly",        "ro",        "noreadonly",     "noro",
      \ "rightleft",       "rl",        "norightleft",    "norl",
      \ "cindent",         "cin",       "nocindent",      "nocin",
      \ "smartindent",     "si",        "nosmartindent",  "nosi",
      \ "autoindent",      "ai",        "noautoindent",   "noai",
      \ "spell",           "nospell",
      \ "spelllang"
      \ ]
" }}}

" vim-jplus configuration {{{
nmap J <Plug>(jplus)
vmap J <Plug>(jplus)
nmap <Leader>J <Plug>(jplus-getchar)
vmap <Leader>J <Plug>(jplus-getchar)
" }}}

let g:relativity_filetype_ignore = ['startify', 'nerdtree', 'fugitive', 'tagbar', 'agsv']

" haskell-vim configuration {{{
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_classic_highlighting = 1
" }}}

" braceless configuration {{{
autocmd FileType python BracelessEnable +indent +fold-slow
" }}}

" }}}
" ============================================================================
