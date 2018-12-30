set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" text higlight for javascript
Plugin 'jelera/vim-javascript-syntax'
" improved indentation and syntax highliting for javascript
Plugin 'pangloss/vim-javascript'
" displays indent levels, enable with IndentGuidesEnable
Plugin 'nathanaelkane/vim-indent-guides'
" expanding abbreviations
Plugin 'mattn/emmet-vim'
" nerdtree, duh, filebrowing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Cool colors :)
Plugin 'flazz/vim-colorschemes'
" Autocompletion
Plugin 'Valloric/YouCompleteMe'
" cool statusline
Plugin 'vim-airline/vim-airline'
"git signs
Plugin 'airblade/vim-gitgutter'
" json highlighting
Plugin 'elzr/vim-json'
" HTML + SVG
Plugin 'othree/html5.vim'
" commenting gcc, gc to comment
Plugin 'tpope/vim-commentary'
" highlights closing tags
Plugin 'Valloric/MatchTagAlways'
" color highlighter
Plugin 'ap/vim-css-color'
" cool asf syntax error checking
"TODO actully install syntax checkers!
Plugin 'vim-syntastic/syntastic'
" linting, aka error checking on the fly
Plugin 'w0rp/ale'
" trailing characters highlights
Plugin 'ntpeters/vim-better-whitespace'
" text align
Plugin 'godlygeek/tabular'
" ack search
Plugin 'mileszs/ack.vim'
" surrounds stuff in other stuff. pretty cool
Plugin 'tpope/vim-surround'
" readme is incomplete, idk what this does, something with search i guess, lol
Plugin 'osyo-manga/vim-anzu'
" theme for statusbar/airline
Plugin 'vim-airline/vim-airline-themes'
" git integration for vim, lit af
Plugin 'tpope/vim-fugitive'
" syntax highlight for elixir
Plugin 'elixir-editors/vim-elixir'
" solarized colors, duh
Plugin 'altercation/vim-colors-solarized'
" resizes windows, when multiple open, good shit
Plugin 'roman/golden-ratio'
" the ultimate snipper plugin!
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" pug highlighting
Plugin 'digitaltoad/vim-pug'
" bracked autoclosing
Plugin 'Raimondi/delimitMate'

" add plugins before this line
call vundle#end()
filetype plugin indent on " required


syntax on
set background=dark
colorscheme molokai
set colorcolumn=80
set number
set showcmd
set mouse=a
set hlsearch
set incsearch
set lazyredraw
set ttyfast
" defualt indent
set listchars=tab:»·,trail:·
set list
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" folding
" fold shortcuts: z+a, z+c, z+o
set foldmethod=indent
set foldlevel=20
set foldlevelstart=20
set nofoldenable

set autoread
set hidden
set ignorecase
set splitright

set encoding=utf-8

" Mappings
" Control+l removes the search higlighting (unsearch)
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" autoformat spacing
map <F7> mzgg=G`z`

" map moving between windows
noremap <C-J> <C-W>w
noremap <C-K> <C-W>W
noremap <C-L> <C-W>l
noremap <C-H> <C-W>h

" Disable Arrow Keys To Learn Vim!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" map ;; to ESC
imap ;; <ESC>

" toggle indent guides witn cntrl+g
nnoremap <silent> <C-G> :IndentGuidesToggle<CR><C-G>

" open NERDTree with Ctrl + n
map <C-n> :NERDTreeToggle<CR>
map <C-n> <plug>NERDTreeTabsToggle<CR>


" NERDTree file type highlight
let g:NERDTreeDirArrowExpandable = '?'
let g:NERDTreeDirArrowCollapsible = '?'
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" airline settings
set laststatus=2
let g:airline_theme='bubblegum'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_powerline_fonts = 1

" ale settings
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
let g:ale_linters = {
\   'html': [''],
\   'handlebars': [''],
\}

let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'typescript': ['prettier'],
\ 'typescript.tsx': ['prettier'],
\ 'json': ['prettier'],
\ 'css': ['prettier']
\ }

" Remove <Tab> from the list of keys mapped by YCM.
let g:ycm_key_list_select_completion = ['<Down>']
" disable preview
set completeopt-=preview


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" autoclosing on enter
let g:delimitMate_expand_cr = 2
