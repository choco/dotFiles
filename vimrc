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

" Startup, shutdown, saving and session management {{{
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'kopischke/vim-stay'
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
Plug 'cHoco/BetterFoldText'
Plug 'Konfekt/FastFold'
Plug 'tomtom/tcomment_vim' " Easily comment stuff in/out
Plug 'Yggdroot/indentLine'
" Align text easily
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
" }}}

" Color schemes {{{
Plug 'chriskempson/base16-vim'
" }}}

" Splits navigation look and feel {{{
Plug 'cHoco/GoldenView.Vim'
" }}}

" Compiling and building helpers {{{
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" }}}

" Text editing look and feel {{{
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'kovisoft/paredit', { 'for': 'racket' }
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'kennykaye/vim-relativity'
Plug 'itchyny/vim-highlighturl'
Plug 'tpope/vim-sleuth'
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
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
" }}}

" Statusbar/tabbar look and feel plugins {{{
Plug 'bling/vim-airline'
Plug 'gcmt/taboo.vim'
Plug 'ryanoasis/vim-devicons'
" }}}

" Language specific Plugs {{{
Plug 'lervag/vimtex', { 'for': 'tex'}
" Python
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'mitsuhiko/vim-python-combined', { 'for': 'python' }
" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
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
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" Swift
Plug 'toyamarinyon/vim-swift', { 'for': 'swift' }
" CSV
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
" }}}

" Ctags plugins {{{
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
" }}}

" Autocompleter and snippets {{{
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --omnisharp-completer --gocode-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'), 'on': [] }
Plug 'davidhalter/jedi-vim'
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'honza/vim-snippets', { 'on': [] }
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

" Toggle paste mode for code
set pastetoggle=<F2>

" Automatically set tmux window name
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
" Enable spell checking for Markdown
autocmd FileType markdown setlocal spell
" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
" Enable spell checking for Git commits
autocmd FileType gitcommit setlocal spell
" Enable Rainbow Parentheses for racket
autocmd FileType racket RainbowParentheses

" }}}
" ============================================================================

" ============================================================================
" Plugins configurations {{{
" delimitMate configuration {{{
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1
" }}}

" vim-endwise configuration {{{
let g:endwise_no_mappings = 1
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
let g:ycm_use_ultisnips_completer = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/conf/ycm_conf.py'
let g:ycm_extra_conf_globlist = [
    \ '~/Projects/*' ]

" actually don't use these mappings directly but with Tab and S-Tab in the
" mapping for UltiSnips
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" }}}

" jedi-vim configuration {{{
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled    = 0
let g:jedi#use_tabs_not_buffers   = 0
" }}}

" UltiSnips configuration {{{
let g:UltiSnipsJumpForwardTrigger  = "<nop>"
let g:UltiSnipsJumpBackwardTrigger = "<nop>"
let g:UltiSnipsExpandTrigger       = "<nop>"
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsEnableSnipMate = 0
" }}}

" YouCompleteMe & UltiSnips interoperability configuration {{{
" NOTE: REALLY HACKY, PROBABLY WRONG, BUT SEEMS TO WORK WELL
" Current_Setup:
" - move between completion menu results using g:ultisnips_ycm_move_forwards
"   and g:ultisnips_ycm_move_backwards
" - confirm result by either continuing to type or <CR>
" - if confirmed with <CR> and auto completion is a snippet it's expanded
"   (note: functions defined as some_func(arg1, arg2, ...) are converted to
"   snippets and therefore expanded as well)
" - when inside snippet move with the same keys between placeholders or by
"   completing a result with <CR>
" - inside a snippet movement inside the completion menu is prioritized
"   over the movement between the placeholders
" Limitations:
" - if semantic completion is triggered inside a snippets, placeholders are
"   removed, apply this patch https://gist.github.com/cHoco/27549c8bc5119eda7d3b
"   to fix this (it may cause other issues to arise
"   https://github.com/SirVer/ultisnips/issues/586#issuecomment-148914335)

let g:ultisnips_ycm_move_forwards  = "<tab>"
let g:ultisnips_ycm_move_backwards = "<s-tab>"

" globals holding snippets, don't touch
let g:available_on_the_fly_snippet = 0
let g:temporary_on_the_fly_snippet = ""
let g:completedone_available_snippet = 0
let g:completedone_snippet = ""

" Escaped keys {{{
exec 'let escaped_ultisnips_ycm_move_forwards = "\'.g:ultisnips_ycm_move_forwards.'"'
exec 'let escaped_ultisnips_ycm_move_backwards = "\'.g:ultisnips_ycm_move_backwards.'"'
" }}}

" Hack: don't pop completion pop-up after confirming result {{{
augroup modify_ctrl_y_trigger_ycm
  autocmd!
  au BufEnter * exec "inoremap <expr><silent> <M-NP> g:DisablePopup()"
  au BufEnter * exec "inoremap <expr><silent> <M-PN> g:EnablePopup()"
augroup END

function! g:DisablePopup()
  let g:ycm_auto_trigger = 0
  return ""
endfun

function! g:EnablePopup()
  let g:ycm_auto_trigger = 1
  return ""
endfun
" }}}

" create a snippet with Ultisnips for completed function names
" NOTE: only works with function declaration like some_fun(arg1, args2, ...)
"       and objc functions
function! GenerateClikeFuncSnippet(with_brackets) " {{{
  let abbr = v:completed_item.abbr
  let startIdx = match(abbr,"(")
  let endIdx = match(abbr,")")
  if endIdx - startIdx > 1
    let argsStr = strpart(abbr, startIdx+1, endIdx - startIdx -1)
    let argsList = split(argsStr, ",")
    let snippet = ""
    if a:with_brackets > 0
      let snippet = "("
    endif
    let c = 1
    for i in argsList
      if c > 1
        let snippet = snippet. ", "
      endif
      " strip space
      let arg = substitute(i, '^\s*\(.\{-}\)\s*$', '\1', '')
      let snippet = snippet . '${'.c.":".arg.'}'
      let c += 1
    endfor
    if a:with_brackets > 0
      let snippet = snippet . ")$0"
    else
      let snippet = snippet . "$0" " TODO: find a way to jump over existing character
    endif
    return snippet
  else
    return ""
  endif
endfunction
" }}}

function! GenerateObjCSnippet() " {{{
  let abbr = v:completed_item.abbr
  let hasArguments = match(abbr, ":")
  if hasArguments > 0
    let argsList = split(abbr, ') \|)$')
    let snippet = ""
    let c = 1
    for i in argsList
      if c > 1
        let snippet = snippet . " "
      endif
      let arg = split(i, ':')
      let firstPart = arg[0] . ":"
      if c == 1
        let firstPart = ""
      endif
      let secondPart = arg[1] . ")"
      let snippet = snippet . firstPart . '${'.c.":".secondPart.'}'
      let c += 1
    endfor
    let snippet = snippet . "$0" " TODO: find a way to jump over existing character
    return snippet
  else
    return ""
  endif
endfunction
" }}}

function! GenerateSnippet(from_completeDone) "{{{
  if !exists('v:completed_item') || empty(v:completed_item)
    return ""
  endif

  let completed_type = v:completed_item.kind
  if completed_type != 'f'
    return ""
  endif

  let complete_str = v:completed_item.word
  if complete_str == ''
    return ""
  endif

  if &filetype == 'objc'
    return GenerateObjCSnippet()
  else
    return a:from_completeDone ? GenerateClikeFuncSnippet(0) : GenerateClikeFuncSnippet(1)
  endif

endfunction
" }}}

" func ExpandSnippetOrJumpOrReturn() {{{
let g:ulti_expand_or_jump_res      = 0
function! <SID>ExpandSnippetOrReturn()
  if pumvisible()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
      return snippet
    else
      let g:available_on_the_fly_snippet = 0
      let g:temporary_on_the_fly_snippet = GenerateSnippet(0)
      if len(g:temporary_on_the_fly_snippet)>1
        let g:available_on_the_fly_snippet = 1
      endif
      call feedkeys("\<M-NP>")
      call feedkeys("\<C-Y>")
      call feedkeys("\<M-PN>")
      if g:available_on_the_fly_snippet > 0
        call UltiSnips#Anon(g:temporary_on_the_fly_snippet)
        let g:available_on_the_fly_snippet = 0
        let g:completedone_available_snippet = 0
      endif
      return ""
    endif
  else
    if g:completedone_available_snippet > 0
      call UltiSnips#Anon(g:completedone_snippet)
      let g:completedone_available_snippet = 0
      let g:available_on_the_fly_snippet = 0
      return ""
    else
      call feedkeys("\<Plug>delimitMateCR"."\<Plug>DiscretionaryEnd")
      return ""
    endif
  endif
endfunction
" }}}

" func JumpOrKey(direction) {{{
let g:ulti_jump_forwards_res  = 0
let g:ulti_jump_backwards_res = 0
function! <SID>JumpOrKey(direction)
  if a:direction > 0
    call UltiSnips#JumpForwards()
    if g:ulti_jump_forwards_res > 0
      return ''
    else
      return g:escaped_ultisnips_ycm_move_forwards
    endif
  else
    call UltiSnips#JumpBackwards()
    if g:ulti_jump_backwards_res > 0
      return ''
    else
      return g:escaped_ultisnips_ycm_move_backwards
    endif
  endif
endfunction
" }}}

" helper functions to invalidate compledone snippet {{{
let g:invalidate_snippet_counter = 0
function! InvalidateSnippet()
  let g:completedone_available_snippet = 0
  let g:invalidate_snippet_counter = 0
  try
    exec "augroup! invalidate_completedone_snippet"
  catch /^Vim\%((\a\+)\)\=:E367/
  endtry
endfunction
function! CheckInvalidateSnippet()
  if g:invalidate_snippet_counter > 1
    call InvalidateSnippet()
  else
    let g:invalidate_snippet_counter = g:invalidate_snippet_counter + 1
  endif
endfunction
" }}}

" Mappings {{{
imap <silent><CR> <C-R>=<SID>ExpandSnippetOrReturn()<CR>
exec 'inoremap <silent> <expr> ' . ultisnips_ycm_move_forwards . ' pumvisible() ? "\' . ycm_key_list_select_completion[0] . '" : "<C-R>=<SID>JumpOrKey(1)<CR>"'
exec 'inoremap <silent> <expr> ' . ultisnips_ycm_move_backwards . ' pumvisible() ? "\' . ycm_key_list_previous_completion[0] . '" : "<C-R>=<SID>JumpOrKey(0)<CR>"'
exec 'snoremap <silent> ' . ultisnips_ycm_move_forwards . ' <Esc>:call UltiSnips#JumpForwards()<cr>'
exec 'snoremap <silent> ' . ultisnips_ycm_move_backwards . ' <Esc>:call UltiSnips#JumpBackwards()<cr>'
" }}}

function! GenerateCompleteDoneSnippet() " {{{
  let g:completedone_available_snippet = 0
  let g:completedone_snippet = GenerateSnippet(1)
  if len(g:completedone_snippet) > 1
    let g:completedone_available_snippet = 1
    augroup invalidate_completedone_snippet
      autocmd!
      autocmd TextChangedI * call CheckInvalidateSnippet()
      autocmd CursorMovedI * call CheckInvalidateSnippet()
      autocmd InsertLeave * call InvalidateSnippet()
    augroup END
  endif
endfunction
autocmd CompleteDone * call GenerateCompleteDoneSnippet()
" }}}

" Performance {{{
" Defer YouCompleteMe and UltiSnips loading until insert mode is entered
augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'vim-snippets', 'YouCompleteMe')
        \| call youcompleteme#Enable()
        \| autocmd! load_us_ycm
augroup END
" }}}
" }}}

" Airline configuration {{{
let g:airline_powerline_fonts                    = 1
let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#show_tab_nr     = 0
let g:airline#extensions#tabline#left_sep        = ' '
let g:airline#extensions#tabline#left_alt_sep    = '│'
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
  set noshowcmd
  set scrolloff=999
  DisableGoldenViewAutoResize
  Relativity!
  set nonumber norelativenumber
  Limelight
endfunction
function! s:goyo_leave()
  if exists('$TMUX')
    silent !tmux set status on
  endif
  set showcmd
  set scrolloff=4
  EnableGoldenViewAutoResize
  Relativity
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" Vim-Signify configuration {{{
let g:signify_vcs_list           = [ 'git', 'hg' ]
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

" Cursor configuration {{{
" Use a blinking upright bar cursor in Insert mode, a solid block in normal
" and a blinking underline in replace mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let &t_SI                         = "\<Esc>[5 q"
let &t_SR                         = "\<Esc>[3 q"
let &t_EI                         = "\<Esc>[2 q"
" }}}

" vim-gutentags configuration {{{
let g:gutentags_cache_dir = $HOME . '/.vim/tags/'
let g:gutentags_resolve_symlinks = 1
" }}}

" vim-auto-save configuration {{{
let g:auto_save = 1
let g:auto_save_in_insert_mode = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_silent = 1
"}}}
" }}}
" ============================================================================
