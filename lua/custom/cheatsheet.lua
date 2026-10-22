-- Shared floating window for markdown cheat sheets in doc/plugin-cheatsheets/
local M = {}

M.dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'doc', 'plugin-cheatsheets')

--- Open a cheat sheet in a centered floating window. `q` or `<Esc>` closes it.
---@param path string absolute path of the markdown file
---@param title string window title
function M.open(path, title)
  local lines = vim.fn.readfile(path)
  local width = 0
  for _, l in ipairs(lines) do
    width = math.max(width, vim.fn.strdisplaywidth(l))
  end
  width = math.min(width + 2, vim.o.columns - 4)
  local height = math.min(#lines, vim.o.lines - 6)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].filetype = 'markdown'
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = 'wipe'

  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2) - 1,
    style = 'minimal',
    border = 'rounded',
    title = ' ' .. title .. ' ',
    title_pos = 'center',
  })
  vim.wo.conceallevel = 0

  for _, key in ipairs { 'q', '<Esc>' } do
    vim.keymap.set('n', key, '<Cmd>close<CR>', { buffer = buf, nowait = true })
  end
end

--- Open `<name>-cheatsheet.md` from the cheat sheet directory.
---@param name string
function M.open_named(name) M.open(vim.fs.joinpath(M.dir, name .. '-cheatsheet.md'), name) end

return M

-- vim: ts=2 sts=2 sw=2 et
