"=======================================================================
" Common options
set nobk  "no backup files
"set smartcase
set wildmode=list:full
set backspace=indent,eol,start
set shortmess+=I
set showcmd
set swb="split"
set tags+=,./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags

"========================
" Japanese settings
set encoding=japan
set iminsert=0
set imsearch=0

"========================
" Search related stuff
set noincsearch
"set incsearch
set hlsearch  "highlight search results
set grepprg=findstr\ $*

"========================
"indentation stuff
set autoindent
set shiftwidth=2
set tabstop=2
set expandtab

"========================
" Visual settings
syntax on
set ruler
"set nowrap
set visualbell
colorscheme mocha
set number
set listchars=eol:$,tab:>-

if has('gui_running')
  set lines=50
  set columns=85
endif

"=======================================================================
" Folding stuff
hi FoldColumn guifg=DarkBlue guibg=grey78 gui=Bold ctermfg=DarkBlue ctermbg=Grey cterm=Bold
set foldcolumn=2
set foldclose=
set foldmethod=indent
set foldnestmax=10
set foldlevel=0
set fillchars=vert:\|,fold:\
set foldminlines=3
" Toggle fold state between closed and opened.
"
" If there is no fold at current line, just moves forward.
" If it is present, reverse it's state.
fu! ToggleFold()
  if foldlevel('.') == 0
    normal! l
  else
    if foldclosed('.') < 0
       . foldclose
    else
       . foldopen
    endif
  endif
  echo
endf

" Map this function to Space key.
noremap <space> :call ToggleFold()<CR>

"=======================================================================
" Filetype Specific settings

""""""""""""""""""""""""""""""""""
" standard text files
fu! SetTextmode()
  set shiftwidth=4
  set tabstop=4
  set nofen
  set syntax=markdown
endf
au BufNewFile,BufRead *.txt,*.markdown,*.md call SetTextmode()

"=======================================================================
" for NeoSnippet

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='C:/Vim/vimfiles/bundle/snipmate-snippets/snippets'

