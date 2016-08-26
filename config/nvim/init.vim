filetype off

call plug#begin('~/.nvim/plugged')

" Code linter
function! Installjshint(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g eslint
  endif
endfunction
Plug 'scrooloose/syntastic', { 'do': function('Installjshint') }
" Commenter
Plug 'tpope/vim-commentary'
" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g tern
  endif
endfunction
Plug 'carlitux/deoplete-ternjs', { 'do': function('BuildTern') }
" markdown preview
function! InstallInstantMarkdown(info)
  if a:info.status == 'installed' || a:info.force
    !npm -g install instant-markdown-d
  endif
endfunction
Plug 'suan/vim-instant-markdown', { 'do': function('InstallInstantMarkdown') }
" Expands abbreviations similar to emmet
Plug 'mattn/emmet-vim'
" Fuzzy searching for opening files
Plug 'ctrlpvim/ctrlp.vim'
" JavaScript Beautifier (also html and css)
Plug 'maksimr/vim-jsbeautify'
" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" Closes html/xml tags after typing </
Plug 'docunext/closetag.vim'
" Git commands inside vim
Plug 'tpope/vim-fugitive'
" Automatic indentation
Plug 'tpope/vim-sleuth'
" Show the indentation with vertical lines
Plug 'Yggdroot/indentLine'
" Detect the indentation automatically
Plug 'ciaranm/detectindent'
" Show a git diff n the gutter
Plug 'airblade/vim-gitgutter'
" Change the background of css colors to match
Plug 'ap/vim-css-color'
" When searching show 'At match #N out of M matches'
Plug 'vim-scripts/IndexedSearch'
" Plugin to move lines
Plug 'matze/vim-move'
" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'
" Repeat with . after plugin maps
Plug 'tpope/vim-repeat'
" Syntax for jekyll markdown with front matter
Plug 'PProvost/vim-markdown-jekyll'
" Add JavaScript console.log
Plug 'aharris88/consolation-vim'
" Track time spent coding
Plug 'wakatime/vim-wakatime'
" enhances netrw
Plug 'tpope/vim-vinegar'
" Distraction-free writing
Plug 'junegunn/goyo.vim'
" Search
Plug 'mileszs/ack.vim'
" Scratchpad
Plug 'metakirby5/codi.vim'
" Helps you open the right file
Plug 'EinfachToll/DidYouMean'


call plug#end()

" Set leader key to comma
let mapleader = ","
let maplocalleader = "\\"

" Mappings to open config files
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>et :tabnew ~/dotfiles/tmux.conf<cr>
nnoremap <leader>ez :tabnew ~/dotfiles/zshrc<cr>
nnoremap <leader>em :tabnew ~/dotfiles/mutt/muttrc<cr>
nnoremap <leader>eg :tabnew ~/dotfiles/gitconfig<cr>

nnoremap <leader>vs :source $MYVIMRC<cr>

syntax on
set number

set laststatus=2
set ruler

" Set to dark theme at night and light theme during the day
"if strftime("%H") < 6
"  set background=dark
"else
"  set background=light
"endif
"if strftime("%H") > 18
"  set background=dark
"endif
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Turn on spell checking for commit messages and automatic wrapping at the recommended 72 characters
augroup filetype_gitcommit
  autocmd!
  autocmd Filetype gitcommit setlocal spell textwidth=72
augroup END

" Turn on spell checking for markdown files
augroup filetype_markdown
  autocmd!
  autocmd Filetype markdown setlocal spell
augroup END

" Define a thesaurus file
set thesaurus+=~/dotfiles/mthesaur.txt

" Turn on search highlighting
set hlsearch
set incsearch
set undofile
" Hide undo files in netrw
let g:netrw_list_hide='.*\.un\~$\|.*\.swp$'

" I don't need this (plus there's a possible security problem)
set modelines=0
" Don't add newline to end of file
set fileformats+=dos

set wildignorecase

" Treat all numerals as decimal (for <C-a> and <C-x>)
set nrformats=

" Set macvim font
set guifont=Anonymous\ Pro\ for\ Powerline:h14

" Mappings for moving around panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <Leader>> :exe "vertical resize +20"<CR>
nnoremap <silent> <Leader>< :exe "vertical resize -20"<CR>

tnoremap <C-h> <C-\><C-n><C-w>h
" Workaround since <C-h> isn't working in neovim right now
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Put it into insert mode when entering a terminal pane
autocmd BufWinEnter,WinEnter term://* startinsert

inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l

" Mapping for opening splits and moving into it
nnoremap <leader>sv <C-w>v<C-w>l
nnoremap <leader>ss <C-w>s<C-w>j

" Quit terminal mode with escape key
tnoremap <Esc> <C-\><C-n>

" Make the backspace work in terminal
set backspace=indent,eol,start

" Enable better indentation.
set autoindent smartindent
set smarttab

" Setup indicator for 132 columns
set colorcolumn=133

" Make Y yank to the end of the line instead of the entire line (i.e. same as yy).
noremap Y y$

" Code folding for javascript
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=10

" Set comment style for javascript to single line
augroup filetype_js
  autocmd!
  autocmd FileType javascript set commentstring=//\ %s
augroup END

" Copy to system clipboard when you yank
set clipboard=unnamed

" Enable mouse in iTerm2
set mouse=a

" Set indentation to tab characters of 4 width
:set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Close the Omni-Completion tip window when a selection is made
" These lines close it on movement in insert mode or when leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Invisible Characters
" Shortcut to toggle invisible characters
" Use the same symbols as TextMate for tabstops and EOLs
:set list listchars=tab:\ \ ,trail:-
nnoremap <leader>i :set list<CR>:set listchars=tab:▸\ ,eol:¬<CR>
nnoremap <leader>io :set list<CR>:set listchars=tab:\ \ ,trail:-<CR>
" Change color to gray
hi NonText ctermfg=7 guifg=gray
" Show this character when the line wraps
set showbreak=↪\ " Note the trailing space (escaped with a backslash) because this character is wider than 1 normal character

" Set mappings for relative line numbering
nnoremap <leader>lr :set relativenumber<CR>
nnoremap <leader>ll :set norelativenumber<CR>

" Map deleting a line in insert mode
:inoremap <C-d> <Esc>ddi
" Toggle the case of the previous word in insert mode
:inoremap <C-t> <Esc>bg~wea

" Open auto completed brackets
inoremap <C-c> <CR><Esc>O<Tab>
" Open auto completed brackets and put a semicolon on the end
inoremap <C-v> <CR><Esc>A;<Esc>O<Tab>

" Remove all trailing whitespace in a file
nnoremap <leader>w :call <SID>StripTrailingWhitespaces()<CR>

iabbrev @@ aharris88@gmail.com

set updatetime=100

" Fixes issue I was having with background color
if &term =~ '256color'
    " disable Background Color Erase (BCE)
    set t_ut=
endif

" Plugins
"
" Use deoplete
let g:deoplete#enable_at_startup = 1
let g:tern_request_timeout = 1

" Fugitive
" Automatically remove fugitive buffers from the buffer list
augroup plugin_fugitive
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" syntastic
let g:syntastic_javascript_checkers = ['eslint']

" move
nmap <M-j> <Plug>MoveLineDown
nmap <M-k> <Plug>MoveLineUp
vmap <M-j> <Plug>MoveBlockDown
vmap <M-k> <Plug>MoveBlockUp

" JsBeautify
" for js
augroup plugin_fugitive
  autocmd!
  autocmd FileType javascript noremap <buffer>  <leader>bj :call JsBeautify()<cr>
  " for html
  autocmd FileType html noremap <buffer> <leader>bh :call HtmlBeautify()<cr>
  " for css or scss
  autocmd FileType css noremap <buffer> <leader>bc :call CSSBeautify()<cr>
augroup END

" indentLine
let g:indentLine_color_term = 8

nnoremap <leader>il :IndentLinesToggle<cr>
let g:indentLine_char = '┊'

" consolate

nnoremap <leader>c :Consolate<cr>

" Functions
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Highlight all instances of word under cursor, when idle.
" It doesn't clobber the search register
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

augroup function_highlightWord
  autocmd!
  autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
augroup END

function! ShowOnGithub()
  let u = system("echo ${${${$(git --git-dir=.git config --get remote.origin.url)#git@github.com:}%.git}#https://github.com/} | xargs echo -n")
  silent exec "!open "."https://github.com/".u."/blob/master/".@%.'\#L'.line(".")
endfunction
command! -nargs=0 ShowOnGithub call ShowOnGithub()

nnoremap <Leader>gh :ShowOnGithub<CR>

setlocal conceallevel=0
