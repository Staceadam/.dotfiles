" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" auto-close plugin
"Plug 'rstacruz/vim-closer'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Graphql
Plug 'jparise/vim-graphql'

" Snippets
Plug 'honza/vim-snippets'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', {
	\'do': 'yarn install --frozen-lockfile && yarn compile'
\}

" Finder search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" === Javascript Plugins === "
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}

" === Syntax Highlighting === "

" Syntax highlighting for solidity
Plug 'tomlion/vim-solidity'

" Syntax highlighting for nginx
Plug 'chr4/nginx.vim'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Syntax highlinting for MDX
Plug 'jxnblk/vim-mdx-js'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'

" === Solidity === "
" Solidity Linter
Plug 'tomlion/vim-solidity'

" Easier Comments
Plug 'preservim/nerdcommenter'

" Colorscheme
Plug 'morhetz/gruvbox'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" nerdtree plugin
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"  vim training plugin
Plug 'ThePrimeagen/vim-be-good'

call plug#end()

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "
syntax on
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set smarttab
set mouse=a
set incsearch
set relativenumber

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Don't show last command
set noshowcmd

" Yank and paste with the system clipboard
set clipboard=unnamed

" Hides buffers instead of closing them
set hidden

" do not wrap long lines by default
set nowrap

" Don't highlight current cursor line
set nocursorline

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" Only one line for command line
set cmdheight=1

" === Search === "
" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Enable line numbers
set number

" === Completion Settings === "

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" Remap leader key to ,
nnoremap <SPACE> <Nop>
let g:mapleader=' '

" keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" remap global file marks to left lowercase row
" marks can be set with :ma A,E,D,F
nnoremap 'a 'A
nnoremap 's 'S
nnoremap 'd 'D
nnoremap 'f 'F

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

inoremap jk <ESC>
inoremap jj <ESC> <CR> :w <CR>

" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Clear highlighted search terms while preserving history
nnoremap <leader>v :%s///<left><left>
vnoremap <leader>v :s///<left><left>

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

" === select and copy after cursor ==="
nnoremap Y y$


" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" set Theme
colorscheme gruvbox

" Enable true color support
set termguicolors

" Vim airline theme
let g:airline_theme='gruvbox'

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
set splitbelow

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Set floating window to be slightly transparent
set winbl=10

set guifont=Hack

" ============================================================================ "
" ===                      CUSTOM COLORSCHEME CHANGES                      === "
" ============================================================================ "
"
" Add custom highlights in method that is executed every time a colorscheme is sourced
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f for details
function! TrailingSpaceHighlights() abort
  " Hightlight trailing whitespace
  highlight Trail ctermbg=red guibg=red
  call matchadd('Trail', '\s\+$', 100)
endfunction

autocmd! ColorScheme * call TrailingSpaceHighlights()

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of preview window when open
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:MarkdownError
  endif
endfunction

" Editor theme
set background=dark

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" Enable spellcheck for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
