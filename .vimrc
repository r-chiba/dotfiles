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
set modeline
set modelines=5
set hlsearch
nnoremap <C-g> :Gtags
nnoremap <C-h> :Gtags -f %<CR>
nnoremap <C-j> :GtagsCursor<CR>
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>
nnoremap <C-l> gt
nnoremap <C-m> gT
nnoremap <C-e> :colder<CR>
nnoremap <C-y> :cnewer<CR>
nnoremap ; :
nnoremap : ;

let &t_SI .= "\e[6 q" " start insert mode; solid vertical bar cursor
let &t_EI .= "\e[2 q" " end insert mode; solid block cursor
let &t_SR .= "\e[1 q" " start replace mode; blinking block cursor
let ff_table = {'dos': 'CR+LF', 'unix': 'LF', 'max': 'CR'}
let &statusline = '%f %h%m%r%w%=[%{(&fenc!=""?&fenc:&enc)}:%{ff_table[&ff]}] %-14.(%l,%c%V%) %P'

augroup mycmd
    autocmd!
    " don't convert tab to spaces if the file is Makefile
    autocmd BufRead,BufNewFile Makefile setlocal noexpandtab
    " set the cursor to the last position
    autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
    " Close the quickfix window if there is only the window
    autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype') == 'quickfix') | quit | endif
    " invalidate auto-comment functionality
    autocmd BufEnter * setlocal formatoptions-=ro
augroup END

