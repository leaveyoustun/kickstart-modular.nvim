vim.pack.add({
  "https://github.com/rickhowe/wrapwidth",
})


-- Configure wrapwidth for prose files.
-- Visually wrap lines at column 100 without modifying file contents.

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("WrapwidthConfig", {
    clear = true,
  }),
  pattern = { "markdown", "rst", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.cmd("Wrapwidth 100")
  end,
})

