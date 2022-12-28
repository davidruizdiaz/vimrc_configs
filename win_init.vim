set encoding=utf8
set number
set relativenumber
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set mouse=a
set wrap
set laststatus=2
set showmode
set showmatch
set matchpairs+=<:>
set nohlsearch
set incsearch
set viminfo='100,<9999,s100
syntax on

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'mattn/emmet-vim'									              " emmet
Plug 'preservim/nerdtree'								              " nerdtree
Plug 'tpope/vim-commentary'								            " comentarios
Plug 'ap/vim-css-color'									              " previsualización de colores en css
Plug 'ryanoasis/vim-devicons'							            " iconos, requiere Nerd Fonts - Mono
Plug 'mg979/vim-visual-multi', {'branch': 'master'}		" multiple cursore CTRL+N
Plug 'pangloss/vim-javascript'							          " soporte a javascript
Plug 'tpope/vim-fugitive'								              " soporte git 
Plug 'MarcWeber/vim-addon-mw-utils'						        " requisito para snipmate
Plug 'tomtom/tlib_vim'									              " requisito para snipmate
Plug 'garbas/vim-snipmate'								            " snippets
Plug 'honza/vim-snippets'								              " snippets
Plug 'vim-scripts/AutoComplPop'							          " autocompletado
Plug 'jiangmiao/auto-pairs'								            " autocompletar brackets
Plug 'vim-airline/vim-airline'                        " barra de estado
Plug 'vim-airline/vim-airline-themes'                 " tema para la barra de estado
Plug 'ryanoasis/vim-devicons'                         " Iconos, requiere descargar fuentes

call plug#end()

" tecla lider espacio
let mapleader=" "


" # CONFIGURACIONES DE PLUGGINS #

" Para vim-javascript
let g:javascript_plugin_jsdoc = 1

" NERDTree
nmap <leader>nt :NERDTreeFind<CR> 
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" Airline
let g:airline_powerline_fonts = 1
set guifont=FantasqueSansMono\ Nerd\ Font\ 11
let g:airline_theme='badwolf'

" SnipMate
let g:snipMate = { 'snippet_version' : 1 }


" # CONFIGURACIÓN DE ARCHIVOS DE RECUPERACIÓN #

" Archivos de deshacer y rehacer
if !isdirectory($HOME."/.vim")
    silent! call mkdir($HOME."/.vim")
endif
if !isdirectory($HOME."/.vim/undo_dir")
    silent! call mkdir($HOME."/.vim/undo_dir",)
endif

set undodir=$HOME/.vim/undo_dir//
set undofile

" Configuración de archivos de swap
if !isdirectory($HOME."/.vim/tmp")
    silent! call mkdir($HOME."/.vim/tmp")
endif
set directory=$HOME/.vim/tmp//


" Configuración de archivos de backup y swap
"if !isdirectory($HOME."/.vim/backupdir")
"    silent! call mkdir($HOME."/.vim/backupdir")
"endif

"set backup
"set backupdir=$HOME/.vim/backupdir//
"set writebackup
"set backupcopy=yes
"au BufWritePre * let &bex = '@' . strftime("%F.%H:%M") " nombre del archivo
