local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'jbyuki/venn.nvim' }

-- Toggle venn drawing mode: HJKL draws lines, <leader>v again to exit
local function toggle_venn()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == 'nil' then
    vim.b.venn_enabled = true
    vim.cmd [[setlocal ve=all]]
    vim.keymap.set('n', 'J', '<C-v>j:VBox<cr>', { buffer = true })
    vim.keymap.set('n', 'K', '<C-v>k:VBox<cr>', { buffer = true })
    vim.keymap.set('n', 'L', '<C-v>l:VBox<cr>', { buffer = true })
    vim.keymap.set('n', 'H', '<C-v>h:VBox<cr>', { buffer = true })
    vim.keymap.set('v', 'f', ':VBox<cr>', { buffer = true })
  else
    vim.cmd [[setlocal ve=]]
    vim.cmd [[mapclear <buffer>]]
    vim.b.venn_enabled = nil
  end
end

vim.keymap.set('n', '<leader>v', toggle_venn, { desc = 'Toggle Venn diagram mode' })

-- vim: ts=2 sts=2 sw=2 et
