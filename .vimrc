"""""""""""""""""""""""""""""""""""""""""""
"Get the defaults
source $VIMRUNTIME/defaults.vim

""""""""""""""""""""""""""""""""""""""""""""
"Backups

if has("vms")
  " do not keep a backup file, use versions instead
  set nobackup
else
  " keep a backup file (restore to previous version)
  set backup
  if has('persistent_undo')
    " keep an undo file (undo changes after closing)
    set undofile
  endif
endif


""""""""""""""""""""""""""""""""""""""""""""
"Setting directory paths for all the temp files
set backupdir=~/.vim/tmp//,.
set directory=~/.vim/tmp//,.
set undodir=~/.vim/tmp//,.

""""""""""""""""""""""""""""""""""""""""""""
" MISC

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" indention
filetype plugin indent on

" syntax highlighting"
syntax enable

set number
set norelativenumber
set hlsearch

"No wrapping
set nowrap
"ignorecase + smartcase
set ignorecase
set smartcase

" color scheme
colorscheme murphy
hi Normal guibg=NONE ctermbg=NONE

""""""""""""""""""""""""""""""""""""""""""""
" default reg clipboard
set clipboard=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""
" Making window switch easier
 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l
 tnoremap <C-h> <C-w>h
 tnoremap <C-j> <C-w>j
 tnoremap <C-k> <C-w>k
 tnoremap <C-l> <C-w>l

" Making window resize easier
 " nnoremap <Down> <C-w>+
 " nnoremap <Up> <C-w>-
 " nnoremap <Left> <C-w>>
 " nnoremap <Right> <C-w><


" making the mouse not go into visual mode.
" set mouse-=a

""""""""""""""""""""""""""""""""""""""""""""
"Delete trailing whitespace
autocmd BufWritePre *.py %s/\s\+$//e
autocmd BufWritePre *.c %s/\s\+$//e
autocmd BufWritePre *.h %s/\s\+$//e
autocmd BufWritePre *.yml %s/\s\+$//e
autocmd BufWritePre *.adoc %s/\s\+$//e
autocmd BufWritePre .vimrc %s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""
" Leaders
map <Leader>d "_
map <Leader>p oimport IPython<CR>IPython.embed(<Esc>

""""""""""""""""""""""""""""""""""""""""""""
"mappings
nnoremap Y y$
nnoremap <C-S> :update<CR>
inoremap <tab> <C-n>
inoremap <S-tab> <C-p>

""""""""""""""""""""""""""""""""""""""""""""
" Automatically closing braces
" inoremap { {}<Esc>ha
" inoremap ( ()<Esc>ha
" inoremap [ []<Esc>ha
" inoremap " ""<Esc>ha
" inoremap ' ''<Esc>ha
" inoremap ` ``<Esc>ha

""""""""""""""""""""""""""""""""""""""""""""
" Plugins
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-sleuth', {}
Plug 'tpope/vim-commentary', {}
Plug 'tpope/vim-surround', {}
Plug 'ludovicchabant/vim-gutentags', {}
Plug 'airblade/vim-gitgutter', {}

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""
" NERDTree settings and mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""""""""""""
" git gutter settings
set signcolumn=no
set updatetime=50
autocmd VimEnter * GitGutterLineHighlightsEnable

""""""""""""""""""""""""""""""""""""""""""""
" fzf setting
map <Leader>f :FZF<space><CR>
map <Leader>F :FZF<space>~<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

""""""""""""""""""""""""""""""""""""""""""""
" TODO
" user 10
