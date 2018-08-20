call plug#begin()

" Completion
Plug 'Valloric/YouCompleteMe'

" UI Plugins
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Formatting
Plug 'tpope/vim-commentary'
Plug 'konfekt/fastfold'

call plug#end()

" General preferences
set mouse=a
set ignorecase

" Mapping
inoremap <silent> {<CR>      {<CR>}<C-o>O
inoremap <silent> [<CR>      [<CR>]<C-o>O
inoremap <silent> (<CR>      (<CR>);<C-o>O
inoremap <silent> ({<CR>     ({<CR>});<C-o>O

map <C-k> :NERDTreeToggle<CR>

" Theming
let g:solarized_termcolors=256
set background=dark
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
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Syntax highlighting
let python_highlight_all=1

" Autocomplete settings
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_autoclose_preview_window_after_completion=1

" Python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
