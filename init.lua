local lsp = require 'lspconfig'

vim.opt.mouse = 'a'
vim.opt.number = true
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.o.wrap = false

-- ctrl-hjkl pane movement
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', {noremap = true})

-- quick quit buffer
vim.api.nvim_set_keymap('n', '<leader>q', ':q<cr>', {noremap = true})

-- clear highlighting with space
vim.api.nvim_set_keymap('n', '<space>', ':nohlsearch<cr>', {noremap = true})

-- telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>Telescope grep_string<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', {noremap = true})

-- vim-test
vim.api.nvim_set_keymap('n', '<F11>', ':w<cr>:TestNearest<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F12>', ':w<cr>:TestFile<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F10>', ':w<cr>:TestLast<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F9>', ':w<cr>:TestVisit<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F8>', ':w<cr>:TestSuite<cr>', {noremap = true})

-- format before save
vim.api.nvim_command("au BufWritePre *.ex,*.exs,*.ts,*.js,*.jsx lua vim.lsp.buf.formatting_sync()")

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

lsp.elixirls.setup {
	on_attach = on_attach,
	cmd = { "/home/andrew/workspace/elixir-ls/andrews-release/language_server.sh" };
}

lsp.tsserver.setup {
	on_attach = on_attach,
}

lsp.eslint.setup {
  on_attach = on_attach,
}

lsp.idris2_lsp.setup {}

lsp.terraform_lsp.setup {}
vim.g.terraform_fmt_on_save = "1"

lsp.tailwindcss.setup {}

lsp.rls.setup {
  on_attach = on_attach,
}
