return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>sw", "<cmd>lua require('spectre').open()<CR>", desc = "Search current word" },
    { "<leader>sp", "<cmd>lua require('spectre').open_file_search()<CR>", desc = "Search current file" },
    {
      "<leader>sf",
      "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
      desc = "Search current file (word)",
    },
  },
}
