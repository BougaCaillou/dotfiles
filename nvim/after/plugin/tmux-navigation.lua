local nvim_tmux_nav = require('nvim-tmux-navigation')

-- Setting keymaps
vim.keymap.set('n', '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', '<C-l>', nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set('n', '<C-k>', nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', '<C-j>', nvim_tmux_nav.NvimTmuxNavigateDown)

