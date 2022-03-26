vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap=true })
vim.api.nvim_set_keymap("n", "<leader>fa", "<cmd>Telescope commands<cr>", { noremap=true })
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope builtin<cr>", { noremap=true })

local telescope = require('telescope')

telescope.setup({
    defaults = {
        file_ignore_patterns = { '.git', 'node_modules'}
    },
    pickers = {
        find_files = {
            hidden = true
        },
        commands = {
            theme = 'dropdown'
        }
    }
})
