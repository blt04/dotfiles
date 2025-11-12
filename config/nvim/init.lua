require("config.lazy")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.opt.autoread = true

-- Look and feel
vim.cmd([[colorscheme moria]])
vim.opt.mousescroll = 'ver:1,hor:2'


-- Whitespace
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Gutter
--vim.opt.signcolumn = 'yes'
vim.opt.signcolumn = 'number'
vim.opt.number = true
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0A0A0A" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#59616B", bg = "#121212" })
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
})

-- History
augroup('RestoreCursorPosition', { clear = true })
autocmd('BufReadPost', {
  group = "RestoreCursorPosition",
  callback = function()
    local exclude = { 'gitcommit' }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then return end

    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local line_count = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
      vim.api.nvim_feedkeys('zvzz', 'n', true)
    end
  end,
  desc = 'Restore cursor position after reopening file',
})
