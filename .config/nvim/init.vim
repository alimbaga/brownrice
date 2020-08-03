"         (       *     (
"         )\ )  (  `    )\ )   (
" (   (  (()/(  )\))(  (()/(   )\
" )\  )\  /(_))((_)()\  /(_))(((_)
"((_)((_)(_))  (_()((_)(_))  )\___
"\ \ / / |_ _| |  \/  || _ \((/ __|
" \ V /   | |  | |\/| ||   / | (__
"  \_/   |___| |_|  |_||_|_\  \___|

" -----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------

" If not yet installed install vim plugin manager plug
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" Async autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Surround text with qoutes, parethesis, brackets, and more
Plug 'tpope/vim-surround'

" Navigate and manipulate filesn a tree view
Plug 'scrooloose/nerdtree'

" Zoom in and out of a specific split pane (similar to tmux).
Plug 'dhruvasagar/vim-zoom'

" Toggle comments in various ways. gcc
Plug 'tpope/vim-commentary'

" Automatically set 'shiftwidth' + 'expandtab' (indention) based on file type.
Plug 'tpope/vim-sleuth'

" Distraction free writing by removing UI elements and centering everything.
Plug 'junegunn/goyo.vim'

" Draw a nice statusline at the bottom of each window
Plug 'vim-airline/vim-airline'

" add end tags
Plug 'tpope/vim-endwise'

" Vim like file manager
Plug 'vifm/vifm.vim'

" Xaiemon that reacs to input events by executing commands
Plug 'kovetskiy/sxhkd-vim'

" HTML expanding abbreviations
Plug 'mattn/emmet-vim'

" Asychronous linting
Plug 'dense-analysis/ale'

" Git commands
Plug 'tpope/vim-fugitive'

" Snippets and such
Plug 'sirver/ultisnips'

" Assuming fzf is already installed
Plug 'junegunn/fzf.vim'

" Theme
Plug 'sainnhe/gruvbox-material'

" necessary LaTEX plugin
Plug 'lervag/vimtex'
" Languages and file types.
Plug 'cakebaker/scss-syntax.vim'
Plug 'chrisbra/csv.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'
Plug 'PotatoesMaster/i3-vim-syntax'
call plug#end()

" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------

let mapleader=" "
let maplocalleader=" "

set bg=light
set go=a
set nohlsearch
set autoindent
set autoread
set backspace=2
set clipboard=unnamedplus
set complete-=i
set completeopt=menuone,preview
set directory=/tmp//,.
set encoding=utf-8
set expandtab smarttab
set formatoptions=tcqrn1
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set matchpairs+=<:> " Use % to jump between pairs
set modelines=2
set mouse=a
set noerrorbells visualbell t_vb=
set noshiftround
set nospell
set nostartofline
set number relativenumber
set regexpengine=1
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd
set showmatch
set showmode
set smartcase
set softtabstop=2
set spelllang=en_us
set splitbelow
set splitright
set tabstop=2
set textwidth=0
set ttimeout
set undodir=/tmp//,.
set virtualedit=block
set whichwrap=b,s,<,>
set wildmenu
set wildmode=full
set wrap
set timeoutlen=500
set termguicolors
set nocompatible

nnoremap c "_c
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

" Enable autocompletion :
set wildmode=longest,list,full

" Disables automatic commenting on newline:
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
nnoremap <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Clear search highlights.
map <Leader>cs :let @/=''<CR>

" Open a new empty buffer (replaces :tabnew)
nmap <leader>N :enew<cr>

" Buffer navigation
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Shortcutting split navigation, saving a keypress:
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Zoom in on a pane
noremap <C-z> <C-w>m

" Autoclose parenthesis and such
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>


" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Check file in shellcheck:
noremap <leader>s :!clear && shellcheck %<CR>

" Open my bibliography file in split
"noremap <leader>b :vsp<space>$BIB<CR>
"noremap <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
noremap <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
noremap <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Enable Goyo by default for mutt writting
" Goyo's width will be the line limit in mutt.
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=light

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and vifm configs with new material:
autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Navigating with guides
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
noremap <leader><leader> <Esc>/<++><Enter>"_c4l

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" LaTEX word count:
autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>

" vim latex live preview
let g:livepreview_previewer = 'zathura'

" Saving for the worst
set backup
set swapfile

silent execute '!mkdir -p $HOME/.cache/nvim/backup'
silent execute '!mkdir -p $HOME/.cache/nvim/swap'
silent execute '!mkdir -p $HOME/.cache/nvim/undo'

set backupdir=./.backup,$HOME/.cache/nvim/backup//
set directory=./.swap,$HOME/.cache/nvim/swap//
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.cache/nvim/undo//
endif


" -----------------------------------------------------------------------------
" Colors and themes
" -----------------------------------------------------------------------------
set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_transparent_background = 1
colorscheme gruvbox-material

" -----------------------------------------------------------------------------
" Plugin settings, mappings, autocommands, and configs
" -----------------------------------------------------------------------------

"=#=#=#=#= Deoplete =#=#=#=#="
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" : deoplete#manual_complete()

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Goyo plugin makes text more readable when writing prose:
noremap <leader>f :Goyo \| set bg=dark \| set linebreak<CR>

"=#=#=#=#= NERDTree =#=#=#=#="
noremap <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1

"=#=#=#=#= FZF =#=#=#=#="
noremap <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

"=#=#=#=#= FZF =#=#=#=#="
nnoremap <silent> <C-p> :FZF -m<CR>

" markdown preview-nvim
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0

" JSON.vim
au! BufRead,BufNewFile *.json set filetype=json
autocmd FileType json set autoindent
autocmd FileType json set formatoptions=tcq2l
autocmd FileType json set textwidth=78 shiftwidth=2
autocmd FileType json set softtabstop=2 tabstop=8
autocmd FileType json set expandtab
autocmd FileType json set foldmethod=syntax


"=#=#=#=#= Airline =#=#=#=#="
"enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tab_count = 1

" Gotta be quick about changing buffers"
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ":t"

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" enable/disable ale integration
let g:airline#extensions#ale#enabled = 1

" ale error_symbol
let airline#extensions#ale#error_symbol = 'E:'

" ale warning
let airline#extensions#ale#warning_symbol = 'W:'

"ale show_line_numbers
let airline#extensions#ale#show_line_numbers = 1

" ale open_lnum_symbol
let airline#extensions#ale#open_lnum_symbol = '(L'

"ale close_lnum_symbol
let airline#extensions#ale#close_lnum_symbol = ')'

" Giting it done
let g:airline#extensions#branch#empty_message = 'nihil'

"=#=#=#=#= Ultisnips =#=#=#=#="
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-f>"
let g:UltiSnipsJumpForwardTrigger="<tab><tab>"
let g:UltiSnipsJumpBackwardTrigger="<tab>b"

" Edit ultisnip file for
noremap <leader>es :UltiSnipsEdit<CR>

"=#=#=#=#= VIMLaTEX =#=#=#=#="
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

