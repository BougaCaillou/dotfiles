-- Forcing the value of JAVA_HOME variable to prevent jdtls from having a stroke
local java_home = vim.env.JAVA_HOME

if java_home and java_home ~= "" then
  -- Prepend bin to PATH and set JAVA_HOME inside Neovim
  vim.env.PATH = java_home .. "/bin:" .. vim.env.PATH
  vim.env.JAVA_HOME = java_home
end

