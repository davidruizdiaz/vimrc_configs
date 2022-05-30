set nocompatible              " be iMproved, requerido
filetype off                  " requerido

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Mis plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'

"themes
Plugin 'franbach/miramare'
Plugin 'dracula/vim', { 'name': 'dracula'  }

"snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

"barra de estado
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"auto imports
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}

call vundle#end()            " requerido
filetype plugin indent on    " requerido


" ## Configuaracion personal ##
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
set cursorline
set smartindent
set numberwidth=3
set showcmd
set ruler
set encoding=utf-8
set relativenumber
set showmatch
set matchtime=3
syntax enable
set termguicolors
set clipboard=unnamed
set clipboard=unnamedplus

" ## Comandos personales ##
let mapleader=" "
nmap <leader>nt :NERDTreeFind<CR>

" ## NERDTree ##
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" ## colores solarized ##
"set background=light
"set background=dark
"colorscheme solarized

" ## colores miramare ##
"let g:miramare_enable_italic = 1
"let g:miramare_disable_italic_comment = 1
"let g:miramare_transparent_background = 1
"colorscheme miramare

" ## colores dracula ##
colorscheme dracula
 
" ## tema de airline - barra de estado ##
let g:airline_theme='luna'

" ## easymotion ##
nmap <leader>f <Plug>(easymotion-s2)

" ## snipMate fix warning 
let g:snipMate = { 'snippet_version' : 1 }

" ## para autoimports ##
set wildignore=*.o,*.obj,*~                                                    
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ## Background ##
hi Normal guibg=NONE ctermbg=NONE
