Plug 'ThePrimeagen/harpoon'
nnoremap <silent><leader>ha :lua require('harpoon.mark').add_file()<CR>
nnoremap <silent><leader>hc :lua require('harpoon.mark').clear_all()<CR>
nnoremap <silent><leader>ht :lua require('harpoon.ui').toggle_quick_menu()<CR>
nnoremap <C-a> :lua require('harpoon.ui').nav_file(1)<CR>
nnoremap <C-s> :lua require('harpoon.ui').nav_file(2)<CR>
nnoremap <C-d> :lua require('harpoon.ui').nav_file(3)<CR>
nnoremap <C-f> :lua require('harpoon.ui').nav_file(4)<CR>
