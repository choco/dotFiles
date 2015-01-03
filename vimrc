" Set correct font for the GUI
if has('gui_running')
    set guifont=Source\ Code\ Pro\ for\ Powerline\ for\ MacVim:h12
    set guioptions-=L
    set guioptions-=r
endif

" Load Vundle configuration and Plugins
if filereadable(expand("~/.vimrc.plugins"))
  source ~/.vimrc.plugins
endif

" Enable syntax highlighting
syntax enable

" Fuck you ESC and your position
noremap! jj <ESC>

" Some standard settings to make vim better
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=indent,eol,start
set clipboard=unnamed                                        " yank and paste with the system clipboard
set encoding=utf-8
set hidden                                                   " allow buffer switching without saving
set expandtab                                                " expand tabs to spaces
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set linebreak                                                " break properly, don't split words
set shiftround
set scrolloff=3                                              " show context above/below cursorline
set sidescrolloff=5
set display+=lastline
set shiftwidth=4                                             " normal mode indentation commands use 4 spaces
set showcmd
set noshowmode
set softtabstop=4                                            " insert mode tab and backspace use 4 spaces
set tabstop=4                                                " actual tabs occupy 4 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=list:full
set wildignorecase
set showfulltag
set modeline
set modelines=5
set nostartofline                                            " Keep the cursor on the same column

" Use The Silver Searcher instead of grep
if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif

set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set smartcase                                                " case-sensitive search if any caps
set showmatch
set gdefault                                                 " assume the /g flag on :s substitutions to replace all matches in a line
set hlsearch                                                 "highlight searches
autocmd InsertEnter * :let @/=""
autocmd InsertLeave * :let @/=""

" set cursorline
" set colorcolumn=80
set complete-=i
set smarttab
set notimeout                                                " timeout on key codes
set ttimeout                                                 " but not on mappings
set ttimeoutlen=10
set fileformats+=mac                                         " because Mac is the way
set lazyredraw                                               " only render when needed
set ttyfast                                                  " faster rendering
set ttyscroll=3
set secure                                                   " stay safe
set noerrorbells                                             " Disable any annoying beeps on errors.
set visualbell

set splitbelow                                               " Open new split panes to right and bottom,
set splitright                                               " which feels more natural

" Folding
nnoremap <Space> za
vnoremap <Space> zf
set foldmethod=syntax
autocmd BufWinEnter * normal zR
"set nofoldenable
"set foldlevelstart=99

set undofile
set backup                                                   " enable backups
set noswapfile                                               " it's 2013, Vim.

set undodir=~/.vim/tmp/undo//                                " undo files
set backupdir=~/.vim/tmp/backup//                            " backups
set directory=~/.vim/tmp/swap//                              " swap files

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

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
endif

" let them know you are the king
let mapleader = ','

" Move between buffers faster
nnoremap <silent> <C-b> :silent :bp<CR>
nnoremap <silent> <C-n> :silent :bn<CR>

" Move between windows faster
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Keep window, delete buffer
nmap <leader>c <Plug>Kwbd

" Reload vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Move between visual lines, not literal ones!
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" Yeah I know... I'm week
noremap <Down> <NOP>
noremap <Up> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" In case you forgot to sudo
cmap w!! %!sudo tee > /dev/null %

" Color scheme preferences
set background=dark
colorscheme base16-ocean
noremap <F6> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Toggle paste mode for code
set pastetoggle=<F2>

" FileType specific configurations
" Support for AMPL
autocmd BufNewFile,BufRead *.mod,*.dat,*.ampl set filetype=ampl
" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell
" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
" Enable spellchecking for Git commits
autocmd FileType gitcommit setlocal spell

" NERDTree configuration
" Close vim if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore = ['\.DS_Store$']
let g:NERDTreeShowHidden=1
let g:NERDSpaceDelims=1
let g:NERDTreeMinimalUI=1
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" Indent Guides configuration
let g:indent_guides_guide_size  = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
if !has('gui_running')
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=10
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8
endif

" YouCompleteMe configuration
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/conf/ycm_extra_conf.py'

" UltiSnips configuration
let g:UltiSnipsExpandTrigger       = "<c-e>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Airline configuration
let g:airline_powerline_fonts = 1
if !has('gui_running')
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep=' '
    let g:airline#extensions#tabline#left_alt_sep='│'
    let g:airline#extensions#tabline#show_close_button = 0
endif

" EasyAlign configuration
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Leader>l <Plug>(EasyAlign)

let g:easy_align_delimiters = {
\ '"': {
\        'pattern':       '"',
\        'ignore_groups': ['String'],
\        'ignore_unmatched': 0
\      }
\ }

" Goyo configuration
nnoremap <Leader>G :Goyo<CR>

" Limelight configuration
" Goyo integration
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" Easytags configuration
let g:easytags_async = 1
let g:easytags_file = '~/.vim/tags'

" Vim-Signify configuration
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_update_on_bufenter = 1
let g:signify_disable_by_default = 1
nnoremap <leader>g :SignifyToggle<CR>

" Fzf configuration
nnoremap <leader>t :FZF<CR>

" Tagbar configuration
nnoremap <leader>o :TagbarToggle<CR>
