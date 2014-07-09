" URL: https://github.com/rhalff/vimrc
"
"------------------------------------------------------------
" Features {{{1
"

" place yanked stuff into the global clipboard
" set clipboard=unnamedplus
" copy/paste to/from x clipboard

" Use pathogen
execute pathogen#infect()

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Start searching as soon as you start typing the keyword
set incsearch

" Set terminal to 256 colors
set t_Co=256

" our leader is ,
:let mapleader = ","

" proper copying with Ctrl+v & Ctrl+p
vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u
map <Insert> :set paste<CR>i<CR><CR><Esc>k:.!xclip -o<CR>JxkJx:set nopaste<CR>

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin on

" aliases
autocmd BufNewFile,BufRead *.fbp set filetype=fbp
autocmd BufNewFile,BufRead *.ejs set filetype=html

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" close everything without saving using F4
nnoremap <F4> :qa!<CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:gitgutter_realtime = 1
" let g:gitgutter_enabled = 1
" let g:gitgutter_highlight_lines = 1
" hi SignColumn ctermbg=black
"gitgutter

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax on

" Set utf8 as standard encoding
set encoding=utf8

colorscheme peaksea " molokai, peaksea, solarized
set background=dark

" *always* remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

"------------------------------------------------------------
" Lazy stuff
"

" double semicolon to add a semicolon ';' at the end of the line
nnoremap ;; A;<Esc>

" Source the vimrc file after saving it (liveedit)
autocmd bufwritepost .vimrc source ~/.vimrc

" allow saving when you forgot sudo
cmap w!! w !sudo tee % >/dev/null

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Show matching brackets when text indicator is over them
set showmatch

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
" don't use this, breaks right mouse click
"set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
"
" Indentation settings for using hard tabs for indent.
" Display tabs as two characters wide.
set shiftwidth=2

"set softtabstop=2
set tabstop=2

" Use spaces instead of tabs
set expandtab

" be smart when using tabs
set smarttab

" Auto indent
set autoindent

" Smart indent
set smartindent

" wrap lines
set wrap

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
" nnoremap <C-L> :nohl<CR><C-L>

"------------------------------------------------------------
" Buffer switching
"
" To switch a buffer you must do :bn etc.
" Use either the cursor keys or Ctrl + l etc.
" map <Left> :bp<CR><C-L>
map <leader>h :bp<CR>
" map <Right> :bn<CR><C-L>
map <leader>l :bn<CR>

" map <leader>q :bd<CR>
"
" leader q closes buffer
" Uses vim-bbye
map <Leader>q :Bdelete<CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Remember info about open buffers on close
set viminfo^=%

" save file
map <Leader>w :w<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"------------------------------------------------------------
" NERDTree
"

" Make modifiable
" set modifiable

" Map a specific key or shortcut to open NERDTree
" In this case it's keyboard specific.

" Map Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Also Map <spacebar> n
map <leader>n :NERDTreeToggle<CR>

" Open NERDTree automatically when vim starts up if no files were specified
" CONFLICTS WITH STARTIFY (I hope)
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Always open bookmarks, toggle with B
let NERDTreeShowBookmarks=1

" Mark the eightieth column so I know when to do a linebreak!
if exists('+colorcolumn')
  set colorcolumn=80
  hi ColorColumn ctermbg=DarkGray guibg=darkgray
endif

""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""

" automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

" automatically popluate the g:airline_symobols dictionary with the powerline symbols
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline_enable_fugitive=1

""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""

" enable folding
set foldenable

" most files are evenly indented
set foldmethod=indent

" open all folds
set foldlevel=20
set foldlevelstart=20

" Toggle folds by pressing F9
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

""""""""""""""""""""""""""""""
" => Startify
"""""""""""""""""""""""""""""""
let g:startify_list_order = ['sessions', 'files', 'bookmarks']
hi StartifyHeader  ctermfg=226
let g:startify_custom_header = [
                \ '          _,    _   _    ,_            ',
                \ '     .o888P     Y8o8Y     Y888o.       ',
                \ '    d88888      88888      88888b      ',
                \ '   d888888b_  _d88888b_  _d888888b     ',
                \ '   8888888888888888888888888888888         ____            __   _    __   _             ',
                \ "   8888888888888888888888888888888        / __ '  ____ _  / /_ | |  / /  (_)  ____ ___ ",
                \ '   YJGS8P"Y888P"Y888P"Y888P"Y8888P       / __  | / __ `/ / __/ | | / /  / /  / __ `__ \',
                \ "    Y888   '8'   Y8P   '8'   888Y       / /_/ / / /_/ / / /_   | |/ /  / /  / / / / / /",
                \ "     '8o          V          o8'       /_____/  \\__,_/  \\__/   |___/  /_/  /_/ /_/ /_/",
                \ '       `                     `         ',
                \ '',]

"""""""""""""""""""""""""""""""""""""""""""""""""
" Save and load fold settings automatically
" Reference: http://vim-users.jp/2009/10/hack84/
" Don't save options.
set viewoptions-=options
augroup vimrc
    autocmd BufWritePost *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      mkview
    \|  endif
    autocmd BufRead *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      silent loadview
    \|  endif
augroup END


""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""

" display together the errors found by all checkers enabled for the current file
let g:syntastic_aggregate_errors = 1

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""

" Enables concealing characters, e.g. function is replaced with f
let g:javascript_conceal = 1
" let b:javascript_fold = 0
"
" au FileType javascript call JavaScriptFold()
" au FileType javascript setl fen
" au FileType javascript setl nocindent

" au FileType javascript imap <c-t> AJS.log();<esc>hi
" au FileType javascript imap <c-a> alert();<esc>hi

" au FileType javascript inoremap <buffer> $r return
" au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi
" au FileType javascript inoremap <buffer> $f //--- PH esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
