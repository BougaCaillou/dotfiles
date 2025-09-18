return {
  "NeogitOrg/neogit",
  priority = 1000,
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    -- "nvim-telescope/telescope.nvim", -- optional
    -- "ibhagwan/fzf-lua",              -- optional
    "nvim-mini/mini.pick", -- optional
    -- "folke/snacks.nvim", -- optional
  },
  opts = {
    integrations = {
      diffview = true,
    },
    graph_style = "unicode",
    kind = "split_below_all",
    progress_spinner = true,
  },
  config = function(_, opts)
    require("neogit").setup(opts)

    vim.keymap.del("n", "<leader>gs")
    vim.keymap.set("n", "<leader>gs", function()
      require("neogit").open()
    end, { desc = "Neogit status" })
    vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Neogit diff" })
    vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Neogit diff close" })
  end,
}
