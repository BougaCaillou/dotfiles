
local neogit = require('neogit')

neogit.setup {
  integrations = {
    diffview = true
  }
}

-- Open Neogit panel
vim.keymap.set('n', '<leader>gs', '<cmd>Neogit kind=split<cr><C-w>J')

-- Open and close Diffview panel
vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>')
vim.keymap.set('n', '<leader>gc', '<cmd>DiffviewClose<cr>')
