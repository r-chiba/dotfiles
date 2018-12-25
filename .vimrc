syntax enable
set number
set ruler
set nowrap
set hidden
set autoread
set visualbell t_vb=
set noerrorbells
set history=2000
set expandtab
set autoindent
set smartindent
set tabstop=4
set softtabstop=0
set shiftwidth=4
set encoding=utf-8
set fileencodings=utf-8,sjis,cp932
set fileformats=unix,dos,mac
set nobackup
set noswapfile
set noundofile
set clipboard+=unnamed
set clipboard=unnamed
autocmd BufRead,BufNewFile Makefile setlocal noexpandtab
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
map <C-l> gt
map <C-m> gT
map <C-u> :colder<CR>
map <C-y> :cnewer<CR>
