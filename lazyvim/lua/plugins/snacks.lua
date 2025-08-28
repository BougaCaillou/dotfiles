return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    git = {
      enabled = false,
    },
    picker = {
      win = {
        backdrop = {
          transparent = true,
        },
      },
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
            backdrop = {
              transparent = true,
            },
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
