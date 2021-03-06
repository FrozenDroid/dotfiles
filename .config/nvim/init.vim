" Plugins {{{
call plug#begin()

    Plug 'thaerkh/vim-workspace'

    " Git helpers
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Autocompletion
    "Plug 'ncm2/ncm2'
    "Plug 'roxma/nvim-yarp'
    "Plug 'ncm2/ncm2-bufword'
    "Plug 'ncm2/ncm2-tmux'
    "Plug 'ncm2/ncm2-path'
    "Plug 'Shougo/neco-vim'
 "   Plug 'Quramy/tsuquyomi'
 "   Plug 'Shougo/vimproc.vim', { 'do': 'make' }

    Plug 'moll/vim-bbye'
    Plug 'Shougo/echodoc.vim'


    Plug 'Valloric/YouCompleteMe'
    " Plug 'autozimu/LanguageClient-neovim',  { 'branch': 'next', 'do': 'bash install.sh' }

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Syntax
    Plug 'herringtondarkholme/yats.vim'

    " UI Plugins
    Plug 'scrooloose/nerdtree'
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'edkolev/tmuxline.vim'

    " Formatting
    Plug 'godlygeek/tabular'
    Plug 'tpope/vim-commentary'
    Plug 'konfekt/fastfold'
    Plug 'tpope/vim-sleuth'

    " Syntax
    Plug 'vim-syntastic/syntastic'
    Plug 'stephpy/vim-yaml'
    Plug 'rust-lang/rust.vim'
call plug#end()

" }}}

" General preferences {{{
set mouse=a
set signcolumn=yes
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
set foldcolumn=0
set foldenable
set foldlevel=0
set foldmethod=marker
set foldtext='═══'.substitute(substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|\"\ \\\|{{'.'{\\d\\=','','g'),'^\ *\\\|\ *$','\ ','g')
" }}}

" Plugin Configuration {{{
let g:ycm_key_list_stop_completion    = [ '<Enter>' ]

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_typescript_checkers      = [ 'tslint' ]

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0

let g:gitgutter_sign_added               = '++'
let g:gitgutter_sign_modified            = '--'
let g:gitgutter_sign_modified_removed    = '▁▁'
let g:gitgutter_sign_removed             = '▁▁'
" }}}

" Mapping {{{
let mapleader = "\<Space>"
let maplocalleader = mapleader

" Save
nnoremap <silent> <C-s>      :<C-u>w<CR>
inoremap <silent> <C-s>      <Esc>:w<CR>

inoremap <silent> {<CR>      {<CR>}<C-o>O
inoremap <silent> [<CR>      [<CR>]<C-o>O
inoremap <silent> (<CR>      (<CR>);<C-o>O
inoremap <silent> ({<CR>     ({<CR>});<C-o>O

nnoremap <silent> <A-Tab>    :call AltTab()<CR>
inoremap <silent> <A-Tab>    <C-c>:call AltTab()<CR>
tnoremap <silent> <A-Tab>    <C-\><C-n>:call AltTab()<CR>

" YCM
nnoremap <silent> <leader>cF  :YcmCompleter FixIt<CR>
nnoremap <silent> <leader>cf  :YcmCompleter Format<CR>
nnoremap <silent> <leader>cfi :YcmCompleter OrganizeImports<CR>
nnoremap <silent> <leader>cd  :YcmDiags<CR>
nnoremap <silent> <leader>cD  :YcmForceCompileAndDiagnostics<CR>
nnoremap <silent> <leader>cg  :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>cr  :YcmCompleter GoToReferences<CR>
nnoremap <expr>   <leader>cR  (':YcmCompleter RefactorRename ' . input("New name: ") . '<CR>')

" Buffer
nnoremap <silent> <leader>q  :<C-u>Bdelete<CR>
nnoremap <silent> <leader>Q  :<C-u>Bdelete!<CR>
nnoremap <silent> <A-q>      :<C-u>Bdelete<CR>
nnoremap <silent> <A-Q>      :<C-u>Bdelete!<CR>

" Workspace
nnoremap <silent> <leader>sw :ToggleWorkspace<CR>

" Clear search
nnoremap <silent> <BS>       :<C-u>nohlsearch<CR><C-W>z

" Search
nnoremap <expr>   <leader>sg (':<C-u>Rg ' . input("Search: ") . '<CR>')
nnoremap <silent> <leader>sF :<C-u>Files<CR>
nnoremap <silent> <leader>sb :<C-u>call fzf#run(fzf#wrap('bookmarks', {'source': 'cat ~/.config/nvim/bookmarks.txt'}, 0))<CR>
nnoremap <silent> <leader>sf :<C-u>GFiles<CR>
nnoremap <silent> <leader>sh :<C-u>History<CR>
nnoremap <silent> <leader>sl :<C-u>Lines<CR>
nnoremap <silent> <leader>sp :<C-u>call fzf#run(fzf#wrap('projects',  {'source': 'cat ~/.config/nvim/projects.txt', 'sink': 'cd'}, 0))<CR>

" Plugins
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>

" Reload init.vim
nnoremap <silent> <leader>vr :so %<CR>

" NERD tree toggle
nnoremap <silent> <leader>nt  :<C-u>NERDTreeToggle<CR>

" LSP features
nnoremap <silent>         ga :<C-u>call LanguageClient_textDocument_codeAction()<CR>
nnoremap <silent>         gd :<C-u>call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent>         gh :<C-u>call Dark_LanguageClient_textDocument_hover()<CR>
nnoremap <silent>         gr :<C-u>call LanguageClient_textDocument_rename()<CR>
nnoremap <silent>         gt :<C-u>call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <leader>ga ga
nnoremap <silent> <leader>gd gd
nnoremap <silent> <leader>gh gh
nnoremap <silent> <leader>gr gr
nnoremap <silent> <leader>gt gt
augroup tsserver
    autocmd!
    autocmd FileType typescript
                \   nnoremap <buffer> <silent> ga :<C-u>TsuQuickFix<CR>
                \ | nnoremap <buffer> <silent> gd :<C-u>TsuDefinition<CR>
                \ | nnoremap <buffer> <silent> gr :<C-u>TsuRenameSymbol<CR>
augroup end

" Tabularize
noremap  <silent> <leader>t, :Tabularize /,\zs /l0<CR>
noremap  <silent> <leader>t. :Tabularize /=>\\|-><CR>
noremap  <silent> <leader>t: :Tabularize /^[^:]*:\zs /l0<CR>
noremap  <silent> <leader>t; :Tabularize /^[^:]*:\zs /l0<CR>
noremap  <silent> <leader>t= :Tabularize /^[^=]* \zs=\ze <CR>
noremap  <silent> <leader>t\ :Tabularize /<bar><CR>
" }}}

" Theming {{{
let g:solarized_termcolors=256
syntax enable
colorscheme solarized
hi Normal ctermbg=NONE guibg=NONE
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
" }}}

" Indenting / formatting {{{
set encoding=utf-8
set fileformat=unix
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
" }}}

nohlsearch
filetype plugin indent on
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

" Functions {{{
    " Alt-tab to switch windows
    function! AltTab() " {{{
        if winnr('$') == 2
            wincmd w
        else
            wincmd p
        endif

        if exists('b:terminal_job_id')
            startinsert
        endif
    endfunction " }}}
" }}}
