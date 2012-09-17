"filetype on
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on
"let Tlist_Auto_Open = 1

set nocompatible    " use vim defaults
set ls=2            " allways show status line
set tabstop=8       " numbers of spaces of tab character
set shiftwidth=8    " numbers of spaces to (auto)indent
set softtabstop=8
set noexpandtab
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
"set nobackup        " do not keep a backup file
"set number          " show line numbers
set ignorecase      " ignore case when searching 
"set noignorecase   " don't ignore case
set title           " show title in console title bar
set ttyfast         " smoother changes
"set ttyscroll=0        " turn off scrolling, didn't work well with PuTTY
"set modeline        " last lines in document sets vim mode
"set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set viminfo='20,<50,s10,h

"set autoindent     " always set autoindenting on
"set smartindent        " smart indent
"set cindent            " cindent
set noautoindent
set nosmartindent
set nocindent   

"set autowrite      " auto saves changes when quitting and swiching buffer
"set sm             " show matching braces, somewhat annoying...
"set nowrap         " don't wrap lines

if has("gui_running")
    " See ~/.gvimrc
    set guifont=Monospace\ 10	" use this font 
    set lines=50		" height = 50 lines
    set columns=100		" width = 100 columns
    set background=light	" adapt colors for background
    set selectmode=mouse,key,cmd
    set keymodel=
else
    if &term =~ '^\(xterm\|screen\)$' && $COLORTERM == 'gnome-terminal'
        set t_Co=256
    endif
    set background=dark		" adapt colors for background
    colorscheme phd
endif

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nmap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nmap <buffer><bs> <c-T>   " Backspace to go back
    
    " When using mutt, text width=72
    au FileType mail,tex set textwidth=72
    au FileType cpp,c,java,sh,pl,php,asp  set autoindent
    au FileType cpp,c,java,sh,pl,php,asp  set smartindent
    au FileType cpp,c,java,sh,pl,php,asp  set cindent
    "au BufRead mutt*[0-9] set tw=72
    
    " Automatically chmod +x Shell and Perl scripts
    "au BufWritePost   *.sh             !chmod +x %
    "au BufWritePost   *.pl             !chmod +x %

    " File formats
    au BufNewFile,BufRead  *.pls    set syntax=dosini
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf
endif

" Keyboard mappings
map ,e :e ~/.vimrc<cr>      " edit my .vimrc file
map ,u :source ~/.vimrc<cr> " update the system settings from my vimrc file

"----- write out html file
"map ,h :source $VIM/vim71/syntax/2html.vim<cr>:w<cr>:clo<cr>

"Fuzzyfinder mappings
"map ,b :FufBuffer<cr>
"map ,f :FufCoverageFile<cr>
"map ,d :FufDir<cr>
"map ,bf :FufBookmarkFile<cr>
"map ,bd :FufBookmarkDir<cr>
"map ,t :FufTag<cr>
"map ,tb :FufBufferTag<cr>
"map ,tf :FufTaggedFile<cr>
"map ,j :FufJumpList<cr>
"map ,c :FufChangeList<cr>
"map ,q :FufQuickfix<cr>
"map ,l :FufLine<cr>
"map ,h :FufHelp<cr>

" Gtags mappings
map <C-n> <esc>:GtagsCursor<cr>
"map <C-p> <esc>:bp<cr>
map <C-l> <esc>:Gtags -r<cr>
map <C-j> :cn<cr>
map <C-k> :cp<cr>

" CommandT mappings
let g:CommandTMaxFiles=100000
map ,f <esc>:CommandT<cr>
map ,fl <esc>:CommandTFlush<cr>
map ,b <esc>:CommandTBuffer<cr>

" Tagbar mappings
let g:tagbar_userarrows = 1
map ,t :TagbarToggle<cr>

" Tagbar mappings
let g:SuperTabDefaultCompletionType="context"

" Common command line typos
"cmap W w
"cmap Q q
