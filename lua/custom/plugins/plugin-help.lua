local cheatsheet = require 'custom.cheatsheet'

-- Fuzzy find a plugin cheat sheet and open it in the floating window
vim.api.nvim_create_user_command('PluginHelp', function()
  local actions = require 'telescope.actions'
  local action_state = require 'telescope.actions.state'

  require('telescope.builtin').find_files {
    prompt_title = 'Plugin cheat sheets',
    cwd = cheatsheet.dir,
    find_command = { 'find', '.', '-type', 'f', '-name', '*-cheatsheet.md' },
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if not entry then return end
        local name = vim.fs.basename(entry.value):gsub('%-cheatsheet%.md$', '')
        cheatsheet.open_named(name)
      end)
      return true
    end,
  }
end, { desc = 'Fuzzy find a plugin cheat sheet' })

-- vim: ts=2 sts=2 sw=2 et
