let mapleader = ' ' " Place this at the top of the file otherwise the keybindings won't work correctly
call plug#begin()

"source ~/.config/nvim/coc.vim
"source ~/.config/nvim/ctrlp.vim
source ~/.config/nvim/telescope.vim
"source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/lualine.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/theme.vim
source ~/.config/nvim/dashboard.vim
source ~/.config/nvim/treesitter.vim
source ~/.config/nvim/harpoon.vim

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'folke/which-key.nvim'
Plug 'vimwiki/vimwiki'
Plug 'sindrets/diffview.nvim'
Plug 'nanozuki/tabby.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'pwntester/octo.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'simrat39/symbols-outline.nvim'
call plug#end()

source ~/.config/nvim/mappings.vim
source ~/.config/nvim/vars.vim

set splitright 

" So scss functions can be called or smth like that
autocmd FileType scss setl iskeyword+=@-@

lua << EOF
require'gitsigns'.setup()
require'octo'.setup()
EOF

"lua << EOF
"require('bufferline').setup({
"   options = {
"        mode = "tabs",
"        offsets = {{filetype="NvimTree", text=""}},
"        separator_style = "slant"
"    }
"})
"EOF

lua << EOF
require('plugins.lsp')
EOF


" Fancy notifications
lua << EOF
vim.notify = require('notify')
EOF

lua << EOF
require("which-key").setup{}
EOF

" This for some reason doesn't work in a separate file
lua << EOF
require'lualine'.setup{
options = { theme = 'catppuccin' },
    extensions = { 'nerdtree' }
}
EOF

lua <<EOF
require('telescopesetup')
EOF

let g:nvim_tree_indent_markers = 1
let g:nvim_tree_highlight_opened_files = 1

lua <<EOF
require('nvim-tree').setup({
    open_on_setup = true,
    open_on_tab = true,
    actions = {
        open_file = {
                resize_window = true
        }
    },
    view = {
        side = 'left',
    },
})
EOF

lua << EOF
require"nvim-autopairs".setup{}
EOF

nnoremap <silent> gb :BufferLinePick<cr>
" Neither does this
colorscheme catppuccin
set termguicolors
lua << EOF
require"tabby".setup{}
EOF
lua <<EOF
require('nvim-treesitter.configs').setup({
    highlight = {
        ensure_installed = 'maintained',
        enable = true,    
        additional_vim_regex_highlighting = false,
    },
    playground = {
        enable = true
    },
    autotag = {
        enable = true
    },
})
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
