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
set nowrap
set laststatus=2
set showmode
set showmatch
set matchpairs+=<:>
set nohlsearch
set incsearch
set viminfo='100,<9999,s100
syntax on
colorscheme slate
set clipboard+=unnamedplus

" Para COC
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes



call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'preservim/nerdtree'								                      " nerdtree
Plug 'tpope/vim-commentary'								                    " comentarios
Plug 'ap/vim-css-color'									                      " previsualización de colores en css
Plug 'ryanoasis/vim-devicons'							                    " iconos, requiere Nerd Fonts - Mono
Plug 'mg979/vim-visual-multi', {'branch': 'master'}		        " multiple cursore CTRL+N
Plug 'pangloss/vim-javascript'							                  " soporte a javascript
Plug 'MarcWeber/vim-addon-mw-utils'						                " requisito para snipmate
Plug 'tomtom/tlib_vim'									                      " requisito para snipmate
Plug 'garbas/vim-snipmate'								                    " snippets
Plug 'honza/vim-snippets'								                      " snippets
Plug 'vim-scripts/AutoComplPop'							                  " autocompletado
Plug 'jiangmiao/auto-pairs'								                    " autocompletar brackets
Plug 'Yggdroot/indentLine'                                    " marca la indentación
Plug 'vim-airline/vim-airline'                                " barra de estado
Plug 'vim-airline/vim-airline-themes'                         " tema para la barra de estado
Plug 'ryanoasis/vim-devicons'                                 " Iconos, requiere descargar fuentes
Plug 'nvim-lua/plenary.nvim'                                  " modulo de lua, requisito de telescope
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }   " buscador difuzo (ver documentación)
Plug 'neoclide/coc.nvim', {'branch': 'release'}               " menu emergente. Requisitos: nodejs

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

" Indentación
let g:indentLine_char = '│'

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

"<COC>
  " Para que no aparezca seleccionada la primera opción del menu emergente
  inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  " Seleccionar opción con enter (<CR>) o deshacer con ctrl-u (<C-g>u) 
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  "Usar ctrl-espacio (<c-space>) para disparar opciones
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif
  " GoTo navegación del código
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references) 
  " Usar K para mostrar la documentación en ventana de vista previa
  nnoremap <silent> K :call ShowDocumentation()<CR>
  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction
  " Formatear el código seleccionado
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)
  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s)
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
  " Soporte para el statusline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
  " Para coc-laravel
  au FileType php,blade let b:coc_root_patterns = ['.git', '.env', 'composer.json', 'artisan'] 
"</COC>
