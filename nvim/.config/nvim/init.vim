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
set updatetime=1000
set cmdheight=2
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set signcolumn=yes
set nocompatible "only needed in some rare cases (vim is in nocompatible mode as soon as the vimrc is loaded)

highlight LineNr ctermfg=11

"----KEYMAP Vim----
let mapleader = " "
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
map <f9> :w <CR> :make!<CR>

"----Spell checking--
nnoremap <f2> :call ToggleSpell()<CR>
set spelllang=de,en

function ToggleSpell()
    if &spell
        setlocal nospell
    else
        setlocal spell
    endif
endfunction

autocmd FileType markdown setlocal spell "spell is activated by default for markdown documents

"VUNDLE PLUGIN
filetype off                  " required
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'Chiel92/vim-autoformat'
Plugin 'vimwiki/vimwiki'
Plugin 'neoclide/coc.nvim'
Plugin 'https://github.com/sirtaj/vim-openscad'
Plugin 'lervag/vimtex'
Plugin 'honza/vim-snippets'
Plugin 'mbbill/undotree'
Plugin 'dhruvasagar/vim-table-mode'

call vundle#end()            " required
filetype plugin indent on    " required

"----UndoTree-----
nnoremap <F5> :UndotreeToggle<CR>

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
nmap <silent> gd <Plug>(coc-definition)


" Emoji shortcuts
ab :white_check_mark: ✅ 
ab :warning: ⚠ 
ab :bulb: 💡
ab :pushpin: 📌
ab :bomb: 💣
ab :pill: 💊
ab :construction: 🚧
ab :pencil: 📝
ab :point_right: 👉 
ab :book: 📖 
ab :link: 🔗 
ab :wrench: 🔧 
ab :info: 🛈
ab :telephone: 📞
ab :email: 📧
ab :computer: 💻
