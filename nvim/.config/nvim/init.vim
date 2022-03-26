let mapleader = ' ' " Place this at the top of the file otherwise the keybindings won't work correctly
call plug#begin()

source ~/.config/nvim/coc.vim
"source ~/.config/nvim/ctrlp.vim
source ~/.config/nvim/telescope.vim
"source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/lualine.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/theme.vim
source ~/.config/nvim/dashboard.vim
source ~/.config/nvim/treesitter.vim

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

source ~/.config/nvim/mappings.vim
source ~/.config/nvim/vars.vim

set splitright 

" So scss functions can be called or smth like that
autocmd FileType scss setl iskeyword+=@-@

" Fancy notifications
lua << EOF
vim.notify = require('notify')
EOF

" This for some reason doesn't work in a separate file
lua << EOF
require'lualine'.setup{
    options = { theme = 'auto' },
    extensions = { 'nerdtree' }
}
EOF

lua <<EOF
require('nvim-treesitter.configs').setup({
    highlight = {
        ensure_installed = 'maintained',
        enable = true,    
        additional_vim_regex_highlighting = false,
    },
})
EOF

lua <<EOF
require('telescopesetup')
EOF

lua <<EOF
require('bufferline').setup{
    options = {
            offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                text_align = 'center'
            }
        }
    }
}
EOF

let g:nvim_tree_indent_markers = 1
let g:nvim_tree_highlight_opened_files = 1

lua <<EOF
require('nvim-tree').setup({
    open_on_setup = true,
    actions = {
        open_file = {
                resize_window = true
        }
    },
    view = {
        side = 'left',
    },
    auto_close = true
})
EOF


nnoremap <silent> gb :BufferLinePick<cr>
" Neither does this
colorscheme catppuccin
