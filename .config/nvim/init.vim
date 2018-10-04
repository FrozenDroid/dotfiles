call plug#begin()

    " Autocomplete
    " assuming you're using vim-plug: https://github.com/junegunn/vim-plug
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'

    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANTE: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-tmux'
    Plug 'ncm2/ncm2-path'
    Plug 'Shougo/neco-vim'

    Plug 'autozimu/LanguageClient-neovim',  { 'branch': 'next', 'do': 'bash install.sh' }

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " UI Plugins
    Plug 'scrooloose/nerdtree'
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Formatting
    Plug 'godlygeek/tabular'
    Plug 'tpope/vim-commentary'
    Plug 'konfekt/fastfold'

call plug#end()

" General preferences
set mouse=a
set hlsearch
set incsearch
set noshowmode
set nowrap
set number
set ignorecase
set background=dark
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
set encoding=utf8
set fillchars+=fold:═
set fillchars+=vert:▌
" set foldclose=all
set foldcolumn=0
set foldenable
set foldlevel=0
set foldmethod=marker
" set foldopen=all
set foldtext='═══'.substitute(substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|\"\ \\\|{{'.'{\\d\\=','','g'),'^\ *\\\|\ *$','\ ','g')

" Mapping
let mapleader = "\<Space>"
let maplocalleader = mapleader

" Save
nnoremap <silent> <C-s>      :<C-u>w<CR>
inoremap <silent> <C-s>      <Esc>:w<CR>

inoremap <silent> {<CR>      {<CR>}<C-o>O
inoremap <silent> [<CR>      [<CR>]<C-o>O
inoremap <silent> (<CR>      (<CR>);<C-o>O
inoremap <silent> ({<CR>     ({<CR>});<C-o>O

" Clear search
nnoremap <silent> <BS>       :<C-u>nohlsearch<CR><C-W>z

" Search
nnoremap <expr> <leader>sg (':<C-u>Ag ' . input("Search: ") . '<CR>') 

" Plugins
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>

" Reload init.vim
nnoremap <silent> <leader>vr :so %<CR>

" NERD tree toggle
nnoremap <silent> <leader>nt  :<C-u>NERDTreeToggle<CR>

" Tabularize
noremap  <silent> <leader>t, :Tabularize /,\zs /l0<CR>
noremap  <silent> <leader>t. :Tabularize /=>\\|-><CR>
noremap  <silent> <leader>t: :Tabularize /^[^:]*:\zs /l0<CR>
noremap  <silent> <leader>t; :Tabularize /^[^:]*:\zs /l0<CR>
noremap  <silent> <leader>t= :Tabularize /^[^=]* \zs=\ze <CR>
noremap  <silent> <leader>t\ :Tabularize /<bar><CR>

" Theming
let g:solarized_termcolors=256
syntax enable
colorscheme solarized
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1

" Indenting / formatting
set encoding=utf-8
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set fileformat=unix

nohlsearch
filetype plugin indent on

" Enable folding with the spacebar
nnoremap <space> za

" Syntax highlighting
let python_highlight_all=1

" Python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
