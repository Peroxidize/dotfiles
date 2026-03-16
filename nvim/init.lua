vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.swapfile = false
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.winborder = "rounded"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.updatetime = 250
vim.opt.completeopt = "fuzzy,menuone,noselect,popup"

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>cf", ":lua require('conform').format()<CR>")
vim.keymap.set("n", "<leader>o", ":Oil<CR>")
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>g", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<CR>", "m`o<Esc>``")
vim.keymap.set("n", "<S-CR>", "m`O<Esc>``")
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("n", "<leader>y", '_vg_"+y')
vim.keymap.set("n", "<leader>d", '_vg_"+d')
vim.keymap.set("n", "gd", "<C-]>")
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.cmd('normal! g`"zz')
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/dmmulroy/ts-error-translator.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "master",
	},
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/oysandvik94/curl.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/vyfor/cord.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = { "lua_ls", "ts_ls", "eslint_d", "prettierd", "prettier", "stylua" },
})
require("mini.pairs").setup()
require("ts-error-translator").setup()
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})
require("mini.pick").setup()
---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "markdown", "markdown_inline", "javascript", "typescript", "css" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
require("nvim-ts-autotag").setup()
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		json = { "prettierd" },
		curl = { "prettierd" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
	},
})
require("blink.cmp").setup({
	fuzzy = { implementation = "lua" },
	completion = { menu = { auto_show = false } },
})
require("curl").setup({})
require("cord")

vim.cmd.colorscheme("catppuccin-frappe")
vim.cmd(":hi statusline guibg=None")
