----GENERAL SETTINGS
local opt = vim.opt
vim.g.mapleader = " "
opt.helplang = "ja", "en"
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
opt.cmdheight = 2
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
vim.opt.shortmess:append("I")
vim.cmd("set completeopt-=preview")

----ADVANCED SETTINGS

--KEEP CURSOR
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

----KEY MAPPING

--EDIT
vim.keymap.set("n", "ew", ":<C-u>w<CR>")
vim.keymap.set("n", "eq", ":<C-u>wq<CR>")
vim.keymap.set("n", "Q", ":<C-u>quit!<CR>")
vim.keymap.set("n", "<leader>q", ":<C-u>bd<CR>")
vim.keymap.set("n", "<C-s>", ":<C-u>%s///cg<Left><Left><Left><Left>")
vim.keymap.set("n", "<C-c>", ":<C-u>echo wordcount()['chars']<CR>")
vim.keymap.set("n", "<C-d>", ":<C-u>lua print(genko())<CR>")
vim.keymap.set("v", "i<leader>", "iW")
vim.keymap.set("o", "i<leader>", "iW")
vim.keymap.set("n", "U", "<c-r>")
vim.keymap.set("i", "<C-g><C-u>", "<esc>gUiwgi")
vim.keymap.set("i", "<C-g><C-l>", "<esc>guiwgi")
vim.keymap.set("i", "<C-g><C-k>", "<esc>bgUlgi")
vim.keymap.set("n", "i", function()
	return vim.fn.empty(vim.fn.getline(".")) == 1 and '"_cc' or "i"
end, { expr = true, noremap = true })
vim.keymap.set("n", "A", function()
	return vim.fn.empty(vim.fn.getline(".")) == 1 and '"_cc' or "A"
end, { expr = true, noremap = true })
vim.keymap.set("n", "<C-k>", function()
	return string.format("<cmd>move-1-%d<CR>=l", vim.v.count1)
end, { expr = true, noremap = true })
vim.keymap.set("n", "<C-j>", function()
	return string.format("<cmd>move+%d<CR>=l", vim.v.count1)
end, { expr = true, noremap = true })
vim.keymap.set("v", "<C-k>", ":move'<-2<CR>gv=gv")
vim.keymap.set("v", "<C-j>", ":move'>+1<CR>gv=gv")

--TAB
vim.keymap.set("n", "<leader><TAB>", ":bprev<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { silent = true })

--SPLIT
vim.keymap.set("n", "sv", ":<C-u>vsplit<CR>", { silent = true })
vim.keymap.set("n", "sp", ":<C-u>split<CR>", { silent = true })

--NOP
vim.keymap.set("n", "<MiddleMouse>", "<Nop>")
vim.keymap.set("n", "<2-MiddleMouse>", "<Nop>")
vim.keymap.set("n", "<3-MiddleMouse>", "<Nop>")
vim.keymap.set("n", "<4-MiddleMouse>", "<Nop>")
vim.keymap.set("i", "<1-MiddleMouse>", "<Nop>")
vim.keymap.set("i", "<2-MiddleMouse>", "<Nop>")
vim.keymap.set("i", "<3-MiddleMouse>", "<Nop>")
vim.keymap.set("i", "<4-MiddleMouse>", "<Nop>")
vim.keymap.set("n", "qq", "<Nop>")
vim.keymap.set("v", "qq", "<Nop")
vim.keymap.set("n", "ZZ", "<Nop>")
vim.keymap.set("n", "ZQ", "<Nop>")
vim.keymap.set("n", "<C-z>", "<Nop>")
vim.keymap.set("n", "<F1>", "<Nop>")
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "x", '"_x')
vim.keymap.set("n", "X", '"_D')
vim.keymap.set("n", "s", '"_s')

--MOVE
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "<UP>", "gk")
vim.keymap.set("n", "<DOWN>", "gj")
vim.keymap.set("n", "O", ":<C-u>call append(expand('.'), '')<CR>j")
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sl", "<C-w>l")
vim.keymap.set("n", "sH", "<C-w>H")
vim.keymap.set("n", "sJ", "<C-w>J")
vim.keymap.set("n", "sK", "<C-w>K")
vim.keymap.set("n", "sL", "<C-w>L")
vim.keymap.set("n", "<leader>m", "<plug>(matchup-%)")

--COPY
vim.keymap.set("n", "p", "]p")
vim.keymap.set("n", "P", "]P")
vim.keymap.set("v", "p", "P")
vim.keymap.set("v", "y", "mzy`z")
vim.keymap.set("n", "<leader>u", "<cmd>copy.<CR>")
vim.keymap.set("n", "<leader>U", "<cmd>copy-1<CR>")
vim.keymap.set("v", "<leader>u", ":copy'<-1<Cg>gv")
vim.keymap.set("v", "<leader>U", ":copy'>+0<CR>gv")

----PLUGINS

--MANAGER
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
require("lazy").setup({
	defaults = { lazy = true },
	{ "nvim-lualine/lualine.nvim", event = "UIEnter" },
	{ "nvim-telescope/telescope.nvim", cmd = "Telescope" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		cmd = "Telescope",
	},
	{ "nvim-telescope/telescope-file-browser.nvim", cmd = "Telescope file_browser" },
	{ "danielfalk/smart-open.nvim", cmd = "Telescope smart_open" },
	{ "kkharji/sqlite.lua", event = "VeryLazy" },
	{ "lewis6991/gitsigns.nvim", config = true, event = "BufReadPre" },
	{ "ryanoasis/vim-devicons", event = "UIEnter" },
	{ "nvim-tree/nvim-web-devicons", event = "UIEnter" },
	{ "williamboman/mason.nvim", event = "BufRead", cmd = { "Mason", "MasonInstall" } },
	{ "williamboman/mason-lspconfig.nvim", event = "BufReadPre" },
	{ "jay-babu/mason-null-ls.nvim", event = "LspAttach" },
	{ "jay-babu/mason-nvim-dap.nvim", event = "LspAttach" },
	{ "neovim/nvim-lspconfig", event = "BufReadPre" },
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		event = "LspAttach",
	},
	{ "mfussenegger/nvim-dap", event = "LspAttach" },
	{ "rcarriga/nvim-dap-ui", event = "LspAttach" },
	{ "nvim-neotest/nvim-nio", event = "LspAttach" },
	{ "theHamsta/nvim-dap-virtual-text", config = true, event = "LspAttach" },
	{ "suketa/nvim-dap-ruby", config = true, ft = "ruby" },
	{ "mxsdev/nvim-dap-vscode-js", ft = "javascript" },
	{ "nvimdev/lspsaga.nvim", event = "LspAttach" },
	{ "Wansmer/treesj", event = "LspAttach" },
	{ "is0n/jaq-nvim", event = "LspAttach" },
	{ "j-hui/fidget.nvim", config = true, event = "LspAttach" },
	{ "neanias/everforest-nvim", event = "VeryLazy" },
	{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{ "MunifTanjim/nui.nvim", event = "VeryLazy" },
	{ "Saghen/blink.cmp", event = "InsertEnter" },
	{ "fang2hou/blink-copilot", event = "InsertEnter" },
	{ "rafamadriz/friendly-snippets", event = "InsertEnter" },
	{ "nvim-treesitter/nvim-treesitter", event = { "BufReadPost", "BufNewFile" } },
	{ "nvim-treesitter/nvim-treesitter-refactor", event = "BufRead" },
	{ "yioneko/nvim-yati", event = "BufRead" },
	{ "windwp/nvim-autopairs", config = true, event = "InsertEnter" },
	{ "windwp/nvim-ts-autotag", config = true, event = "InsertEnter" },
	{ "HiPhish/rainbow-delimiters.nvim", event = "VeryLazy" },
	{ "andymass/vim-matchup", event = "BufRead" },
	{ "lambdalisue/suda.vim", cmd = { "SudaWrite", "SudaRead" } },
	{ "jghauser/mkdir.nvim", event = "ModeChanged" },
	{ "shellRaining/hlchunk.nvim", config = true, event = "BufReadPost" },
	{ "kevinhwang91/nvim-hlslens", event = "VeryLazy" },
	{ "akinsho/git-conflict.nvim", version = "*", config = true, cmd = "GitConflictListQf" },
	{ "numToStr/Comment.nvim", config = true, event = "VeryLazy" },
	{ "rhysd/clever-f.vim", keys = { "f", "F", "t", "T" } },
	{ "echasnovski/mini.surround", event = "ModeChanged" },
	{ "echasnovski/mini.ai", event = "ModeChanged" },
	{ "mvllow/modes.nvim", event = "VeryLazy" },
	{ "monaqa/dial.nvim", event = "VeryLazy" },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "nvim-zh/colorful-winsep.nvim", config = true, event = "WinNew" },
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	{ "vim-jp/vimdoc-ja", ft = "help" },
	{ "yetone/avante.nvim", event = "VeryLazy" },
	{ "kdheepak/lazygit.nvim", event = "LspAttach" },
	{ "zbirenbaum/copilot.lua", event = "VeryLazy" },
	{ "ysmb-wtsg/in-and-out.nvim", event = "VeryLazy" },
	{ "nacro90/numb.nvim", config = true, event = "BufRead" },

	--non-lazy
	{ "vim-denops/denops.vim", lazy = false },
	{ "yuki-yano/fuzzy-motion.vim", lazy = false },
	{ "lambdalisue/gin.vim", lazy = false },
	{ "rbtnn/vim-ambiwidth", lazy = false },
	{ "lambdalisue/kensaku-search.vim", lazy = false },
	{ "lambdalisue/kensaku.vim", lazy = false },
	{ "brenoprata10/nvim-highlight-colors", lazy = false },

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
				"sql_completion",
			},
		},
	},
})

--lualine
require("lualine").setup({
	options = {
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "TelescopePrompt" },
		always_divide_middle = true,
		colored = false,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "" },
		lualine_b = { "branch", "diff" },
		lualine_c = {
			{
				"filename",
				path = 1,
				file_status = true,
				shorting_target = 40,
				symbols = {
					modified = "[+]",
					readonly = "[RO]",
					unnamed = "Untitled",
				},
			},
		},
		lualine_x = { "filetype" },
		lualine_y = {
			{
				"diagnostics",
				source = { "nvim-lsp" },
			},
			{ "progress" },
			{ "location" },
		},
		lualine_z = { "" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

--telescope
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
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

vim.keymap.set("n", "<leader>,", "<cmd>Telescope oldfiles<cr>")
vim.keymap.set("n", "<leader>.", "<cmd>Telescope smart_open<cr>")
vim.keymap.set("n", "<leader>l", "<cmd>Telescope live_grep grep_open_files=true<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>i", "<cmd>Telescope lsp_incoming_calls<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>Telescope lsp_outgoing_calls<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader><leader>h", "<cmd>Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>y", "<cmd>Telescope registers<CR>")
vim.keymap.set("n", "<leader>n", "<cmd>Telescope lsp_references<CR>")
vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics<CR>")
vim.keymap.set("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>Telescope file_browser<CR>")

require("telescope").load_extension("smart_open")
local fb_actions = require("telescope").extensions.file_browser.actions
local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
	filepath = vim.fn.expand(filepath)
	Job:new({
		command = "file",
		args = { "--mime-type", "-b", filepath },
		on_exit = function(j)
			local mime_type = vim.split(j:result()[1], "/")[1]
			if mime_type == "text" then
				previewers.buffer_previewer_maker(filepath, bufnr, opts)
			else
				vim.schedule(function()
					vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
				end)
			end
		end,
	}):sync()
end

--LSP
require("lspsaga").setup({
	symbol_in_winbar = {
		enable = false,
	},
	ui = {
		border = "single",
		title = false,
	},
	lightbulb = {
		enable = false,
	},
	diagnostic = {
		diagnostic_only_current = false,
	},
})

local on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	local set = vim.keymap.set
	set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
	set("n", "<leader>r", "<cmd>Lspsaga rename<CR>")
	set("n", "<leader>c", "<cmd>Lspsaga code_action<CR>")
	set("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>")
	set("n", "<leader>j", "<cmd>Lspsaga peek_definition<CR>")
	set("n", "<leader>gj", "<cmd>Lspsaga goto_definition<CR>")
	set("n", "<leader>[", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
	set("n", "<leaaer>]", "<cmd>Lspsaga diagnostic_jump_next<CR>")
end
vim.diagnostic.config({ virtual_text = false, severity_sort = true })
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("mason").setup()
require("mason-null-ls").setup({
	ensure_installed = { "prettierd", "rubocop", "erb_lint", "stylua", "shfmt" },
	handlers = {},
})
require("mason-nvim-dap").setup({
	ensure_installed = {},
	handlers = {},
})
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			single_file_support = true,
		})
	end,
})

--none-ls
local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.rubocop,
		null_ls.builtins.formatting.rubocop,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
		require("none-ls.diagnostics.eslint"),
	},
})

vim.keymap.set("n", "<leader>p", function()
	vim.lsp.buf.format({ async = true })
end)

--DAP
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>1", ":lua require'dap'.continue()<CR>", { silent = true })
map("n", "<leader>2", ":lua require'dap'.step_over()<CR>", { silent = true })
map("n", "<leader>3", ":lua require'dap'.step_into()<CR>", { silent = true })
map("n", "<leader>4", ":lua require'dap'.step_out()<CR>", { silent = true })
map("n", "<leader>5", ":lua require'dap'.terminate()<CR>", { silent = true })
map("n", "<leader>;", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
map("n", "<leader>'", ":lua require'dapui'.toggle()<CR>", { silent = true })
map("n", "<leader><leader>d", ":lua require'dapui'.eval()<CR>", { silent = true })

--DAP-UI
require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	expand_lines = vim.fn.has("nvim-0.7") == 1,
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"repl",
			},
			size = 0.25,
			position = "bottom",
		},
	},
	controls = {
		enabled = true,
		element = "repl",
		icons = {
			pause = "",
			play = "",
			step_into = "",
			step_over = "",
			step_out = "",
			step_back = "",
			run_last = "↻",
			terminate = "□",
		},
	},
	floating = {
		max_height = nil,
		max_width = nil,
		border = "single",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil,
		max_value_lines = 100,
	},
})

--jaq-nvim
require("jaq-nvim").setup({
	cmds = {
		internal = {
			lua = "luafile %",
			vim = "source %",
		},
		external = {
			sh = "sh %",
			ruby = "ruby %",
			javascript = "node %",
			typescript = "deno %",
			go = "go run %",
		},
	},

	behavior = {
		default = "float",
		startinsert = false,
		wincmd = false,
		autosave = false,
	},

	ui = {
		float = {
			border = "none",
			winhl = "Normal",
			borderhl = "FloatBorder",
			winblend = 0,
			height = 0.8,
			width = 0.8,
			x = 0.5,
			y = 0.5,
		},

		terminal = {
			position = "bot",
			size = 10,
			line_no = false,
		},
		quickfix = {
			position = "bot",
			size = 10,
		},
	},
})
vim.keymap.set("n", "<leader>x", ":<C-u>Jaq<CR>", { silent = true })

-- blink.cmp
require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		["<Tab>"] = { "select_next", "fallback" },
	},
	completion = {
		menu = {
			border = "single",
			winblend = 10,
			draw = {
				treesitter = { "lsp" },
			},
		},
		list = {
			selection = {
				preselect = true,
				auto_insert = true,
			},
		},
		documentation = {
			window = {
				border = "single",
				winblend = 10,
			},
		},
	},
	signature = {
		enabled = true,
		trigger = {
			enabled = true,
		},
		window = {
			border = "single",
			winblend = 10,
			treesitter_highlighting = true,
			show_documentation = true,
		},
	},
	snippets = {
		expand = function(snippet)
			vim.snippet.expand(snippet)
		end,
	},
	sources = {
		default = { "copilot", "lsp", "snippets", "path", "buffer", "omni" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-copilot",
				score_offset = 100,
				async = true,
			},
		},
		min_keyword_length = 2,
	},
	cmdline = {
		completion = {
			list = {
				selection = {
					preselect = false,
				},
			},
			menu = {
				auto_show = true,
			},
		},
	},
})

--nvim-treesitter
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		disable = { "help", "markdown", "toml" },
	},
	refactor = {
		highlight_defintions = {
			enable = true,
		},
	},
	indent = {
		enable = true,
	},
	yati = {
		enable = false,
	},
	matchup = {
		enable = true,
		enable_quotes = true,
	},
	ensure_installed = "all",
})

--nvim-ts-autotag
require("nvim-ts-autotag").setup()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = true,
})

--treesj
local tsj = require("treesj")
tsj.setup({
	use_default_keymaps = false,
})
vim.keymap.set("n", "<leader>z", require("treesj").toggle)

--rainbow-delimiters
require("rainbow-delimiters.setup").setup()

--hlchunk
require("hlchunk").setup({
	chunk = {
		enable = true,
		chars = {
			horizontal_line = "─",
			vertical_line = "│",
			left_top = "┌",
			left_bottom = "└",
			right_arrow = ">",
		},
		style = {
			{ fg = "#D699B6" },
			{ fg = "#E67E80" },
		},
	},
	indent = {
		enable = true,
	},
})

--nvim-bqf
require("bqf").setup({
	preview = {
		border = "single",
	},
})

vim.keymap.set("n", "<leader>9", [[:vimgrep /\w\+/j % | copen<CR>]], { noremap = true, silent = true })

--dressing
require("dressing").setup({
	input = {
		border = "single",
	},
	builtin = {
		border = "single",
	},
})

--modes
require("modes").setup({
	colors = {
		copy = "#DBBC7F",
		delete = "#D699B6",
		insert = "#83C092",
		visual = "#E67E80",
	},
})

--colorful-winsep
require("colorful-winsep").setup({
	highlight = {
		bg = "",
		fg = "#D3C6AA",
	},
})

--nvim-highlight-colors
require("nvim-highlight-colors").setup({
	render = "background",
	enable_named_colors = false,
	enable_tailwind = true,
})

--nvim-hlslens
require("hlslens").setup()
local kopts = { noremap = true, silent = true }

vim.keymap.set(
	"n",
	"n",
	[[<cmd>execute('normal! ' . v:count1 . 'n')<CR><cmd>lua require('hlslens').start()<CR>]],
	kopts
)
vim.keymap.set(
	"n",
	"N",
	[[<cmd>execute('normal! ' . v:count1 . 'N')<CR><cmd>lua require('hlslens').start()<CR>]],
	kopts
)
vim.keymap.set("n", "*", [[*<cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "#", [[#<cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "g*", [[g*<cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "g#", [[g#<cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "<ESC>", ":nohl<CR><ESC>", kopts)

--fuzzy-motion
vim.keymap.set("n", "S", "<cmd>FuzzyMotion<CR>")
vim.cmd("let g:fuzzy_motion_matchers = ['kensaku', 'fzf']")

--kensaku-search
vim.keymap.set("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>")

--clever-f
vim.cmd("let g:clever_f_across_no_line = 1")
vim.cmd("let g:clever_f_ignore_case = 1")
vim.cmd("let g:clever_f_smart_case = 1")
vim.cmd("let g:clever_f_chars_match_any_signs = ';'")
vim.cmd("let g:clever_f_use_migemo = 1")

--mini.surround
require("mini.surround").setup({
	mappings = {
		highlight = "sx",
	},
	custom_surroundings = {
		["{"] = {
			input = { "%b{}", "^.().*().$" },
			output = { left = "{", right = "}" },
		},
		["}"] = {
			input = { "%b{}", "^.%{().*()%}.$" },
			output = { left = "{{", right = "}}" },
		},
		["("] = {
			input = { "%b()", "^.().*().$" },
			output = { left = "(", right = ")" },
		},
		[")"] = {
			input = { "%b()", "^.%(().*()%).$" },
			output = { left = "((", right = "))" },
		},
		["["] = {
			input = { "%b[]", "^.().*().$" },
			output = { left = "[", right = "]" },
		},
		["]"] = {
			input = { "%b[]", "^.%[().*()%].$" },
			output = { left = "[[", right = "]]" },
		},
		["<"] = {
			input = { "%b<>", "^.().*().$" },
			output = { left = "<", right = ">" },
		},
		[">"] = {
			input = { "%b[]", "^.<().*()>.$" },
			output = { left = "<<", right = ">>" },
		},
		["j"] = {
			input = function()
				local ok, val = pcall(vim.fn.getchar)
				if not ok then
					return
				end
				local char = vim.fn.nr2char(val)

				local dict = {
					["("] = { "（().-()）" },
					["{"] = { "｛().-()｝" },
					["["] = { "「().-()」" },
					["]"] = { "『().-()』" },
					["<"] = { "＜().-()＞" },
					['"'] = { "”().-()”" },
				}

				if char == "b" then
					local ret = {}
					for _, v in pairs(dict) do
						table.insert(ret, v)
					end
					return { ret }
				end

				if dict[char] then
					return dict[char]
				end

				error("%s is unsupported surroundings in Japanese")
			end,
			output = function()
				local ok, val = pcall(vim.fn.getchar)
				if not ok then
					return
				end
				local char = vim.fn.nr2char(val)

				local dict = {
					["("] = { left = "（", right = "）" },
					["{"] = { left = "｛", right = "｝" },
					["["] = { left = "「", right = "」" },
					["]"] = { left = "『", right = "』" },
					["<"] = { left = "＜", right = "＞" },
					['"'] = { left = "”", right = "”" },
				}

				if not dict[char] then
					error("%s is unsupported surroundings in Japanese")
				end

				return dict[char]
			end,
		},
	},
})

--mini.ai
require("mini.ai").setup({
	custom_textobjects = {
		["{"] = { "%b{}", "^.().*().$" },
		["}"] = { "%b{}", "^.%{().*()%}.$" },
		["("] = { "%b()", "^.().*().$" },
		[")"] = { "%b()", "^.%(().*()%).$" },
		["["] = { "%b[]", "^.().*().$" },
		["]"] = { "%b[]", "^.%[().*()%].$" },
		[""] = { "%b<", "^.().*().$" },
		[">"] = { "%b", "^.().*().$" },
		["j"] = function()
			local ok, val = pcall(vim.fn.getchar)
			if not ok then
				return
			end
			local char = vim.fn.nr2char(val)

			local dict = {
				["("] = { "（().-()）" },
				["{"] = { "｛().-()｝" },
				["["] = { "「().-()」" },
				["]"] = { "『().-()』" },
				["<"] = { "＜().-()＞" },
				['"'] = { "”().-()”" },
			}

			if char == "b" then
				local ret = {}
				for _, v in pairs(dict) do
					table.insert(ret, v)
				end
				return { ret }
			end

			if dict[char] then
				return dict[char]
			end

			error("%s is unsupported textobjects in Japanese")
		end,
	},
})

--dial
vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })

--gin
vim.keymap.set("n", "<leader>gs", ":<C-u>GitStatus<CR>", { silent = true })
vim.keymap.set("n", "<leader>ga", ":<C-u>Gin add .<CR>", { silent = true })
vim.keymap.set("n", "<leader>gc", ":<C-u>Gin commit -m ")
vim.keymap.set("n", "<leader>gp", ":<C-u>Gin push<CR>")

--copilot
require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})

--avante
require("avante_lib").load()
local avante_config = {
	provider = "copilot",
	copilot = {
		model = "claude-3.7-sonnet",
	},
	auto_suggestions_provider = "copilot",
	file_selector = {
		provider = "telescope",
	},
	behaviour = {
		auto_set_highlight_group = false,
		auto_set_keymaps = true,
		auto_apply_diff_after_generation = false,
		support_paste_from_clipboard = true,
		minimize_diff = true,
	},
	windows = {
		position = "right",
		wrap = true,
		width = 30,
		sidebar_header = {
			enabled = true,
			align = "right",
			rounded = false,
		},
		input = {
			height = 5,
		},
		edit = {
			border = "single",
			start_insert = true,
		},
		ask = {
			floating = true,
			start_insert = true,
			border = "single",
		},
	},
}

require("avante").setup(avante_config)
vim.g.current_copilot_model = "claude-3.7-sonnet"
vim.keymap.set("n", "<leader>am", function()
	if vim.g.current_copilot_model == "claude-3.7-sonnet" then
		vim.g.current_copilot_model = "gpt-4o"
	else
		vim.g.current_copilot_model = "claude-3.7-sonnet"
	end
	avante_config.copilot.model = vim.g.current_copilot_model
	require("avante").setup(avante_config)
	vim.notify("Copilot model changed to " .. vim.g.current_copilot_model, vim.log.levels.INFO)
end)

--lazygit
vim.keymap.set("n", "<leader>=", ":<C-u>LazyGit<CR>", { silent = true })
vim.g.lazygit_floating_window_border_chars = { "", "", "", "", "", "", "", "" }

--in-and-out
vim.keymap.set("i", "<A-CR>", function()
	require("in-and-out").in_and_out()
end)

--colorscheme

vim.cmd("colorscheme everforest")

--OTHER SETTINGS
function genko()
	local line_count = 0
	local num_lines = vim.api.nvim_buf_line_count(0)

	for i = 1, num_lines do
		local line = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1]
		local s = math.ceil(vim.fn.strchars(line) / 20.0)
		line_count = line_count + (s == 0 and 1 or s)
	end

	return line_count / 20.0
end
