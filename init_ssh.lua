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
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

----KEYMAPS
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
vim.keymap.set("n", "<leader><TAB>", ":bprev<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "sv", ":<C-u>vsplit<CR>", { silent = true })
vim.keymap.set("n", "sp", ":<C-u>split<CR>", { silent = true })
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
vim.keymap.set("n", "p", "]p")
vim.keymap.set("n", "P", "]P")
vim.keymap.set("v", "p", "P")
vim.keymap.set("v", "y", "mzy`z")
vim.keymap.set("n", "<leader>u", "<cmd>copy.<CR>")
vim.keymap.set("n", "<leader>U", "<cmd>copy-1<CR>")
vim.keymap.set("v", "<leader>u", ":copy'<-1<CR>gv")
vim.keymap.set("v", "<leader>U", ":copy'>+0<CR>gv")
vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>")
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
	{ "danielfalk/smart-open.nvim", cmd = "Telescope smart_open" },
	{ "kkharji/sqlite.lua", lazy = true },
	{ "lewis6991/gitsigns.nvim", config = true, event = "BufReadPre" },
	{ "b0o/incline.nvim", event = "UIEnter" },
	{ "neanias/everforest-nvim", event = "VeryLazy" },
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "nvim-tree/nvim-web-devicons", event = "UIEnter" },
	{ "windwp/nvim-autopairs", config = true, event = "InsertEnter" },
	{ "lambdalisue/suda.vim", cmd = { "SudaWrite", "SudaRead" } },
	{ "jghauser/mkdir.nvim", event = "ModeChanged" },
	{ "kevinhwang91/nvim-hlslens", keys = { "n", "N", "*", "#", "g*", "g#" } },
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
	{ "brenoprata10/nvim-highlight-colors", event = "BufReadPost" },
	{ "ysmb-wtsg/in-and-out.nvim", keys = { { "<A-CR>", mode = "i" } } },
	{ "nacro90/numb.nvim", config = true, event = "BufRead" },
	{ "rbtnn/vim-ambiwidth", event = "VeryLazy" },
	{ "vim-jp/vimdoc-ja", ft = "help" },
	{ "MunifTanjim/nui.nvim", event = "VeryLazy" },
	{ "folke/noice.nvim", event = "UIEnter" },

	--non-lazy
	{ "folke/snacks.nvim", priority = 1000, lazy = false },

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

----INCLINE.NVIM
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

				-- gitsigns integration
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
		require("telescope").load_extension("smart_open")
		require("telescope").load_extension("file_browser")
		vim.keymap.set("n", "<leader><leader>h", "<cmd>Telescope help_tags<CR>")
		vim.keymap.set("n", "<leader>y", "<cmd>Telescope registers<CR>")
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

----SNACKS
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
	lazygit = { enabled = false },
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

----NOICE
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

----MODES
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

----DIAL
vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })

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
vim.keymap.set("n", "<ESC>", ":nohl<CR><ESC>", kopts)

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

----NATIVE COMPLETION
vim.api.nvim_create_autocmd("TextChangedI", {
	pattern = "*",
	callback = function()
		if vim.fn.pumvisible() == 0 then
			local col = vim.fn.col(".")
			local line = vim.fn.getline(".")
			local before_cursor = line:sub(1, col - 1)
			if before_cursor:match("%w%w$") then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, false, true), "n")
			end
		end
	end,
})

----IN-AND-OUT
vim.keymap.set("i", "<A-CR>", function()
	require("in-and-out").in_and_out()
end)
