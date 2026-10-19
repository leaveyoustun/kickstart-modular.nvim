local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'nvim-lua/plenary.nvim',
  gh 'mikavilpas/yazi.nvim',
}

-- mark netrw as loaded so it's not loaded at all (recommended if open_for_directories=true)
vim.g.loaded_netrwPlugin = 1

require('yazi').setup {
  open_for_directories = false,
  keymaps = {
    show_help = '<f1>',
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>-', '<cmd>Yazi<cr>', { desc = 'Open yazi at the current file' })
vim.keymap.set('n', '<leader>cw', '<cmd>Yazi cwd<cr>', { desc = "Open yazi in nvim's cwd" })
vim.keymap.set('n', '<c-up>', '<cmd>Yazi toggle<cr>', { desc = 'Resume the last yazi session' })

-- vim: ts=2 sts=2 sw=2 et
