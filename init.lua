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
opt.laststatus = 0
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
	{ "b0o/incline.nvim", event = "UIEnter" },
	{ "nvim-telescope/telescope.nvim", cmd = "Telescope" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		cmd = "Telescope",
	},
	{ "nvim-telescope/telescope-file-browser.nvim", cmd = "Telescope file_browser" },
	{ "danielfalk/smart-open.nvim", cmd = "Telescope smart_open" },
	{ "kkharji/sqlite.lua", lazy = true },
	{ "lewis6991/gitsigns.nvim", config = true, event = "BufReadPre" },
	{ "nvim-tree/nvim-web-devicons", event = "UIEnter" },
	{ "mason-org/mason.nvim", cmd = { "Mason", "MasonInstall", "MasonUninstall" } },
	{ "mason-org/mason-lspconfig.nvim", lazy = true },
	{ "jay-babu/mason-null-ls.nvim", event = "LspAttach" },
	{ "neovim/nvim-lspconfig", event = "BufReadPre" },
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		event = "LspAttach",
	},
	{ "nvimdev/lspsaga.nvim", event = "LspAttach" },
	{ "Wansmer/treesj", event = "LspAttach" },
	{ "is0n/jaq-nvim", event = "LspAttach" },
	{ "j-hui/fidget.nvim", config = true, event = "LspAttach" },
	{ "neanias/everforest-nvim", event = "VeryLazy" },
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "nvim-flutter/flutter-tools.nvim", event = "LspAttach" },
	{ "MunifTanjim/nui.nvim", event = "VeryLazy" },
	{ "Saghen/blink.cmp", event = { "InsertEnter", "CmdLineEnter" } },
	{ "fang2hou/blink-copilot", event = "InsertEnter" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		event = "InsertEnter",
	},
	{ "Kaiser-Yang/blink-cmp-avante", event = "InsertEnter" },
	{ "nvim-treesitter/nvim-treesitter", event = { "BufReadPost", "BufNewFile" } },
	{ "nvim-treesitter/nvim-treesitter-refactor", event = "BufRead" },
	{ "yioneko/nvim-yati", event = "BufReadPost" },
	{ "windwp/nvim-autopairs", config = true, event = "InsertEnter" },
	{ "windwp/nvim-ts-autotag", config = true, event = "InsertEnter" },
	{ "HiPhish/rainbow-delimiters.nvim", event = "BufReadPost" },
	{ "andymass/vim-matchup", event = "BufRead" },
	{ "lambdalisue/suda.vim", cmd = { "SudaWrite", "SudaRead" } },
	{ "jghauser/mkdir.nvim", event = "ModeChanged" },
	{ "shellRaining/hlchunk.nvim", config = true, event = "BufReadPost" },
	{ "kevinhwang91/nvim-hlslens", keys = { "n", "N", "*", "#", "g*", "g#" } },
	{ "akinsho/git-conflict.nvim", version = "*", config = true, cmd = "GitConflictListQf" },
	{ "numToStr/Comment.nvim", config = true, keys = { "gc", "gb", { "gc", mode = "v" }, { "gb", mode = "v" } } },
	{ "rhysd/clever-f.vim", keys = { "f", "F", "t", "T" } },
	{ "echasnovski/mini.surround", event = "ModeChanged" },
	{ "echasnovski/mini.ai", event = "ModeChanged" },
	{ "mvllow/modes.nvim", event = "ModeChanged" },
	{
		"monaqa/dial.nvim",
		keys = {
			"<C-a>",
			"<C-x>",
			{ "<C-a>", mode = "v" },
			{ "<C-x>", mode = "v" },
			{ "g<C-a>", mode = "v" },
			{ "g<C-x>", mode = "v" },
		},
	},
	{ "tpope/vim-repeat", keys = "." },
	{ "vim-jp/vimdoc-ja", ft = "help" },
	{ "yetone/avante.nvim", build = "make", event = "InsertEnter" },
	{ "zbirenbaum/copilot.lua", event = "InsertEnter" },
	{ "ysmb-wtsg/in-and-out.nvim", keys = { { "<A-CR>", mode = "i" } } },
	{ "nacro90/numb.nvim", config = true, event = "BufRead" },
	{ "yuki-yano/fuzzy-motion.vim", keys = "S" },
	{ "rbtnn/vim-ambiwidth", event = "VeryLazy" },
	{ "lambdalisue/kensaku-search.vim", keys = { "/", "?" } },
	{ "lambdalisue/kensaku.vim", lazy = true },
	{ "brenoprata10/nvim-highlight-colors", event = "BufReadPost" },
	{ "folke/noice.nvim", event = "UIEnter" },

	--non-lazy
	{ "folke/snacks.nvim", priority = 1000, lazy = false },
	{ "vim-denops/denops.vim", lazy = false },

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

--incline
vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		require("incline").setup({
			window = {
				padding = 0,
				margin = { horizontal = 1, vertical = 1 },
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":~:.")
				if filename == "" then
					filename = "[No Name]"
				end
				local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
				local modified = vim.bo[props.buf].modified

				local function get_git_branch()
					local signs = vim.b[props.buf].gitsigns_status_dict
					if signs and signs.head and signs.head ~= "" then
						return { signs.head .. " ", group = "String" }
					end
					return {}
				end

				local function get_git_diff()
					local icons = { removed = "➖", changed = "🔄", added = "➕" }
					local signs = vim.b[props.buf].gitsigns_status_dict
					local labels = {}
					if signs == nil then
						return labels
					end
					for name, icon in pairs(icons) do
						if tonumber(signs[name]) and signs[name] > 0 then
							table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
						end
					end
					if #labels > 0 then
						table.insert(labels, { "┊ " })
					end
					return labels
				end

				local function get_diagnostic_label()
					local icons = { error = "⛔", warn = "⚡", info = "💡", hint = "✨" }
					local label = {}

					for severity, icon in pairs(icons) do
						local severity_level = vim.diagnostic.severity[string.upper(severity)]
						local diagnostics = vim.diagnostic.get(props.buf, { severity = severity_level })
						local count = #diagnostics

						if count > 0 then
							local severity_capitalized = string.upper(severity:sub(1, 1)) .. severity:sub(2)
							local group = "DiagnosticSign" .. severity_capitalized
							table.insert(label, { icon .. count .. " ", group = group })
						end
					end

					if #label > 0 then
						table.insert(label, { "┊ " })
					end

					return label
				end

				local function get_location()
					local line = vim.api.nvim_win_get_cursor(props.win)[1]
					local total_lines = vim.api.nvim_buf_line_count(props.buf)
					local percentage = math.floor((line / total_lines) * 100)
					return string.format("%d%%", percentage)
				end

				local buffer = {
					{ get_git_branch() },
					{ get_diagnostic_label() },
					{ get_git_diff() },
					{ (ft_icon or "") .. " " },
					{ filename .. " ", gui = modified and "bold,italic" or "bold" },
					{ modified and " ●" or "" },
					{ " " .. get_location() },
				}
				return buffer
			end,
		})
	end,
})

--telescope
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
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
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
		require("telescope").load_extension("smart_open")
		require("telescope").load_extension("file_browser")
		vim.keymap.set("n", "<leader>i", "<cmd>Telescope lsp_incoming_calls<CR>")
		vim.keymap.set("n", "<leader>o", "<cmd>Telescope lsp_outgoing_calls<CR>")
		vim.keymap.set("n", "<leader><leader>h", "<cmd>Telescope help_tags<CR>")
		vim.keymap.set("n", "<leader>y", "<cmd>Telescope registers<CR>")
		vim.keymap.set("n", "<leader>n", "<cmd>Telescope lsp_references<CR>")
		vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics<CR>")
		vim.keymap.set("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<CR>")
		telescope_loaded = true
	end
end

vim.keymap.set("n", "<leader>,", function()
	ensure_telescope()
	vim.cmd("Telescope oldfiles")
end)
vim.keymap.set("n", "<leader>.", function()
	ensure_telescope()
	vim.cmd("Telescope smart_open")
end)
vim.keymap.set("n", "<leader>l", function()
	ensure_telescope()
	vim.cmd("Telescope live_grep grep_open_files=true")
end)
vim.keymap.set("n", "<leader>k", function()
	ensure_telescope()
	vim.cmd("Telescope live_grep")
end)
vim.keymap.set("n", "<leader>b", function()
	ensure_telescope()
	vim.cmd("Telescope buffers")
end)
vim.keymap.set("n", "<leader>f", function()
	ensure_telescope()
	vim.cmd("Telescope file_browser")
end)
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
vim.api.nvim_create_autocmd("LspAttach", {
	once = true,
	callback = function()
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
	end,
})

--LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		local set = vim.keymap.set
		set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
		set("n", "<leader>r", "<cmd>Lspsaga rename<CR>")
		set("n", "<leader>c", "<cmd>Lspsaga code_action<CR>")
		set("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>")
		set("n", "<leader>j", "<cmd>Lspsaga peek_definition<CR>")
		set("n", "<leader>gj", "<cmd>Lspsaga goto_definition<CR>")
		set("n", "<leader>[", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
		set("n", "<leader>]", "<cmd>Lspsaga diagnostic_jump_next<CR>")
	end,
})
vim.diagnostic.config({ virtual_text = false, severity_sort = true })
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("mason").setup()
require("mason-null-ls").setup({
	ensure_installed = { "prettierd", "rubocop", "erb_lint", "stylua", "shfmt" },
	handlers = {},
})
require("mason-lspconfig").setup()

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

--flutter-tools
require("flutter-tools").setup({})

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
			typescript = "node %",
			go = "go run %",
			java = "java %",
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
vim.api.nvim_create_autocmd({ "InsertEnter", "CmdLineEnter" }, {
	once = true,
	callback = function()
		require("blink.cmp").setup({
			keymap = {
				preset = "enter",
				["<Tab>"] = { "select_next", "fallback" },
				["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
			},
			fuzzy = { implementation = "rust" },
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
				preset = "luasnip",
			},
			sources = {
				default = { "avante", "copilot", "lsp", "snippets", "path", "buffer", "cmdline", "omni" },
				providers = {
					avante = {
						module = "blink-cmp-avante",
						name = "Avante",
					},
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
						auto_show = function(ctx)
							return vim.fn.getcmdtype() == ":"
						end,
					},
				},
			},
		})
	end,
})

--luasnip
require("luasnip.loaders.from_vscode").lazy_load()

--nvim-treesitter
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	once = true,
	callback = function()
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
	end,
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

--snacks
require("snacks").setup({
	animate = { enabled = false },
	bigfile = { enabled = true },
	bufdelete = { enabled = true },
	dashboard = { enabled = false },
	debug = { enabled = false },
	dim = { enabled = false },
	explorer = { enabled = false },
	gh = { enabled = false },
	git = { enabled = false },
	gitbrowse = { enabled = false },
	image = { enabled = false },
	indent = { enabled = false },
	input = {
		enabled = true,
		icon = " ",
		icon_pos = "left",
		win = {
			border = "single",
			relative = "cursor",
			row = -3,
			col = 0,
		},
	},
	lazygit = { enabled = true },
	notifier = {
		enabled = true,
		style = "compact",
	},
	notify = { enabled = false },
	picker = { enabled = false },
	profiler = { enabled = false },
	quickfile = { enabled = true },
	rename = { enabled = false },
	scope = { enabled = false },
	scroll = { enabled = false },
	statuscolumn = { enabled = false },
	terminal = { enabled = false },
	toggle = { enabled = false },
	words = { enabled = true },
	zen = { enabled = false },
	styles = {
		input = {
			border = "single",
		},
		notification = {
			border = "single",
		},
	},
})

--noice
require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = false,
		command_palette = false,
		long_message_to_split = true,
		lsp_doc_border = true,
	},
	views = {
		cmdline_popup = {
			border = {
				style = "single",
			},
		},
		popupmenu = {
			border = {
				style = "single",
			},
		},
		confirm = {
			border = {
				style = "single",
			},
		},
		hover = {
			border = {
				style = "single",
			},
		},
	},
})

--modes
require("modes").setup({
	colors = {
		copy = "#DBBC7F",
		visual = "#D699B6",
		replace = "#E9967A",
		insert = "#83C092",
		delete = "#E67E80",
	},
	line_opacity = 0.3,
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
vim.keymap.set("c", "<CR>", function()
	local cmdtype = vim.fn.getcmdtype()
	if cmdtype == "/" or cmdtype == "?" then
		return "<Plug>(kensaku-search-replace)<CR>"
	else
		return "<CR>"
	end
end, { expr = true })

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

--copilot
require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})

--avante
require("avante_lib").load()
local avante_config = {
	hints = { enabled = false },
	provider = "copilot",
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
		enable_claude_text_editor_tool_mode = true,
		enable_token_counting = false,
	},
	providers = {
		copilot = {
			endpoint = "https://api.githubcopilot.com",
			model = "claude-sonnet-4.5",
			timeout = 30000,
		},
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

--lazygit
vim.keymap.set("n", "<leader>=", function()
	Snacks.lazygit()
end, { silent = true })

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
		if line then
			local chars = vim.fn.strchars(line)
			local s = math.ceil(chars / 20.0)
			line_count = line_count + (s == 0 and 1 or s)
		end
	end

	return string.format("%.2f", line_count / 20.0)
end
