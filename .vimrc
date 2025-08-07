" Disable compatibility with vi which can cause unexpected issues."
                    
set nocompatible

"Set autoread when file changed from outside
set autoread
au FocusGained,BufEnter * silent! checktime

"set number
set number

set scrolloff=5


"set encoding
set encoding=utf-8

"airline stuff
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"set relative number
set relativenumber

"set background color
set background=dark

"set tty fast
set ttyfast

let g:ale_linters = {
\   'c': ['clangtidy', 'gcc'],
\   'cpp': ['clangtidy', 'g++'],
\}

let g:ale_linters_explicit = v:true
let g:ale_c_cc_options = '-std=c11 -Wall -Wextra -Wno-unused-variable'

let g:ale_fixers = {
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}

let g:ale_fix_on_save = 1  " Optional: run fixer when saving


" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

"Set colorscheme to Desert
colorscheme desert

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
			
" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on
												
" Turn syntax highlighting on.
syntax on

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4
									    		
" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

nnoremap <F1> :help<CR>

" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.
"
call plug#begin('~/.vim/plugged')


  Plug 'dense-analysis/ale'

  Plug 'preservim/nerdtree'

  Plug 'vim-airline/vim-airline' 

  Plug 'neoclide/coc.nvim', {'branch': 'release'}


  Plug 'ycm-core/YouCompleteMe'

call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Set the backslash as the leader key.
let mapleader = ","

" Fast saving
nnoremap <leader>w :w!<cr>
" Press ,\ to jump back to the last cursor position.
nnoremap <leader>\ ``

"Source current file
nnoremap <leader>so :source %<CR>

" Set the backslash as the leader key.
let mapleader = ","

" Fast saving
nnoremap <leader>w :w!<cr>
" Press ,\ to jump back to the last cursor position.
nnoremap <leader>\ ``

"Source current file
nnoremap <leader>so :source %<CR>

nnoremap <leader>so :source %<CR>

nnoremap <leader>m :set rnu <cr>

nnoremap <leader>[ :set nornu <cr>

"search stuff
nnoremap <expr> n "n" . (v:searchforward ? "zz" : "z.")
nnoremap <expr> N "N" . (v:searchforward ? "z." : "zz")


" Type jj to exit insert mode quickly.
inoremap jj <Esc>

"Remap The Esc to tab key to tab
nnoremap <leader>q :q!<CR>

" Press the space bar to type the : character in command mode.
nnoremap <space> :

nnoremap <leader><CR> :ter<CR>

" Insert a blank line above the current line without entering insert mode
nnoremap O :execute "normal! O"<CR>

" Insert a blank line below the current line without entering insert mode
nnoremap o :execute "normal! o"<CR>

" Yank from cursor to the end of line.
nnoremap Y y$

" Map the F5 key to run a Python script inside Vim.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" Mapping for horizontal split
nnoremap <leader>s :split<CR>

" Mapping for vertical split
nnoremap <leader>v :vsplit<CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


"ALE
nnoremap ]e :ALENext<CR>
nnoremap [e :ALEPrevious<CR>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Useful mapping to switch between buffers
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
" Dynamically switch to any buffer
nnoremap <Leader>b :execute "b " . input('Buffer: ')<CR>

" Useful mappings for managing tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove
nnoremap <leader>t :tabnext<CR>

" Resize split windows using arrow keys by pressing:
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTred specific mappings.
"Toggle NerdTree
nnoremap nn :NERDTreeToggle <cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

let NERDTreeMapOpenSplit = 's'
let NERDTreeMapOpenVSplit = 'v'


" }}}

function! CompileLatex()
    w
    cd %p:h
    silent !pdflatex %:p
    cd -
    redraw!
endfunction

function! OpenPdf()
    silent !zathura '%p:r'.pdf & disown
endfunction

nnoremap <buffer> <leader>c :call CompileLatex()<CR>
noremap <buffer> <leader>r :call OpenPdf()<CR>
nnoremap <buffer> <leader>so :source ~/.vimrc <CR>
nnoremap fff :call ShowFuncName() <CR>
map <C-_> :call ToggleComment()<CR>


" VIMSCRIPTS -------------------------------------------------------------- {{{
function! ToggleComment()
    execute "normal ^"
    if '//' == strpart(getline("."), col(".")-1, 2)
        execute "normal xx"
    else
        execute "normal 0i//"
    endif
endfunction


fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfunction

" beautify color-scheme
function! s:def_base_syntax()
    syntax match commonOperator "\(=\|^=\|+=\|&&\|-=\|<=\|>=\|<<=\|>>=\|&=\|\\=\|*=\||=\|!=\|||\)"
    syntax match basicTypes "\(u\?int\(8\|16\|32\|64\)\?\(*\)\?\s\|\w\+_t\(\s\|;\|)\|*\)\@=\)"
    hi link basicTypes Type
    hi commonOperator ctermfg=cyan
    hi Folded ctermbg=233 ctermfg=white cterm=bold
    hi Search ctermbg=darkgray ctermfg=NONE
    hi Comment ctermfg=lightblue
    hi LineNr ctermfg=darkgray
    hi CursorLineNr ctermfg=gray
    hi Type ctermfg=red
    hi NonText ctermfg=238
    hi Comment ctermfg=244
    hi PreCondit ctermfg=13
    " mark extra white spaces
    hi ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    syn match Tabs "\t"
    hi Tabs ctermbg=lightred guibg=red
endfunction

function! s:c_syntax()
    syntax match cCustomFunc "\w\+\s*(\@=" contains=cCustomParen
    syntax match cCustomFuncDec "\(char\s\+\|\*\s*\|void\s\+\|u\?int\(8\|16\|32\|64\)\?\s\+\|struct \w\+\s\+\|return_t\s\+\)\@<=\w\+\s*\((\)\@=" contains=cCustomParen,cType,Integers,cCustomScope
    hi link cCustomFunc Function
    hi Function ctermfg=lightblue
    hi cCustomFuncDec ctermfg=green
endfunction

function! s:cpp_syntax()
    syntax match moreTypes "\(stringstream\|string\)"
    syntax match cCustomFunc "\w\+\s*(\@=" contains=cCustomParen
    syntax match cCustomFuncDec "\(::\|bool\s\+\|string\s\+\|\*\s*\|void\s\+\|u\?int\(8\|16\|32\|64\)\?\s\+\|struct \w\+\s\+\|return_t\s\+\)\@<=\w\+\s*\((\)\@=" contains=cCustomParen,cType,Integers,cCustomScope
    syntax match cCustomScope "::"
    syntax match cCustomClass "\w\+\s*::" contains=cCustomScope
    hi cCustomClass ctermfg=13
    hi link cCustomFunc Function
    hi Function ctermfg=lightblue
    hi cCustomFuncDec ctermfg=green
    hi link moreTypes Type
endfunction

" highlight cursor line
function s:SetCursorLine()
    set cursorline
    hi cursorline cterm=none ctermbg=235
endfunction


augroup my_syntax
    au!
    autocmd FileType c call <SID>c_syntax()
"    autocmd FileType cpp call <SID>cpp_syntax()
"    autocmd FileType * call <SID>def_base_syntax()
    autocmd VimEnter * call s:SetCursorLine()
    autocmd bufEnter * let b:colors_on=0
augroup END


"Enable the folding
set foldtext=NeatFoldText()


" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" Display cursorline and cursorcolumn ONLY in active window In case of splitting
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END



" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


" }}}






" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.
"
" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2
" }}}
