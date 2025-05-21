return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
    -- "ibhagwan/fzf-lua",              -- optional
    -- "echasnovski/mini.pick", -- optional
    -- "folke/snacks.nvim",             -- optional
  },
  opts = {
    integrations = {
      diffview = true,
    },
    graph_style = "unicode",
    kind = "split_below_all",
    progress_spinner = true,
  },
  keys = {
    {
      "<leader>gs",
      function()
        require("neogit").open()
      end,
      desc = "Neo-git status",
    },
    {
      "<leader>gd",
      function()
        vim.cmd("DiffviewOpen")
      end,
      desc = "Neo-git diff",
    },
    {
      "<leader>gc",
      function()
        vim.cmd("DiffviewClose")
      end,
      desc = "Neo-git diff close",
    },
  },
}
