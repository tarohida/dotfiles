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
  nnoremap j gj
  nnoremap k gk
 
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
	map date <ESC>i<C-R>=strftime("%Y/%m/%d")<CR>
  
        "for putty client
  colorscheme ron
