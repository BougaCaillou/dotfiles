return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato",
      transparent_background = true,
      default_integrations = false,
      auto_integrations = true,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      opts.colorscheme = "catppuccin"
    end,
  },
}
