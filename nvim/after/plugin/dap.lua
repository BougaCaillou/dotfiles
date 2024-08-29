local dap = require('dap')

-- setting a breakpoint
vim.keymap.set('n', '<leader>bp', function() dap.toggle_breakpoint() end)
-- step over
vim.keymap.set('n', '<leader>so', function() dap.step_over() end)
-- step into
vim.keymap.set('n', '<leader>si', function() dap.step_into() end)
-- resume
vim.keymap.set('n', '<leader>rs', function() dap.continue() end)

require("dap-vscode-js").setup({
  debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter',
  debugger_cmd = { 'js-debug-adapter' },
  adapters = { 'pwa-node', 'pwa-chrome', 'node-terminal' },
})

-- custom adapter for running tasks before starting debug
local custom_adapter = 'pwa-node-custom'
dap.adapters[custom_adapter] = function(cb, config)
  if config.preLaunchTask then
    local async = require('plenary.async')
    local notify = require('notify').async

    async.run(function()
      ---@diagnostic disable-next-line: missing-parameter
      notify('Running [' .. config.preLaunchTask .. ']').events.close()
    end, function()
      vim.fn.system(config.preLaunchTask)
      config.type = 'pwa-node'
      dap.run(config)
    end)
  end
end

-- language config
for _, language in ipairs({ 'typescript', 'javascript' }) do
  dap.configurations[language] = {
    {
      name = 'Launch',
      type = 'pwa-node',
      request = 'launch',
      program = '${file}',
      rootPath = '${workspaceFolder}',
      cwd = '${workspaceFolder}',
      sourceMaps = true,
      skipFiles = { '<node_internals>/**' },
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
    {
      name = 'Attach to node process',
      type = 'pwa-node',
      request = 'attach',
      rootPath = '${workspaceFolder}',
      processId = require('dap.utils').pick_process,
    },
  }
end
