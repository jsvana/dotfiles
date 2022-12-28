vim.g.mapleader = ' '

require("plugins")
require("set")

local opts = { noremap = true, silent = true }
vim.keymap.set({ 'n', 'v' }, '<S-k>', '<S-{>', opts)
vim.keymap.set({ 'n', 'v' }, '<S-j>', '<S-}>', opts)
--vim.keymap.set('v', '\\<' '\\<gv', opts)
--vim.keymap.set('v', '\\>' '\\>gv', opts)

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		vim.lsp.buf.format()
	end
})
