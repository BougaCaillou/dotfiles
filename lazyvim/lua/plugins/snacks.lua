return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    git = {
      enabled = false,
    },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          hidden = false,
          actions = {
            tmux_pane_left = {
              action = function()
                os.execute("tmux select-pane -L")
              end,
            },
            tmux_pane_up = {
              action = function()
                os.execute("tmux select-pane -U")
              end,
            },
            tmux_pane_down = {
              action = function()
                os.execute("tmux select-pane -D")
              end,
            },
          },
          win = {
            list = {
              keys = {
                ["<C-h>"] = "tmux_pane_left",
                ["<C-k>"] = "tmux_pane_up",
                ["<C-j>"] = "tmux_pane_down",
              },
            },
          },
        },
      },
    },
  },
}
