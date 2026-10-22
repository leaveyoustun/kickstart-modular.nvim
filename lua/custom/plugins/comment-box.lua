local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'LudoPinelli/comment-box.nvim' }

require('comment-box').setup {
  comment_style = 'line',
  doc_width = 80,
  box_width = 40,
}

-- comment-box only adds comment markers for filetypes in its built-in table,
-- so temporarily switching to 'text' yields a plain box.
local function plain(cmd)
  return function()
    local ft = vim.bo.filetype
    local was_visual = vim.fn.mode():match '[vV\22]'
    vim.bo.filetype = 'text'
    vim.cmd(cmd)
    vim.bo.filetype = ft
    if was_visual then vim.cmd 'normal! \27' end
  end
end

-- Plain boxes and lines (no comment characters)
vim.keymap.set({ 'n', 'v' }, '<leader>cb', plain 'CBlabox', { desc = '[B]ox (left)' })
vim.keymap.set({ 'n', 'v' }, '<leader>ct', plain 'CBllline', { desc = '[T]itled line' })
vim.keymap.set('n', '<leader>cl', plain 'CBline', { desc = '[L]ine' })
vim.keymap.set({ 'n', 'v' }, '<leader>cd', '<Cmd>CBd<CR>', { desc = '[D]elete box' })
vim.keymap.set('n', '<leader>cc', '<Cmd>CBcatalog<CR>', { desc = '[C]atalog' })

-- Byte index of the first char that starts at or after display column `dcol`
local function byte_at_dcol(line, dcol)
  local d = 0
  for i = 0, vim.fn.strchars(line) - 1 do
    if d >= dcol then return vim.fn.byteidx(line, i) end
    d = d + vim.fn.strdisplaywidth(vim.fn.strcharpart(line, i, 1), d)
  end
  return #line
end

-- Paste the unnamed register as a block at the cursor column, overwriting
-- the text underneath so nothing else on those lines moves
vim.keymap.set('n', '<leader>cp', function()
  local lines = vim.fn.getreg('"', 1, 1)
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  local vcol = vim.fn.virtcol '.' - 1
  for i, text in ipairs(lines) do
    local r = row + i - 1
    if r >= vim.api.nvim_buf_line_count(0) then vim.api.nvim_buf_set_lines(0, r, r, false, { '' }) end
    local line = vim.api.nvim_buf_get_lines(0, r, r + 1, false)[1]
    local width = vim.fn.strdisplaywidth(line)
    if width < vcol then line = line .. (' '):rep(vcol - width) end
    local s = byte_at_dcol(line, vcol)
    local e = byte_at_dcol(line, vcol + vim.fn.strdisplaywidth(text))
    vim.api.nvim_buf_set_lines(0, r, r + 1, false, { line:sub(1, s) .. text .. line:sub(e + 1) })
  end
end, { desc = '[P]aste box at cursor column (overwrite)' })

-- Floating cheat sheet, like :CBcatalog
vim.api.nvim_create_user_command('CBhelp', function() require('custom.cheatsheet').open_named 'comment-box' end, { desc = 'Show comment-box cheat sheet' })

vim.keymap.set('n', '<leader>c?', '<Cmd>CBhelp<CR>', { desc = 'Cheat sheet' })

-- vim: ts=2 sts=2 sw=2 et
