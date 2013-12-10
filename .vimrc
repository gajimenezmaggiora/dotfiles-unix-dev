set nocompatible " be iMproved
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:

" Perl
Bundle 'benizi/perl-support.vim'

" Colors
Bundle 'nanotech/jellybeans.vim'

" Web
Bundle "pangloss/vim-javascript"
Bundle "ap/vim-css-color"
Bundle "mattn/zencoding-vim"

" Python
Bundle "hynek/vim-python-pep8-indent"
Bundle "vim-scripts/python.vim--Vasiliev"

" Text and Formatting
Bundle "vim-scripts/matchit.zip"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-repeat"

" Syntax
Bundle "scrooloose/syntastic"
Bundle "scrooloose/nerdcommenter"
Bundle "vim-perl/vim-perl"

" Navigation
Bundle "henrik/vim-indexed-search"
Bundle "Lokaltog/vim-powerline"
Bundle "techlivezheng/vim-plugin-minibufexpl"
Bundle "majutsushi/tagbar"

" Misc
Bundle "Shougo/neocomplcache"
Bundle "scrooloose/nerdtree"
Bundle "vim-scripts/AutoTag"
Bundle "tpope/vim-fugitive"

filetype plugin indent on  " Automatically detect file types, and enable file-type-specific plugins and indentation.
set expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4
syntax on

" Colors
set t_Co=256  " Set terminal to display 256 colors.
set background=dark
" Set 'TODO' & 'FIXME' strings to be bold and standout as hell. Works for
" jellybeans color scheme only.
let g:jellybeans_overrides = {
            \ 'Todo': {
                \ 'guifg': 'ff4500',
                \ 'guibg': 'eeee00',
                \ 'ctermfg': '196',
                \ 'ctermbg': '226',
                \ 'attr': 'standout'
            \ }
        \ }
" Misc color overrides.
colorscheme jellybeans

" Misc.
set title  " Show title in app title bar.
set ttyfast  " Fast drawing.
set scrolloff=3  " Number of lines to keep above/below cursor when scrolling.
"set debug=msg  " Show Vim error messages.

" Web
autocmd BufWinEnter *.json,*jshintrc setfiletype javascript
autocmd BufWinEnter *.html,*.htm setfiletype html
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css,scss,less set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,css,scss,less setlocal expandtab smarttab tabstop=2 softtabstop=2 shiftwidth=2
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Python
let python_highlight_all=1  " Enable all plugin's highlighting.
let python_slow_sync=1  " For fast machines.
let python_print_as_function=1  " Color 'print' function.
autocmd FileType python setlocal linebreak nosmartindent  " nosmartindent for comment indentation problem.
autocmd FileType python set omnifunc=pythoncomplete#Complete
set wildignore+=*.pyc,*.pyo
set wildignore+=*.egg,*.egg-info

" Syntastic
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=2  " Close error window automatically when there are no errors.
let g:syntastic_loc_list_height=5
let g:syntastic_enable_signs=1  " Show sidebar signs.
set statusline+=%#warningmsg#  " Add Error ruler.
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Map '`' to open error window.
nnoremap <silent> ` :Errors<CR>
let perl_fold=1
let perl_fold_blocks = 1

" Powerline
" source /usr/local/python2.7/lib/python2.7/site-packages/Powerline-beta-py2.7.egg/powerline/bindings/vim/plugin/source_plugin.vim
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'

" Tagbar
nnoremap <silent> \ :TagbarToggle<CR>
" Search tag list from current dir up till root.
set tags=./tags;/

" Status Line
set shortmess=atI  " Shortens messages in status line, truncates long messages, no intro (Uganda) message.
set laststatus=2  " Always show status line.
set showcmd  " Display an incomplete command in status line.

" Mini buffer explorer
let g:miniBufExplModSelTarget = 1  " Don't open buffer in a non-modifiable buffer (e.g. TagList window).
let g:miniBufExplCheckDupeBufs = 0  " For working with many buffers simultaneously.
"let g:miniBufExplShowBufNumbers = 0  " No buffer numbers.
" MiniBufExpl Colors
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg

" Neo Complete Cache
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_auto_select = 1
" let g:neocomplcache_enable_smart_case = 1

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Searching
"set hlsearch  " Highlight search.
set smartcase  " Be case sensitive when input has a capital letter.
set incsearch  " Show matches while typing.
set ignorecase  " Ignore case when searching.

" Formatting & Text
set encoding=utf-8
set nowrap  " No line wrapping.
set linebreak  " Wrap at word.
set textwidth=80  " Desirable text width. Used for text auto-wrapping. 0 means no auto-wrapping.
set cc=+1  " Highlight one column AFTER 'textwidth'.
" Enable auto-wrapping comments, comment leader auto-insertion
" in <Insert> mode, auto-format paragraphs, keep last line indentation.
" Disable all other format options.
" NOTE: Requires 'set autoindent'. autocmd FileType is required since
" I set `formatoptions` differently for each file type (.c, .py, etc.)."
autocmd FileType * set formatoptions=r,2
set backspace=indent,eol,start  " Enable backspace key. Erase previously
" entered characters in insert mode.
set number  " Show line numbers.
set cursorline  " Show cursorline.
" set ruler  " Show the cursor position all the time.
set showmatch  " Show matching brace on insertion or cursor over.
set matchtime=3  " How many tenths of a second to wait before showing
" matching braces.
" Invisible characters
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59


" Indentation
set autoindent  " Automatically set the indent of a new line (local to buffer).
set smartindent
"set shiftround  " Round shift actions. i.e. When at 3 spaces, and I hit > ... go to 4, not 5. FIXME: Doesn't work.

" Folding
set foldenable  " Turn on folding.
set foldmethod=syntax  " Fold on the marker.
set foldlevel=0  " Fold everything when opening a file.
" set foldnestmax=1  " Don't fold inner blocks.
set foldopen=block,hor,tag,percent,mark,quickfix  " Which movements open folds.
"Sourced from vim tip: http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Key mappings
" Page up/down.
noremap <C-k> <C-b>
noremap <C-j> <C-f>
" Window-change actions.
noremap <Up> <C-w>k
noremap <Down> <C-w>j
noremap <Left> <C-w>h
noremap <Right> <C-w>l


