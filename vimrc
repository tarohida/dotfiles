set nocompatible

call plug#begin()
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
call plug#end()
  
"setting for centos7

  "about read file
  set encoding=utf-8
  set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
  set fileformats=unix,dos,mac
  "about swap, etc...
  set nobackup
  set noswapfile
  set noundofile
 
  "etc...
  set autoread
  set hidden
  set showcmd
  "use clipboard
  set clipboard=unnamed,autoselect
  "save to corrent directory
  set browsedir=buffer
  set number
  "set virtualedit=onemore
  set cindent
  set visualbell
  set showmatch
  set laststatus=2
  set wildmode=list:longest
 
  "about tab
  set tabstop=8
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set smarttab
  set ignorecase
  set smartcase
  set incsearch
  set wrapscan
  set hlsearch

  "aliases
  :command  Sp set paste

  "keymapping
  inoremap jj <Esc>
  map date <ESC>i<C-R>=strftime("%Y/%m/%d")<CR>
  map today <ESC>i<C-R>=strftime("%Y%m%d")<CR>
  nmap <silent> <Esc><Esc> :nohlsearch<CR>
  nnoremap j gj
  nnoremap k gk
  vnoremap v $h
  vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
  
  "for putty client
  colorscheme ron
  let mapleader = "\<Space>"
    " Include use statement
  nmap <Leader>u :call phpactor#UseAdd()<CR>
  
  " Invoke the context menu
  nmap <Leader>mm :call phpactor#ContextMenu()<CR>
  
  " Invoke the navigation menu
  nmap <Leader>nn :call phpactor#Navigate()<CR>
  
  " Goto definition of class or class member under the cursor
  nmap <Leader>o :call phpactor#GotoDefinition()<CR>
  
  " Show brief information about the symbol under the cursor
  nmap <Leader>K :call phpactor#Hover()<CR>
  
  " Transform the classes in the current file
  nmap <Leader>tt :call phpactor#Transform()<CR>
  
  " Generate a new class (replacing the current file)
  nmap <Leader>cc :call phpactor#ClassNew()<CR>
  
  " Extract expression (normal mode)
  nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
  
  " Extract expression from selection
  vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
  
  " Extract method from selection
  vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

  let s:local_vimrc = expand('~/.vimrc.local')
  if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
  endif
