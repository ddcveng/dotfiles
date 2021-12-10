set path+=**

call plug#begin(stdpath('data') . '/plugged')
" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" themes
Plug 'gruvbox-community/gruvbox'
Plug 'gilgigilgil/anderson.vim'
Plug 'kyazdani42/nvim-web-devicons'

" dev
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-fugitive' " git

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/vim-vsnip' " snippets
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-vsnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'onsails/lspkind-nvim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tami5/lspsaga.nvim'
Plug 'ThePrimeagen/harpoon'

call plug#end()

colorscheme gruvbox
let mapleader = " "
let $DOTFILES = "/home/ddcveng/dotfiles"

lua require("ddcveng")

" Misc
nnoremap Y y$
inoremap ,shrug ¯\_(ツ)_/¯
" nnoremap ; A;<Esc>
nnoremap <leader>en :bnext<CR>
nnoremap <leader>eb :bprev<CR>
inoremap kj <Esc>
inoremap {<CR> {<CR>}<Esc>O
nnoremap <leader>x :!xdg-open %<CR><CR>
nnoremap [c :cnext<CR>
nnoremap ]c :cprev<CR>
nnoremap cq :cclose<CR>

" Delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Easier Moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" fugitive remaps
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

" file navigation
nnoremap <leader>ss :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>sd :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>sh :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>sj :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>sk :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>sl :lua require("harpoon.ui").nav_file(4)<CR>

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Misc
autocmd FileType c nnoremap <buffer> <leader>go :ClangdSwitchSourceHeader<CR>
autocmd FileType cpp nnoremap <buffer> <leader>go :ClangdSwitchSourceHeader<CR>
