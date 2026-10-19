local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'SCJangra/table-nvim' }

require('table-nvim').setup {}

-- vim: ts=2 sts=2 sw=2 et
