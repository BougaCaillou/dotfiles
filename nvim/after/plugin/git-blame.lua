require('gitblame').setup {
  enable = true,
}

-- Toggle keymap
vim.keymap.set('n', '<leader>gb', function() vim.cmd('GitBlameToggle') end)
