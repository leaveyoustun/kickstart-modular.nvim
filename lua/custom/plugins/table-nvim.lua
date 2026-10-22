local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'SCJangra/table-nvim' }

require('table-nvim').setup {}

-- Floating cheat sheet
vim.api.nvim_create_user_command('TableHelp', function() require('custom.cheatsheet').open_named 'table-nvim' end, { desc = 'Show table-nvim cheat sheet' })

-- vim: ts=2 sts=2 sw=2 et
