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

" ne skakat' po dlinnym strokam
noremap  <C-down> gj
inoremap <C-down> <C-o>gj
noremap  <C-up>   gk
inoremap <C-up>   <C-o>gk

" type ;for to insert for expression
imap ;for for($i=0; $i<; $i++){}<left><left><left><left><left><left><left><left><left>

" when close buffer by \q, force load previous one in its window
nnoremap <leader>q :bp<cr>:bd #<cr>


" disable arrow keys in normal mode
nnoremap <Up> :echomsg "use k"<cr>
nnoremap <Down> :echomsg "use j"<cr>
nnoremap <Left> :echomsg "use h"<cr>
nnoremap <Right> :echomsg "use l"<cr>

