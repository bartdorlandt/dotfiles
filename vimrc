" URLs used:
" http://www.apaulodesign.com/vimrc.html
" splits: https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
" Vundle, Python, etc
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" https://amix.dk/vim/vimrc.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " Use Vim defaults (much better!)
"filetype off            " required for Vundle

filetype plugin indent on		" required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sets how many lines of history VIM has to remember
set history=999

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
" default leader = \
" let mapleader = ","
" let g:mapleader = ","
"let maplocalleader = "<space>"

" Fast saving
nmap <leader>, :w!<cr>

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
"set relativenumber

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

" Additional settings for putty/windows
if $TERM == "linux"
  set t_Co=256
  set guioptions-=T
  set guioptions+=e
  set guitablabel=%M\ %t
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
"set nowb
set noswapfile

" undo
if !isdirectory($HOME.'/.vim/undodir')
    call mkdir($HOME.'/.vim/undodir', 'p')
endif

set undofile
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://vim.wikia.com/wiki/Disable_automatic_comment_insertion
" r       Automatically insert the current comment leader after hitting
"         <Enter> in Insert mode.
" c       Auto-wrap comments using textwidth, inserting the current comment
"         leader automatically.
" o       Automatically insert the current comment leader after hitting 'o' or
"         'O' in Normal mode.
" t       Auto-wrap text using textwidth
" 1       Don't break a line after a one-letter word.  It's broken before it
"         instead (if possible).
" q       Allow formatting of comments with "gq".
"         Note that formatting will not change blank lines or lines containing
"         only the comment leader.  A new paragraph starts after such a line,
"         or when the comment leader changes.
" n       When formatting text, recognize numbered lists.  This actually uses
"         the 'formatlistpat' option, thus any kind of list can be used.  The
"         indent of the text after the number is used for the next line.  The
"         default is to find a number, optionally followed by '.', ':', ')',
"         ']' or '}'.  Note that 'autoindent' must be set too.  Doesn't work
"         well together with "2".
"         Example:
"                 1. the first item
"                    wraps
"                 2. the second item
"
autocmd FileType * set formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType * set formatoptions+=1 formatoptions+=t formatoptions+=q
" set default fileformat
autocmd Bufnewfile * set fileformat=unix

" set nopaste
set pastetoggle=<F2>
"Copy paste to/from clipboard
" Requires +xterm_clipboard support. test via:
" vim --version | grep xterm
" apt install vim-gnome for support e.g.

" set clipboard=unnamed

vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Use spaces instead of tabs
" set expandtab

" When using smart indent this will make sure the # doesn't go back beginning
" of the line if you are using smartindent
" http://vim.wikia.com/wiki/Restoring_indent_after_typing_hash
:inoremap # X<BS>#

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" File Specific Settings
" ------------------------------------------------------------

" Defaults
set autoindent
set copyindent
set smartindent
" Be smart when using tabs ;)
set smarttab
" set indentkeys-=0#
set nolbr
" set textwidth=100
" set wrapmargin=0
" set colorcolumn=+1
" Setting the default comment insertion with a leader.
" It may be overrulled by language specific settings
nmap <leader>c I# <esc>

" Vim
" autocmd FileType vim setlocal textwidth=100
autocmd FileType vim nnoremap <buffer> <leader>c I" <esc>
autocmd FileType vim match BadWhitespace /^\t\+/
autocmd FileType vim match BadWhitespace /\s\+$/

" Perl
" au BufNewFile,BufRead *.conf set filetype=perl
autocmd FileType perl setlocal showmatch
" autocmd FileType perl setlocal formatoptions-=t
autocmd FileType perl autocmd BufWritePre <buffer> :call DeleteTrailingWS()
" autocmd FileType perl nnoremap <buffer> <leader>c I# <esc>

" Python, PEP-008
autocmd FileType python setlocal nonumber
"autocmd FileType python setlocal cursorline
autocmd FileType python setlocal textwidth=79
autocmd FileType python setlocal showmatch
autocmd FileType python setlocal expandtab
"autocmd FileType python setlocal relativenumber
autocmd FileType python match BadWhitespace /^\t\+/
autocmd FileType python match BadWhitespace /\s\+$/
autocmd FileType python autocmd BufWritePre <buffer> :call DeleteTrailingWS()
autocmd FileType python setlocal formatoptions-=t
" autocmd FileType python nnoremap <buffer> <leader>c I# <esc>

" Markdown
" autocmd FileType markdown setlocal textwidth=90
" autocmd FileType markdown setlocal expandtab
autocmd FileType markdown setlocal lbr
autocmd FileType markdown setlocal fo+=n
"autocmd FileType markdown autocmd BufWritePre <buffer> :call DeleteTrailingWS()

" sql
autocmd FileType sql nnoremap <buffer> <leader>c I-- <esc>
autocmd FileType sql autocmd BufWritePre <buffer> :call DeleteTrailingWS()

" txt
autocmd FileType txt setlocal fo+=n
autocmd FileType txt autocmd BufWritePre <buffer> :call DeleteTrailingWS()

" json
autocmd FileType json setlocal conceallevel=0

" yaml
autocmd FileType yaml setlocal ts=2
autocmd FileType yaml setlocal sts=2
autocmd FileType yaml setlocal sw=2
autocmd FileType yaml setlocal expandtab
autocmd FileType yaml setlocal fo+=n

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Always use vertical diffs
" set diffopt+=vertical

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" To jump to the most outer or bracket, accolades, parantheses.
nmap <leader>{ 10[{
nmap <leader>} 10]}
nmap <leader>[ 10[[
nmap <leader>] 10]]
nmap <leader>( 10[(
nmap <leader>) 10])

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way/quicker to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" A buffer becomes hidden when it is abandoned
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move between buffers using the F-keys
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

" Save the file using sudo, when you forgot it
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

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

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
map <leader>m :call RemoveM()<cr>

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" enable mouse, mainly used for inside tmux
set mouse=a
" disable pointer selection (quite annoying, when selecting the pane in tmux
nmap <LeftMouse> <nop>
imap <LeftMouse> <nop>
vmap <LeftMouse> <nop>
nmap <2-LeftMouse> <nop>
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
	endif
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
  :%s/
//g
endfunction

"" Delete trailing white space on save, useful for Python.
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Vimdiff colorscheme
" if &diff
" 	colorscheme darkblue
" endif

" Load up all of our plugins
if filereadable(expand("~/.vimrc.bundles"))
	source ~/.vimrc.bundles
endif

