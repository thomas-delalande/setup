" Plugins
call plug#begin('~/.vim/plugged')
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'simrat39/symbols-outline.nvim'
" Using ff instead since autosave was messing up undo function -> Plug 'lukas-reineke/lsp-format.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
"
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'

" Debugger
Plug 'mfussenegger/nvim-dap'

" Maximizer
Plug 'szw/vim-maximizer'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ThePrimeagen/git-worktree.nvim'

" Quality of Life
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'ThePrimeagen/vim-be-good'
Plug 'tpope/vim-projectionist'
Plug 'mhinz/vim-rfc'
" Plug 'john-warnes/jvim' whitespace thing is cool but the breaks my saving
Plug 'Pocco81/AutoSave.nvim'
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-commentary'

" Prettier
Plug 'sbdchd/neoformat'

" Visual
Plug 'marko-cerovac/material.nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Harpoon
Plug 'ThePrimeagen/harpoon'

" File Browser
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

" set leader to SPACE
let mapleader = " "

" import main lua file
lua require("user")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
let g:vim_be_good_log_file = 1
let g:vim_apm_log = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

" should highlight when copying single line
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

colorscheme material
set relativenumber
set number
set tabstop=4
set shiftwidth=4
set expandtab
set undodir=$HOME"/.undodir"
set completeopt=menu,menuone,noinsert,noselect

" lsp 
let g:coq_settings = { 'auto_start': 'shut-up' }
nnoremap <silent> <C-j> <Cmd>lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K <Cmd>lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>lspsaga signature_help<CR>
" diagnositics
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" format
nnoremap <silent> ff <Cmd>lua vim.lsp.buf.format { async = true }<CR>
" better escape
inoremap jh <Esc>
" sessionizer remap 
nnoremap <silent> <C-f> :silent !tmux neww tms<CR>
" open file browser
nnoremap <leader>v <cmd>CHADopen<cr>
nnoremap <leader>e :NvimTreeToggle<CR> 
" open undo tree
nnoremap <leader>u :UndotreeShow<CR>
" control c to escape (only sometimes for some reason
inoremap <C-c> <esc>
