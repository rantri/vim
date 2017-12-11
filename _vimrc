
" COLORS ------------------------------------------------------------------
set colorscheme badwolf 
syntax enable			" enable syntax processing


" Spaces & Tabs -----------------------------------------------------------
set tabstop=4			" number of visual sapces per TAB
set softtabstop=4		" number of spaces per TAB when editing
"set expandtab 			" tabs are spaces


" UI CONFIG ---------------------------------------------------------------
set ruler
set relativenumber
set cursorline			" highlight current line
filetype plugin indent on		" load filetype-specific indent files
set wildmenu			" visul autocomplete for command menu
set lazyredraw			" redraw only when we need to.
set showmatch			" highlight matching [{()}]


" SEARCHING ---------------------------------------------------------------
set incsearch			" search as characters are entered
set hlsearch			" highlight matches
set path+=**


" Plugins -----------------------------------------------------------------

if empty(glob('$HOME\vimfiles\autoload\plug.vim'))
  silent !curl -fLo $HOME\vimfiles\autoload\plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME\vimfiles\plugged')

Plug 'junegunn/vim-plug'
Plug 'kien/ctrlp.vim'

call plug#end()

" ctrlp.vim configuration ------------

" Setup some default ignores
let g:ctrlp_custom_ignore = {
	 \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
	 \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
	\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'


" Other Configurations -----------------------------------------------------

" turn off search highlight
nnoremap <Leader><Space> :nohlsearch<CR>
	
"autocmd BufRead,BufNewFile *.txt setlocal spell " spell checking for txt files

" For edit xaml files
autocmd BufRead,BufNewFile *.xaml :set filetype=xml

" Call MakeTags to create tags file in the working directory.
command! MakeTags !ctags -R .
