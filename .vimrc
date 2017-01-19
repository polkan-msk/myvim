syntax on			" syntax highlight
colorscheme default
filetype plugin on
let mapleader = "\<Space>"
set backup 			" make backup files
set backupdir=~/.vimbackups 	" where to put backup files
set ignorecase                  " case insensetive search
set incsearch                   " incremental search
set showmatch                   " highlight the brackets
set number
:nnoremap <F6> :set ignorecase!<return> " on/off ignorecase
:nnoremap <F7> :set hlsearch!<return>   " on/off search matches hihglights
:nnoremap <F12> :set number!<return>    " on/off line numbers
set tabstop=4			" tab 4 symbols
set shiftwidth=4		" ---//---
set smarttab			" mass empty symbols treatment
set expandtab			" spaces instead of tabs
set smartindent			" auto text indents
:nnoremap <F10> :set smartindent!<return>    " on/off auto text indent

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
noremap  <C-down> gj
inoremap <C-down> <C-o>gj
noremap  <C-up> gk
inoremap <C-up> <C-o>gk

" H J K L for large steps
noremap  J 20j
noremap  K 20k

" navigate windows by Ctrl-h,j,k,l
noremap  <C-h> <C-w>h
noremap  <C-j> <C-w>j
noremap  <C-k> <C-w>k
noremap  <C-l> <C-w>l

" navigate tabs by Shift-h,l
noremap  H gT
noremap  L gt

" resize window
nnoremap <s-up> :res+7<cr>
nnoremap <s-down> :res-7<cr>
nnoremap <s-right> :vert res+17<cr>
nnoremap <s-left> :vert res-17<cr>

" statusline
set laststatus=2        " always show statusline
set statusline=%F       "full filename
set statusline+=(%n)    "buffer number
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
        hi StatusLine ctermbg=white ctermfg=red
    elseif a:mode == 'r'
        hi StatusLine ctermbg=white ctermfg=brown
    else
        hi StatusLine ctermbg=black ctermfg=yellow
    endif
endfunction
au InsertEnter * call StatuslineColor(v:insertmode)
au InsertChange * call StatuslineColor(v:insertmode)
au InsertLeave * hi StatusLine ctermbg=black ctermfg=green
" default the statusline to green when entering Vim
hi StatusLine ctermbg=black ctermfg=green

" ;ppp to insert debug print_r
noremap ;ppp i echo '<pre>'.print_r( ,1).'</pre>'; exit;<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
" type ;for to insert for expression
"inoremap ;for for($i=0; $i<; $i++){}<left><left><left><left><left><left><left><left><left>

" when close buffer by \q, force load previous one in its window
nnoremap <leader>q :bp<cr>:bw #<cr>

" <ctrl-w>t to open current buffer in new tab without closing current one
nnoremap <c-w>t :tab sb%<cr>
" <ctrl-w>T do the same but it closes window in current tab

" map <leader>n for toggle nerd-tree
nnoremap <leader>n :NERDTreeToggle<cr>
" map <leader>gn for go to current file in nerd-tree
nnoremap <leader>gn :NERDTreeFind<cr>
" map <leader>t for toggle tagbar
nnoremap <leader>t :TagbarToggle<cr>
let g:tagbar_autofocus=1

"redefine bufexplorer plugin mapping
nnoremap <leader>bi :BufExplorerHorizontalSplit<cr>
nnoremap <leader>bs :BufExplorerVerticalSplit<cr>
nnoremap <leader>bb :ToggleBufExplorer<cr>

" Set to auto read when a file is changed from the outside
set autoread

" show tabs as dots
set listchars=tab:··
set list

" set 3 lile offset while page scroll
set scrolloff=3

" folding
"set foldcolumn=2    " folding column width
nnoremap ff va{zf   " create and close fold in {}

" replace every tab with 4 space
:command Fucktabs %s/	/    /gc
" remove trailing spaces
:command Fuckspaces %s/\s\+$//gc
" show trailing spaces
:command Showspaces /\s\+$

" mark 81'th column
set colorcolumn=80
" mark background when row length becomes more than 120
"highlight OverLength ctermbg=darkgray ctermfg=white
"highlight OverLength ctermbg=darkred
"match OverLength /\%121v.\+/

command! ClearBuffers call s:ClearBuffers()
function! s:ClearBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bwipeout ".num
      "bdelete can be used instead of bdelete
    endif
  endfor
endfunction

"check current file php syntax by ctrl-f5
map <F5> :!php -l %<CR>

"To begin diffing on all visible windows:
":windo diffthis
"To end diff mode:
":diffoff!
"The ! makes diffoff apply to all windows of the current tab

" disable arrow keys in normal mode
"nnoremap <Up> :echomsg "k"<cr>
"nnoremap <Down> :echomsg "j"<cr>
"nnoremap <Left> :echomsg "h"<cr>
"nnoremap <Right> :echomsg "l"<cr>

" Set the codesniffer args (plugin PHP QA Tools For Vim + phpcs)
let g:phpqa_codesniffer_args = "--standard=~/.vim/phpcs_custom_ruleset.xml -s"
let g:phpqa_messdetector_ruleset = "~/.vim/phpmd_custom_ruleset.xml"

" Reduce update screen time to 250ms
set updatetime=250
" vim-gitgutter plugin
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
" <leader>hp preview hunk
" <leader>hu undo hunk
" ctrl-wz close preview window

" to highlight .template files like html-source
" (http://beerpla.net/2008/04/02/how-to-add-a-vim-file-extension-to-syntax-highlighting/)
au BufNewFile,BufRead *.template set filetype=html
" you can set highlight for current file as follow:
" :set syntax=html

" CTAGS
" Ctrl-] goto definition
" Ctrl-t go back
" g] - list of definitions ( use Ctrl-w-t before to open buffer in new tab )
" [i - show first line with current tag in file
" ]i - show first line with current tag in file (from current position)
" [I - show all match of current tag in file
" ]I - show all match of current tag in file (from current position)
" open definition in new tab
map <c-\> :tab split<CR>:exec("tselect ".expand("<cword>"))<CR>
" open definition in vertical split
"map <???>  :vsp <CR>:exec("tselect ".expand("<cword>"))<CR>

" disable autocomment next line by enter
set formatoptions-=r

" indent xml files on gg=G
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
