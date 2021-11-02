syntax on
set ruler
set noerrorbells 
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set incsearch
set backspace=indent,eol,start
set updatetime=400
set cmdheight=2
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set signcolumn=yes

highlight LineNr ctermfg=11

"----KEYMAP Vim----
let mapleader = " "
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
map <f9> :w <CR> :make!<CR>

"----Spell checking--
setlocal spelllang=de
autocmd FileType markdown setlocal spell



"VUNDLE PLUGIN
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'chrisbra/Colorizer'
Plugin 'Chiel92/vim-autoformat'
Plugin 'vimwiki/vimwiki'
Plugin 'neoclide/coc.nvim'
Plugin 'https://github.com/sirtaj/vim-openscad'
Plugin 'lervag/vimtex'
Plugin 'honza/vim-snippets'
"Plugin 'nvim-telescope/telescope.nvim'
"Plugin 'nvim-lua/plenary.nvim'
Plugin 'mbbill/undotree'

call vundle#end()            " required
filetype plugin indent on    " required

"----UndoTree-----
nnoremap <F5> :UndotreeToggle<CR>
"----Telescope----
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"----Colorizer----
autocmd VimEnter * ColorHighlight

"----vimwiki----
let g:vimwiki_list = [{'path': '~/vimwiki/','syntax': 'markdown', 'ext': '.wiki'}]
let g:vimwiki_ext2syntax = {'.wiki': 'markdown'}
let g:vimwiki_markdown_link_ext = 1

"----Nerdtree----
nnoremap <leader>n :NERDTree<CR>
"----Autoformat--
nnoremap <leader>a :Autoformat<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


"----COC----
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Codeaction
nmap <leader>c  <Plug>(coc-codeaction)
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)




