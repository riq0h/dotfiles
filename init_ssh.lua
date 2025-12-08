----GENERAL SETTINGS
local opt = vim.opt
vim.g.mapleader = " "
opt.helplang = "en"
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.list = true
opt.listchars = { tab = "»-", trail = "-", eol = "↲", extends = "»", precedes = "«", nbsp = "%" }
opt.wrap = true
opt.signcolumn = "yes"
opt.smartcase = true
opt.ignorecase = true
opt.wrapscan = true
opt.hidden = true
opt.startofline = false
opt.showmatch = true
opt.matchtime = 1
opt.guicursor = ""
opt.cursorline = true
opt.wildmenu = true
opt.number = true
opt.showcmd = true
opt.autoread = true
opt.hlsearch = true
opt.backspace:append({ "indent", "eol", "start" })
opt.showtabline = 1
opt.laststatus = 3
opt.ambiwidth = "single"
opt.confirm = true
opt.pumblend = 0
opt.winblend = 0
opt.mouse = "a"
opt.cmdheight = 1
opt.timeout = true
opt.ttimeout = true
opt.ttimeoutlen = 10
opt.clipboard:append({ "unnamedplus" })
opt.termguicolors = true
opt.showmode = false
opt.completeopt:append({ "menuone", "noinsert" })
opt.backup = false
opt.swapfile = false
opt.encoding = "utf-8"
opt.fileencodings = { "utf-8", "iso-2022-jp", "cp932", "euc-jp", "sjis" }
vim.opt.shortmess:append("IcC")
vim.cmd("set completeopt-=preview")

----ADVANCED SETTINGS
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

----KEYMAPS
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>bdelete<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

----LAZY.NVIM BOOTSTRAP
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

----PLUGINS
require("lazy").setup({
	defaults = { lazy = true },
	{ "nvim-telescope/telescope.nvim", cmd = "Telescope" },
	{ "nvim-telescope/telescope-file-browser.nvim", cmd = "Telescope file_browser" },
	{ "lewis6991/gitsigns.nvim", config = true, event = "BufReadPre" },
	{ "neanias/everforest-nvim", event = "VeryLazy" },
	{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
	{ "windwp/nvim-autopairs", config = true, event = "InsertEnter" },
	{ "lambdalisue/suda.vim", cmd = { "SudaWrite", "SudaRead" } },
	{ "jghauser/mkdir.nvim", event = "ModeChanged" },
	{ "kevinhwang91/nvim-hlslens", event = "VeryLazy" },
	{ "numToStr/Comment.nvim", config = true, event = "VeryLazy" },
	{ "rhysd/clever-f.vim", keys = { "f", "F", "t", "T" } },
	{ "echasnovski/mini.surround", event = "ModeChanged" },
	{ "echasnovski/mini.ai", event = "ModeChanged" },
	{ "mvllow/modes.nvim", event = "VeryLazy" },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "brenoprata10/nvim-highlight-colors", event = "BufReadPost" },

	--disable default plugins
	performance = {
		rtp = {
			disable_plugins = {
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"gzip",
				"zip",
				"zipPlugin",
				"tar",
				"tarPlugin",
				"getscript",
				"getscriptPlugin",
				"vimball",
				"vimballPlugin",
				"2html_plugin",
				"logipat",
				"rrhelper",
				"spellfile_plugin",
				"matchit",
			},
		},
	},
})

vim.cmd.colorscheme("everforest")

----TELESCOPE
local telescope_setup = function()
	require("telescope").setup({
		defaults = {
			preview = {
				treesitter = false,
			},
			borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			color_devicons = false,
			file_ignore_patterns = { "node_modules", ".git", ".cache", ".svg", ".npm", "go" },
			mappings = {
				i = {
					["<esc>"] = require("telescope.actions").close,
				},
			},
		},

		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--smart-case",
			"-uu",
		},

		extensions = {
			file_browser = {
				hijack_netrw = true,
				respect_gitignore = false,
				auto_depth = false,
			},
		},
	})
end

local telescope_loaded = false
local ensure_telescope = function()
	if not telescope_loaded then
		telescope_setup()
		require("telescope").load_extension("file_browser")
		telescope_loaded = true
	end
end

vim.keymap.set("n", "<leader>b", function()
	ensure_telescope()
	vim.cmd("Telescope buffers")
end)
vim.keymap.set("n", "<leader>f", function()
	ensure_telescope()
	vim.cmd("Telescope file_browser")
end)

----MODES
require("modes").setup({
	colors = {
		copy = "#DBBC7F",
		delete = "#D699B6",
		insert = "#A7C080",
		visual = "#7FBBB3",
	},
	line_opacity = 0.15,
	set_cursor = true,
	set_cursorline = true,
	set_number = true,
	ignore_filetypes = { "NvimTree", "TelescopePrompt" },
})

----HLSLENS
require("hlslens").setup({
	calm_down = true,
	nearest_only = true,
})
local kopts = { noremap = true, silent = true }
vim.keymap.set(
	"n",
	"n",
	[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
	kopts
)
vim.keymap.set(
	"n",
	"N",
	[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
	kopts
)
vim.keymap.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

----AUTOCMDS
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "man" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true })
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local save = vim.fn.winsaveview()
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.winrestview(save)
	end,
})

vim.keymap.set("n", "<leader>9", [[:vimgrep /\w\+/j % | copen<CR>]], { noremap = true, silent = true })
