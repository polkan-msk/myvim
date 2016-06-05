syntax on			" syntax highlight
colorscheme peachpuff
set backup 			" make backup files
set backupdir=~/.vimbackups 	" where to put backup files
set ignorecase                  " case insensetive search
set incsearch                   " incremental search
set showmatch                   " highlight the brackets
set number
:nnoremap <F7> :set hlsearch!<return>   " on/off search matches hihglights 
:nnoremap <F12> :set number!<return>    " on/off line numbers
set tabstop=4			" tab 4 symbols
set shiftwidth=4		" ---//---
set smarttab			" mass empty symbols treatment
set expandtab			" spaces instead of tabs
set smartindent			" auto text indents
:nnoremap <F11> :set smartindent!<return>    " on/off auto text indent

set wildmenu                    " show menu on tab navigation
set fileencodings=utf8,cp1251   " try encodings on file open
set encoding=utf8

"<F8> Change encoding
set  wcm=<Tab>
menu Enc.cp1251     :e ++enc=cp1251<CR>
menu Enc.koi8-r     :e ++enc=koi8-r<CR>
menu Enc.cp866      :e ++enc=ibm866<CR>
menu Enc.utf-8      :e ++enc=utf-8<CR>
menu Enc.ucs-2le    :e ++enc=ucs-2le<CR>
map  <F8> :emenu Enc.<Tab>

" Treat long lines as break lines (useful when moving around in them)
noremap  <C-j> gj
inoremap <C-j> <C-o>gj
noremap  <C-k> gk
inoremap <C-k> <C-o>gk

set laststatus=2        " always show statusline
set statusline=%F       "full filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l:%L   "cursor line/total lines
set statusline+=\ \ \ %P    "percent through file
function! StatuslineColor(mode)
    if a:mode == 'i'
        hi StatusLine ctermbg=black ctermfg=brown
    elseif a:mode == 'r'
        hi StatusLine ctermbg=black ctermfg=yellow
    else
        hi StatusLine ctermbg=black ctermfg=red
    endif
endfunction
au InsertEnter * call StatuslineColor(v:insertmode)
au InsertChange * call StatuslineColor(v:insertmode)
au InsertLeave * hi StatusLine ctermbg=black ctermfg=gray
" default the statusline to green when entering Vim
hi StatusLine ctermbg=black ctermfg=gray

" type ;for to insert for expression
imap ;for for($i=0; $i<; $i++){}<left><left><left><left><left><left><left><left><left>

" when close buffer by \q, force load previous one in its window
nnoremap <leader>q :bp<cr>:bd #<cr>

" map \n for toggle nerd-tree
nnoremap <leader>n :NERDTreeToggle<cr>

" Set to auto read when a file is changed from the outside
set autoread

" show tabs as dots
set listchars=tab:··
set list

" set 3 lile offset while page scroll
set scrolloff=3

" folding
set foldcolumn=3    " folding column width
nnoremap ff va{zf   " create and close fold in {}

" disable arrow keys in normal mode
nnoremap <Up> :echomsg "use k"<cr>
nnoremap <Down> :echomsg "use j"<cr>
nnoremap <Left> :echomsg "use h"<cr>
nnoremap <Right> :echomsg "use l"<cr>
