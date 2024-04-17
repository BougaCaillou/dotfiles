
-- Gruvbox setup
function ColorWithGruvbox()
  vim.o.background = 'dark'
  vim.cmd([[colorscheme gruvbox]])
end

-- Ayu setup
function ColorWithAyu()
  vim.cmd([[colorscheme ayu-mirage]])
end

-- Nightfox setup
function ColorWithNightfox()
  vim.cmd([[colorscheme dawnfox]])
end

-- Tokyonight setup
function ColorWithTokyonight()
  vim.cmd([[colorscheme tokyonight-day]])
end

-- Catppuccin setup
function ColorWithCatppuccin()
  require('catppuccin').setup({
    flavour = 'macchiato',
    transparent_background = false,
    styles = {
      comments = { 'italic' },
      functions = { 'italic' },
    },
    integrations = {
      telescope = {
        enabled = true,
        style = "nvchad",
      },
      nvimtree = {
        enabled = false,
      },
      which_key = true,
    },
  })

  vim.cmd([[colorscheme catppuccin]])
end

-- ColorWithGruvbox()
-- ColorWithAyu()
-- ColorWithNightfox()
-- ColorWithTokyonight()
ColorWithCatppuccin()

