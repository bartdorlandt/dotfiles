" URLs used:
" http://www.apaulodesign.com/vimrc.html
" splits: https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
" Vundle, Python, etc https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" https://amix.dk/vim/vimrc.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general and Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " Use Vim defaults (much better!)
filetype off            " required for Vundle

" Vundle settings
" set the runtime path to include Vundle and initialize
" first setup Vundle:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" https://github.com/<variable>
Plugin 'gmarik/Vundle.vim'
" python-mode should already do this
Plugin 'tmhedberg/SimpylFold'
"Plugin 'vim-scripts/indentpython.vim'

" Syntax checking / highlighting
"Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Bundle 'klen/python-mode'
" Bundle 'ervandew/supertab'
" Bundle 'davidhalter/jedi-vim'

" Vim paste easy
Plugin 'roxma/vim-paste-easy'

" Filebrowsing
" Status line + buffer
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Perl plugin
Plugin 'vim-perl/vim-perl'

" Auto-pairs plugin
Plugin 'jiangmiao/auto-pairs'

" Multi-insert, just like sublime.
Plugin 'terryma/vim-multiple-cursors'

" Vim surroundings 
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" http://vim.wikia.com/wiki/Disable_automatic_comment_insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sets how many lines of history VIM has to remember
set history=999

" Set to auto read when a file is changed from the outside
set autoread " doesn't seem to work very well

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
"default mapleader = \

" Fast saving
nmap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" (inf) during keyword completion, fix case of new word (when ignore case is on)
set infercase
" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on, grep-like regular expressions
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Show linenumbers
"set number
set relativenumber

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Split
" Using it with :sp (horizontal split) or :vsp (vertical)
set splitbelow
set splitright
" Navigate splits with 
" ctrl + [jk] : for up and down)
" ctrl + [lh] : for left and right)
" :help splits

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on

colorscheme ron
" other: elflord, ron, slate, torte
" 2nd best: default, koehler, pablo, desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

highlight BadWhitespace ctermbg=red guibg=red

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
"set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set nocompatible        " Use Vim defaults (much better!)
"set paste               #" to be able to paste text without worrying about " or # in front of lines
set pastetoggle=<F2>

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=4
set tabstop=4
" Use spaces instead of tabs
"set expandtab

" When using smart indent this will make sure the # doesn't go back beginning of the line
" if you are using smartindent
" http://vim.wikia.com/wiki/Restoring_indent_after_typing_hash
:inoremap # X<BS>#

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" Fold docstring by default
let g:SimpylFold_docstring_preview=1

" File Specific Settings
" ------------------------------------------------------------
au FileType xhtml,html,htm,php,xml setlocal nolbr softtabstop=2
"au FileType xhtml,html,htm,php,xml setlocal expandtab      " (et) expand tabs to spaces (use :retab to redo entire file)

"au FileType c,h,java,js setlocal mps+==:;                   " allow the match pairs operation (%) to work with '=' and ';'

"au FileType c,h setlocal cindent                            " enable the intelligent cindent (cin) feature for the following files
"au FileType java,js setlocal smartindent                    " enable the smartindenting (si) feature for the following files

" Defaults
set autoindent
set copyindent
set smartindent
set smarttab

" Shell - bash
au         BufNewFile *.sh set fileformat=unix

" Perl
au BufRead,BufNewFile *.pl set tabstop=2
au BufRead,BufNewFile *.pl set softtabstop=2
au BufRead,BufNewFile *.pl set shiftwidth=2
au BufRead,BufNewFile *.pl set nolbr
"au BufRead,BufNewFile *.pl set nonumber
"au BufRead,BufNewFile *.pl set cursorline
au BufRead,BufNewFile *.pl set showmatch
au         BufNewFile *.pl set fileformat=unix

" Python, PEP-008
au BufRead,BufNewFile *.py,*.pyw set textwidth=79
au BufRead,BufNewFile *.py,*.pyw set tabstop=4
au BufRead,BufNewFile *.py,*.pyw set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set lbr
"au BufRead,BufNewFile *.py,*.pyw set nonumber
"au BufRead,BufNewFile *.py,*.pyw set cursorline
au BufRead,BufNewFile *.py,*.pyw set showmatch
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
au         BufNewFile *.py,*.pyw set fileformat=unix

" done by python-mode
"autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.pl :call DeleteTrailingWS()

" Use the below highlight group when displaying bad whitespace is desired.
"highlight BadWhitespace ctermbg=red guibg=red
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au FileType txt setlocal fo+=tn

" Other settings related to filetype
"autocmd BufRead *.py set cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.pl set cinwords=if,elsif,else,foreach,while,sub,for,bless,method

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" A buffer becomes hidden when it is abandoned
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
"nmap <leader>l :bnext<CR>

" Move to the previous buffer
"nmap <leader>h :bprevious<CR>

nmap <F3> :bprevious<CR>
nmap <F4> :bnext<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000-bd!<cr>

" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
	set switchbuf=useopen,usetab,newtab
	set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ Width:\ %v


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
" map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
"
"if has("mac") || has("macunix")
	"nmap <D-j> <M-j>
	"nmap <D-k> <M-k>
	"vmap <D-j> <M-j>
	"vmap <D-k> <M-k>
"endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" When you press gv you vimgrep after the selected text
"vnoremap <silent> gv :call VisualSelection('gv')<CR>
"
"" Open vimgrep and put the cursor in the right position
"map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
"
"" Vimgreps in the current file
"map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right> 
"" When you press <leader>r you can search and replace the selected text
"vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

"" Do :help cope if you are unsure what cope is. It's super useful!
""
"" When you search with vimgrep, display your results in cope by doing:
""   <leader>cc
""
"" To go to the next search result do:
""   <leader>n
""
"" To go to the previous search results do:
""   <leader>p
"
"map <leader>cc :botright cope<cr>
"map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <eader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
noremap <Leader>m :call RemoveM()<cr>

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
	exe "menu Foo.Bar :" . a:str
	emenu Foo.Bar
	unmenu Foo
endfunction

function! VisualSelection(direction) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	elseif a:direction == 'gv'
		call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
	elseif a:direction == 'replace'
		call CmdLine("%s" . '/'. l:pattern . '/')
	elseif a:direction == 'f'
	execute "normal /" . l:pattern . "^M"
	endif

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	en
	return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! RemoveM()
  :%s///g
endfunction

"function! RemoveWhiteSpace()
"  :%s/\s*$//g
"  :'^
"  "`.
"endfunction
"
"" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""
" Python settings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
" Defaults are commented.
let g:pymode = 1
let g:pymode_python = 'python3'

" Documentation
let g:pymode_doc = 0
"let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
" " Values may be chosen from: `pylint`, `pep8`, `mccabe`, `pep257`, `pyflakes`.
" Auto check on save
let g:pymode_lint_write = 1

" Mccabe complexity setting
"let g:pymode_lint_options_mccabe = { 'complexity': 12 }

"let g:pymode_rope = 1
" added additionally.
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<leader>c'
let g:pymode_rope_autoimport_modules = ['os', 're', 'argparse', 'datetime']

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_highlight_self = g:pymode_syntax_all

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Don't autofold code
let g:pymode_folding = 0

" Python3 highlight code
"let python_highlight_all = 1

""" jedi-vim """
" https://github.com/davidhalter/jedi-vim
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
""let g:jedi#completions_command = "<C-Space>"
"let g:jedi#completions_command = "<leader>c"
"let g:jedi#rename_command = "<leader>r"


"""""""""""""""""""""""""""""""""
" airline settings
"""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1

" Additional settings for putty/windows
if $TERM == "linux"
  set t_Co=256
  set guioptions-=T
  set guioptions+=e
  set guitablabel=%M\ %t
endif
