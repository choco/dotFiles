" vim: set foldmethod=marker:

" ============================================================================
" GUI Settings {{{

" Set correct font for the GUI
if has('gui_running')
  set guifont=Source\ Code\ Pro\ plus\ Devicons:h12
  set guioptions-=L
  set linespace=2
  set guioptions-=r
  set guioptions-=e
endif

" }}}
" ============================================================================

" ============================================================================
" Plugins {{{

" Load Plugins
call plug#begin('~/.vim/plugged')

" Startup, shutdown and session management
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'kopischke/vim-stay'

" Versioning plugins
Plug 'mhinz/vim-signify' " Show signs for diffs beside line numbers column
Plug 'tpope/vim-fugitive' " Best git integration for Vim
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }

" Tmux plugins
Plug 'jpalardy/vim-slime'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-dispatch'
Plug 'christoomey/vim-tmux-navigator' " Better vim/tmux split navigation

" Commenting, aligning, folding and Indenting Plugs
Plug 'cHoco/BetterFoldText'
Plug 'Konfekt/FastFold'
Plug 'tomtom/tcomment_vim' " Easly comment stuff in/out
Plug 'Yggdroot/indentLine'
" Allign text easly
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }

" Colorschemes
Plug 'chriskempson/base16-vim'

" Splits navigation look and feel
Plug 'cHoco/GoldenView.Vim'

" Compiling and building helpers
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Text editing look and feel
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'kovisoft/paredit', { 'for': 'racket' }
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-endwise'
Plug 'itchyny/vim-highlighturl'
Plug 'tpope/vim-sleuth'

" Text objects and movements
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/matchit'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

" Statusbar/tabbar look and feel plugins
Plug 'bling/vim-airline'
Plug 'gcmt/taboo.vim'
Plug 'ryanoasis/vim-devicons'

"" Language specific Plugs
" Python
Plug 'tmhedberg/SimpylFold', { 'for': 'Python' }
Plug 'mitsuhiko/vim-python-combined', { 'for': 'Python' }
" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'Ruby' }
Plug 'tpope/vim-rails', { 'for': 'Ruby' }
" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'Javascript' }
" Markdown
Plug 'tpope/vim-markdown', { 'for': 'Markdown' }
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
Plug 'travitch/hasksyn', { 'for': 'Haskell' }
" Swift
Plug 'toyamarinyon/vim-swift', { 'for': 'Swift' }
" Nginx
Plug 'blueyed/nginx.vim', { 'for': 'Nginx' }
" CSV
Plug 'chrisbra/csv.vim', { 'for': 'CSV' }

" Ctags plugins
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Autocompleter and snippets
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --omnisharp-completer --gocode-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'davidhalter/jedi-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

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

" Fuck you ESC and your position
noremap! jj <ESC>

" Some standard settings to make vim better
set autoindent
set autoread                            " reload files when changed on disk
set backspace=indent,eol,start
set clipboard=unnamed                   " yank & paste with system clipboard
set encoding=utf-8
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
set modeline
set modelines=2
set synmaxcol=1000
" Update syntax highlighting for more lines increased scrolling performance
syntax sync minlines=256
set colorcolumn=80
set cursorline
autocmd InsertLeave * set cursorline
autocmd InsertEnter * set nocursorline
set nostartofline                       " Keep the cursor on the same column

" Use The Silver Searcher instead of grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif

set ignorecase                          " case-insensitive search
set incsearch                           " search as you type
set smartcase                           " case-sensitive search if any caps
set showmatch
set gdefault                            " assume the /g flag on :s substitutions
                                        " to replace all matches in a line

set complete-=i
set smarttab
set timeout                             " timeout on key codes
set timeoutlen=800
set ttimeout                            " but not on mappings
set ttimeoutlen=10
set fileformats+=mac                    " because Mac is the way
set lazyredraw                          " only render when needed
if !has('nvim')
  set ttyfast                         " faster rendering
  set ttymouse=sgr
endif
set secure                              " stay safe
set noerrorbells                        " Disable any annoying beeps on errors.
set visualbell

set splitbelow                          " Open new split panes to right and
set splitright                          " bottom which feels more natural

" Folding
nnoremap <Space> za
vnoremap <Space> zf
if &diff
  set foldmethod=diff
else
  set foldmethod=syntax
endif
autocmd BufWinEnter * silent! :%foldopen!

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

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
map <ScrollWheelUp>   <C-y>
map <ScrollWheelDown> <C-e>

" Let them know you are the king
let mapleader = ','

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
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Move between visual lines, not literal ones!
noremap j gj
noremap k gk

" Yeah I know... I'm week
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

" Color scheme preferences {{{
if (exists('$TMUX') && system('tmux show-env TERMINAL_THEME') == "TERMINAL_THEME=light\n") || $TERMINAL_THEME == "light"
  set background=light
else
  set background=dark
endif
colorscheme base16-eighties
" Toogle between light and dark version
noremap <F6> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" }}}

" Toggle paste mode for code
set pastetoggle=<F2>

" Automaticaly set tmux window name
if exists('$TMUX') && !exists('$NORENAME')
  au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
  au VimLeave * call system('tmux set-window automatic-rename on')
endif

" }}}
" ============================================================================

" ============================================================================
" FileType specific configurations {{{

" Support for AMPL
autocmd BufNewFile,BufRead *.mod,*.dat,*.ampl set filetype=ampl
" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell
" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
" Enable spellchecking for Git commits
autocmd FileType gitcommit setlocal spell
" Enable Rainbow Parentheses for racket
autocmd FileType racket RainbowParentheses

" }}}
" ============================================================================

" ============================================================================
" Plugins configurations {{{

" NERDTree configuration {{{
let g:NERDTreeIgnore = ['\.DS_Store$']
let g:NERDTreeShowHidden=1
let g:NERDSpaceDelims=1
let g:NERDTreeMinimalUI=1
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>D :NERDTreeFind<CR>
" }}}

" YouCompleteMe configuration {{{
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/conf/ycm_conf.py'
let g:ycm_extra_conf_globlist = [
    \ '~/Progetti/*' ]
" }}}

" jedi-vim configuration {{{
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#use_tabs_not_buffers = 0
" }}}

" UltiSnips configuration {{{
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<C-Y>"
  endif
endfunction
imap <silent> <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>\<Plug>DiscretionaryEnd"
" }}}

" Airline configuration {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '│'
let g:airline#extensions#tabline#exclude_preview = 1
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
function! s:goyo_enter()
  if exists('$TMUX')
    silent !tmux set status off
  endif
  DisableGoldenViewAutoResize
  NumbersToggle
  Limelight
endfunction

function! s:goyo_leave()
  if exists('$TMUX')
    silent !tmux set status on
  endif
  EnableGoldenViewAutoResize
  NumbersToggle
  Limelight!
  AirlineRefresh
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" Vim-Signify configuration {{{
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_update_on_bufenter = 1
let g:signify_disable_by_default = 1
nnoremap <leader>gt :SignifyToggle<CR>
" Hunk jumping
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" }}}

" Fzf configuration {{{
nnoremap <silent> <leader>t :silent :Files<CR>
nnoremap <silent> <Leader><Enter> :silent :Buffers<CR>
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
let g:startify_files_number = 5
let g:startify_skiplist = [
\ 'COMMIT_EDITMSG',
\ $HOME . '/Progetti/*',
\ ]
let g:startify_session_remove_lines = ['set winheight=1 winwidth=1']
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_custom_header = [
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
let g:taboo_tabline = 0
let g:taboo_tab_format = "%N%U %f%m"
let g:taboo_renamed_tab_format = "%N%U %l%m"
" }}}

" Sayonara configuration {{{
nnoremap <silent> <leader>q :silent :Sayonara<cr>
nnoremap <silent> <leader>Q :silent :Sayonara!<cr>
" }}}

" Cursor configuration {{{
" Use a blinking upright bar cursor in Insert mode, a solid block in normal
" and a blinking underline in replace mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[2 q"
" }}}

" vim-gutentags configuration {{{
let g:gutentags_cache_dir = $HOME . '/.vim/tags/'
" }}}
" }}}
" ============================================================================
