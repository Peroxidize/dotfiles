vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.swapfile = false
vim.opt.mouse = 'a'
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.winborder = "rounded"

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>y', '0v$hy')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set("n", "<leader>o", ":Oil<CR>")
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>g", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")

vim.diagnostic.config({ virtual_text = true })

vim.pack.add({
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/dmmulroy/ts-error-translator.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-mini/mini.nvim" },
    { src = "https://github.com/saghen/blink.cmp" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/m4xshen/hardtime.nvim" },
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "master"
    },
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = { "lua_ls", "ts_ls", "eslint_d" }
})
require("mini.pairs").setup()
require("ts-error-translator").setup()
require("oil").setup()
require("mini.pick").setup()
require("blink.cmp").setup({
    fuzzy = { implementation = "lua" }
})
require("hardtime").setup()
---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "markdown", "markdown_inline", "javascript", "typescript", "css" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

vim.cmd.colorscheme "catppuccin-frappe"
vim.cmd(":hi statusline guibg=None")
