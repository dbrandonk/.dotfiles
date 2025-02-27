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
autocmd BufWritePre *.xml %s/\s\+$//e
autocmd BufWritePre Dockerfile %s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""
" Leaders
nnoremap <Leader>g :!git difftool<CR>
nnoremap <Leader>p oimport IPython<CR>IPython.embed()<Esc>
nnoremap <Leader>s :set spell!<CR>
nnoremap <Leader>Q :cquit<CR>
nnoremap <Leader>q :qall<CR>
nnoremap <Leader>b :Git blame<CR>

""""""""""""""""""""""""""""""""""""""""""""
"mappings
nnoremap Y y$
nnoremap <C-S> :update<CR>

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
Plug 'tpope/vim-fugitive', {} " more git vim stuff
Plug 'ludovicchabant/vim-gutentags', {} " tags
Plug 'airblade/vim-gitgutter', {} " git diff
Plug 'tmux-plugins/vim-tmux-focus-events', {}
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""
" NERDTree settings and mappings
" nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""""""""""""
" jedi vim

" let g:jedi#completions_command = "<tab>"
" let g:jedi#goto_command = "<C-]>"
let g:jedi#completions_command = ""
let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_stubs_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#rename_command = "<leader>r"
let g:jedi#rename_command_keep_name = "<leader>R"
let g:jedi#usages_command = "<leader>n"

""""""""""""""""""""""""""""""""""""""""""""
" git gutter settings
set signcolumn=no
set updatetime=50
autocmd VimEnter * GitGutterLineHighlightsEnable

" Making sure the displayed diffs go away after a commit.
au CursorHold,CursorHoldI * GitGutterAll
au FocusGained,BufEnter * :GitGutterAll


""""""""""""""""""""""""""""""""""""""""""""
" diff coloring
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

""""""""""""""""""""""""""""""""""""""""""""
" let's always start at the top of the file when we are doing a diff.
autocmd VimEnter * if &diff | execute "normal gg" | endif

""""""""""""""""""""""""""""""""""""""""""""
" guten tags settings
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.git']

let g:gutentags_cache_dir = "/tmp"

let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]

let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.js',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

""""""""""""""""""""""""""""""""""""""""""""
" fzf settings
" not using this right now.
" let $FZF_DEFAULT_COMMAND = 'rg --hidden --ignore .git -g ""'
" I'm going to use this for now because I like how \t comes up.
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
nnoremap <Leader>t :FZF<space><CR>
nnoremap <Leader>T :FZF<space>~<CR>
nnoremap <Leader>f :Rg<space><CR>
nnoremap <Leader>F :Rg<space>~<CR>

nnoremap <silent> <Leader>d :GFiles?<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>c :BCommits<CR>
nnoremap <silent> <Leader>C :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>

""""""""""""""""""""""""""""""""""""""""""""
" file changes outside of vim settings
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
" set autoread (If you get tired of confirming.)

""""""""""""""""""""""""""""""""""""""""""""
" TODO
" read vim docs user 10.3 and beyond
