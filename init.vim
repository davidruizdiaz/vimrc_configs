set encoding=UTF-8              " codificación de caractéres
set number		                  " números de líneas
set relativenumber	            " números de líneas relativas
set tabstop=2		                " cantidad de espacios en tabulación
set shiftwidth=2
set softtabstop=2
set expandtab		                " cambia tabulaciones por espacios
set autoindent                  " auto-indentación
set smartindent                 " auto-indentación
set wrap                        " baja el texto al final de la pantalla
set mouse=a                     " funcion del mouse
set laststatus=2                " status bar
set showmode                    " muestra el modo en el que se está
set showcmd                     " muestra los comados en los modos 
set showmatch                   " resalta los brackets
set matchpairs+=<:>             " permite saltar los brackets con %
set nohlsearch                  " no resalta los resultados de no búsquedas
set incsearch                   " búsquedas incrementales
set ignorecase                  " incluye mayúsculas y minúsculas en las búsquedas
set viminfo='100,<9999,s100     " limita el tamaño de viminfo
syntax on
colorscheme slate               " esquema de color, requiere, !mkdir -p ~/.config/nvim/colors
                                " !cp $VIMRUNTIME/colors/slate.vim ~/.config/nvim/colors/slate.vim
                                " ver más colores con :colorscheme
set clipboard+=unnamedplus      " para copiar en el clipboard

" para coc
set nobackup
set nowritebackup
set updatetime=300

call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }           " buscador difuso, requiere instalar fzf, ripgrep, universal-ctags, silversearcher-ag, fd-find
  Plug 'junegunn/fzf.vim'
  Plug 'pangloss/vim-javascript'                                " soporte a javascript
  Plug 'neoclide/coc.nvim', {'branch': 'release'}               " menú emergente, requiere nodejs (ver documentación)
  Plug 'honza/vim-snippets'                                     " snippets
  Plug 'vim-airline/vim-airline'                                " barra de estado
  Plug 'vim-airline/vim-airline-themes'                         " tema para la barra de estado
  Plug 'preservim/nerdtree'                                     " NERDTree
  Plug 'ryanoasis/vim-devicons'                                 " Iconos, requiere descargar fuentes
  Plug 'tpope/vim-surround'                                     " remplazo de brackets 
  Plug 'tpope/vim-fugitive'                                     " git para vim
  Plug 'jiangmiao/auto-pairs'                                   " autocompletado de brackets
  Plug 'Yggdroot/indentLine'                                    " marca la indentación
  Plug 'tpope/vim-commentary'                                   " para comentarios
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}           " multiples cursores
  Plug 'nvim-lua/plenary.nvim'                                  " soporte para emojis
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }      " soporte para emojis
  Plug 'xiyaowong/telescope-emoji.nvim'                         " emojis, colocar require(\"telescope\").load_extension(\"emoji\")
                                                                " al final del archivo ./plugged/telescope.nvim/plugin/telescope.lua
call plug#end()

" Tecla lider
let mapleader=" "

"<TERMINAL>
  noremap <leader>tv :botright vnew <Bar> :terminal<cr>
  noremap <leader>th :botright new <Bar> :terminal<cr>
"</TERMINAL>

"<NERDTREE>
  nmap <leader>e :NERDTreeToggle<CR>
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowHidden=1
"</NERDTREE>

"<AIRLINE>
  let g:airline_powerline_fonts = 1
  set guifont=DroidSansMono\ Nerd\ Font\ 11
  let g:airline_theme='badwolf'
"</AIRLINE>

"<COC>
  let g:coc_global_extensions = [ 'coc-tsserver' ]
  " establece enter como selector de opciones
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  " usa K para mostrar la documentación
  nnoremap <silent> K :call ShowDocumentation()<CR>

  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  " GoTo navegación de codigo con coc.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  " <C-j> para saltar a la siguient opcion en coc_snippet
  let g:coc_snippet_next = '<c-j>'
  " <C-k> para saltar a la opcion anterior en coc_snippet
  let g:coc_snippet_prev = '<c-k>'
  " para saltar a $ opcion en coc_snippet
  imap <C-j> <Plug>(coc-snippets-expand-jump)
"</COC>

"<VARIOS>
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-h> <C-W>h
  map <C-l> <C-W>l
  " Indentación
  let g:indentLine_char = '│'
  " mapeo para salida de terminal
  :tnoremap <Esc> <C-\><C-n>
  " mapeo para apertura de terminal
  :imap ii <Esc>
"</VARIOS>

"<FZF BUSCADOR DIFUSO>
  " Ver comandos en https://github.com/junegunn/fzf.vim
  " Mapping selecting mappings
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)
  " Insert mode completion
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-l> <plug>(fzf-complete-line)
  " Path completion with custom source command
  inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
  inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
  " Word completion with custom spec with popup layout option
  inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
"</FZF BUSCADOR DIFUSO>
