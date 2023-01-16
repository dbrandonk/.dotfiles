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
hi EndOfBuffer guibg=NONE ctermbg=NONE

""""""""""""""""""""""""""""""""""""""""""""
" default reg clipboard
set clipboard=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""
" open hyperlinks with gx
let g:netrw_browsex_viewer= "xdg-open"

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


""""""""""""""""""""""""""""""""""""""""""""
" Mouse stuff
set mouse=n " only work for normal and terminal modes.
set ttymouse=sgr " work with tmux

""""""""""""""""""""""""""""""""""""""""""""
"Delete trailing whitespace
autocmd BufWritePre *.py %s/\s\+$//e
autocmd BufWritePre *.c %s/\s\+$//e
autocmd BufWritePre *.cpp %s/\s\+$//e
autocmd BufWritePre *.h %s/\s\+$//e
autocmd BufWritePre *.hpp %s/\s\+$//e
autocmd BufWritePre *.yml %s/\s\+$//e
autocmd BufWritePre *.adoc %s/\s\+$//e
autocmd BufWritePre .vimrc %s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""
" Leaders
map <Leader>d "_
map <Leader>p oimport IPython<CR>IPython.embed(<Esc>)
nnoremap <Leader>s :set spell<CR>

""""""""""""""""""""""""""""""""""""""""""""
"mappings
nnoremap Y y$
nnoremap <C-S> :update<CR>
inoremap <tab> <C-n>
inoremap <S-tab> <C-p>

""""""""""""""""""""""""""""""""""""""""""""
" Plugins
call plug#begin()
" run :PlugInstall to download this stuff

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
Plug 'junegunn/fzf.vim' " fuzzy finder
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " tree explorer
Plug 'tpope/vim-sleuth', {} " indentation
Plug 'tpope/vim-commentary', {} " comment out stuff
Plug 'tpope/vim-surround', {} " surround
Plug 'ludovicchabant/vim-gutentags', {} " tages
Plug 'airblade/vim-gitgutter', {} " git diff
" Plug 'davidhalter/jedi-vim'

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
" guten tags settings
let g:gutentags_cache_dir = "/tmp"
let g:gutentags_ctags_exclude = [
      \ '*.git',
      \ '*js',
      \ ]

""""""""""""""""""""""""""""""""""""""""""""
" fzf setting
map <Leader>t :FZF<space><CR>
map <Leader>T :FZF<space>~<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
map <Leader>f :Ag<space><CR>
map <Leader>F :Ag<space>~<CR>

""""""""""""""""""""""""""""""""""""""""""""
" TODO
" user 10
"
" plugins
" jedi vim
" ale
