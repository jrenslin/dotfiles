" Joshua R. Enslin
" Optional, but appreciated programs:
" - phpcs, phpmd (for PHP linting)
" - FZF (I like to install it externally)

" ======== Plug: Plugin manager

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'                              " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

Plug 'https://github.com/junegunn/vim-github-dashboard.git' " Any valid git URL is allowed
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }            " On-demand loading

if v:version > 750
    Plug 'fatih/vim-go', { 'tag': '*' }                         " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
endif

" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }          " Plugin options
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Plugin outside ~/.vim/plugged with post-update hook
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }              " Using a non-master branch

" ================
" ======== Display

" ==== Color Schemes

Plug 'ayu-theme/ayu-vim'
Plug 'ajmwagar/vim-deus'
Plug 'https://github.com/rdavison/Libertine'
Plug 'chriskempson/base16-vim'
Plug 'baeuml/summerfruit256.vim'

" ==== More readable code

Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'       " Highlight redundant whitespaces
Plug 'sickill/vim-pasta'

" ==== Other interface-related plugins

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'       " Distraction free mode
Plug 'chrisbra/NrrwRgn'         " Narrow down on region

" ==== Sidebars

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-scripts/taglist.vim'  " Requires: exuberant-ctags

Plug 'Shougo/unite.vim'

" ================
" ======== Functionalities

Plug 'Raimondi/delimitMate'     " Automatically insert closing brackets
Plug 'adelarsq/vim-matchit'     " Allow switching between HTML and XML tags

Plug 'vim-scripts/utl.vim'      " Universal text linking

Plug 'ap/vim-css-color'         " Set colored backgrounds for color codes in CSS
Plug 'nvie/vim-togglemouse'     " Toggling mouse with F12

Plug 'matze/vim-move'           " Moving text blocks

Plug 'mbbill/undotree'          " Undo tree
Plug 'keith/investigate.vim'    " Quick access to documentation on gK

Plug 'mhinz/vim-startify'       " Fancy start screen

" ==== Snippets

Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets' " Snippets

" ==== Integration with other programs

Plug 'blindFS/vim-taskwarrior'              " Taskwarrior integration
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }    " Plugin outside ~/.vim/plugged with post-update hook

Plug 'vim-pandoc/vim-pandoc' | Plug 'vim-pandoc/vim-pandoc-syntax'

" Plug 'nrocco/vim-phplint'
Plug 'vim-syntastic/syntastic'
Plug 'hail2u/vim-css3-syntax'

" == Git

Plug 'tpope/vim-fugitive'       " Git
Plug 'airblade/vim-gitgutter'   " Displays lines that have been edited since the last git commit on an own column
" Plug 'mhinz/vim-signify'      " Would do the same, also for other version control systems

" Initialize plugin system
call plug#end()

" ================
" Main Part
" ================

set nocompatible
let mapleader = ","
let maplocalleader = "\\"

" ================
" ======== Interaction

set updatetime=100

set wildmenu       " Better command-line completion
set showcmd        " Show partial commands
set nostartofline  " Don't always go back to start of line

set confirm        " Use confirmation dialogues, e.g. when attempting to close unstored files
set visualbell     " Use visual bell instead of beeping when doing something wrong

set mouse=a        " Enable mouse usage

" ======== Searching

set hlsearch                   " Highlight search results

set ignorecase
" set smartcase                  " Use case insensitive search, except when using capital letters

set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start of insert action

" ======== Indentation

set autoindent     " Stay on the same indentation level in case the file type is unknown
set shiftwidth=4
set softtabstop=4  " Set width of soft tabs to 4
set ts=4
set expandtab      " Insert spaces instead of an actual tabstop

" ======== Splitting window

" set splitbelow      " For splitting horizontally
set splitright        " For splitting vertically

" ================
" ======== Display

set laststatus=2      " Always display status line
set number            " Display line numbers on the left
set showmatch         " Highlight matching brackets

" ======== Colors

filetype indent plugin on
syntax enable

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set t_Co=256

let g:seoul256_light_background = 255
let g:libertine_Twilight = 1
let ayucolor="mirage" " Options: light, mirage, dark

if &t_Co == 256
    colorscheme deus
else
    colorscheme base16-gruvbox-dark-medium
endif

if (has("termguicolors"))
    set termguicolors     " enable true colors support
    colorscheme ayu
endif

function! ToggleColors()
    if g:colors_name == "ayu" && g:ayucolor == "mirage"
        let g:ayucolor = "light"
        colorscheme ayu
    elseif g:colors_name == "ayu" && g:ayucolor == "light"
        let g:ayucolor = "mirage"
        colorscheme ayu
    elseif g:colors_name == "deus"
        colorscheme summerfruit256
    elseif g:colors_name == "summerfruit256"
        colorscheme deus
    else
        echo "No toggle-able theme found"
    endif
endfunction
nnoremap <leader>c :call ToggleColors()<cr>

" ======== Indentation

" let g:indentLine_
" setColors = 0
let g:indentLine_color_term = 0

let g:indentLine_char = '|'

set ruler

let g:pasta_paste_before_mapping = ',P'
let g:pasta_paste_after_mapping = ',p'

" ======== Airline

let g:airline#extensions#tabline#enabled = 1 " Display all buffers

" To enable powerline fonts

" let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" ======== Distraction-free mode
"
" " Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.3

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" ======== Git

let g:gitgutter_max_signs = 500         " Display gitgutter symbols only for up to 500 edited lines; default: 500

" ======== FZF

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'right': '~40%' }  " Open up with in a 40%-wide pane on the right
let g:fzf_buffers_jump = 0

" ======== syntastic: Syntax Checker

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

" ==== File types

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_css_checkers = ['phpcs']

" ======== Startify: Start Screen

let g:startify_bookmarks = [  '~/.vimrc', {'c': '~/.zshrc'} ]
let g:startify_list_order = [
            \ ['   📁 Most recently used files'],
            \ 'files',
            \ ['   📂 Most recently used files in the current directory:'],
            \ 'dir',
            \ ['   >_ Commands:'],
            \ 'commands',
            \ ['   🔖 Bookmarks:'],
            \ 'bookmarks',
            \ ]

let g:startify_enable_special = 0 " Don't show [e]: Empty filters and [q]: quit


" If UTF-8 is available, use it for fortune cookie
if &enc == "utf-8"
    let g:startify_fortune_use_unicode = 1
endif

let g:startify_padding_left = 2

let g:ascii = [
            \ '            __',
            \ '    __  __ /\_\    ___ ___',
            \ '   /\ \/\ \\/\ \ /'' __` __`\',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\',
            \ '     \/__/    \/_/\/_/\/_/\/_/',
            \ ''
            \]
let g:startify_custom_header = g:ascii + startify#fortune#boxed()

let g:startify_custom_footer = [
            \ '',
            \ '  ===========',
            \ '',
            \ '  Vim Version:    '.v:version.'',
            \ '  User:           '.$USER.'',
            \ '  Shell:          '.$SHELL.'',
            \ '  Terminal:       '.&term.'',
            \ '  Default Editor: '.$EDITOR.'',
            \ '  Colorscheme:    '.g:colors_name.'',
            \ '',
            \ '  -----------',
            \ '  Executables:',
            \ '',
            \ '  phpcs:            '.executable("phpcs").'',
            \ '  phpmd:            '.executable("phpmd").'',
            \ '  exuberant-ctags:  '.executable("ctags").'',
            \ '  fzf:              '.executable("fzf").''
            \]

" ================
" ======== Commands automatically run (autocmd)

" ==== On startup

" autocmd vimenter * NERDTree " Open NERDTree on startup

" ==== On switching buffers

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close vim if NERDTree is the last open buffer

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ================
" ======== Keybindings

let g:move_key_modifier = 'C' " Set C-j to moving selected text block down; C-k for moving it up

map <F2> :terminal<CR>
map <F3> :quit<CR>
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" map <C-F3> :quitall<CR>

nnoremap <C-L> :nohl<CR><C-L>
map <C-n> :NERDTreeToggle<CR>

" ======== Normal mode

nmap <Leader>q  :q<CR>
nmap <Leader>qa :quitall<CR>
nmap <Leader>t  :TW<CR>
nmap <Leader>ta :TWAdd<CR>

nmap <Leader>s  :write<CR>
nmap <Leader>n  :TlistToggle<CR>

nmap <Leader>+  :vsp<CR>
nmap <Leader>-c  :close<CR>
nmap <Leader>-d  :bd<CR>

nnoremap <Leader>v :vsp<CR>
nnoremap <Leader>u :UndotreeToggle<CR>

nnoremap <Leader>1 :b1<CR>
nnoremap <Leader>2 :b2<CR>
nnoremap <Leader>3 :b3<CR>
nnoremap <Leader>4 :b4<CR>
nnoremap <Leader>5 :b5<CR>
nnoremap <Leader>6 :b6<CR>
nnoremap <Leader>7 :b7<CR>
nnoremap <Leader>8 :b8<CR>
nnoremap <Leader>9 :b9<CR>

" Map ,ev pressed one after another to opening ~/.vimrc in new pane
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Map ," to putting the current word into quotation marks
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>f :Goyo<CR>
nnoremap <leader>/ :FZF<CR>

nnoremap ]w :NextTrailingWhitespace<CR>
nnoremap [w :PrevTrailingWhitespace<CR>

nnoremap <Leader>e :cw<CR>
nnoremap ]e :cNext<CR>
nnoremap [e :cprevious<CR>

" Note: <Leader>l is reserved for filetype-specific code linting

" ======== Insert mode

inoremap <c-x><c-c> <esc>:qa<CR>

" ================
" ======== Abbreviations

iabbrev adn and
iabbrev waht what
iabbrev tehn then

" ================
" ======== Custom commands

command GREPCURRENT :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen
command GREP :execute ':vimgrep /'.input("grep /<what?>/gj in this directory (incl. subdirectories)").'/j ./**' | copen

" SuperRetab, see: http://vim.wikia.com/wiki/Super_retab
:command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

command SEARCH :execute ':vimgrep /'.input("grep /<what?>/gj in this file").'/gj '.expand('%') | copen


