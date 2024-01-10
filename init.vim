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
  Plug 'diepm/vim-rest-console'                                 " consultas rest. Dependencias: curl (ver documentación)
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

"<VIM-REST-CONSOLEE>
  let g:vrc_split_request_body = 1  
  let g:vrc_output_buffer_name = '__VRC_OUTPUT.json'
  set ft=json
"</VIM-REST-CONSOLEE>
