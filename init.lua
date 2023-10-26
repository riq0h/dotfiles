----GENERAL SETTINGS
local opt = vim.opt
vim.g.mapleader = ' '
opt.helplang = 'ja', 'en'
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.list = true
opt.listchars = {tab='»-', trail='-', eol='↲', extends='»', precedes='«', nbsp='%'}
opt.wrap = true
opt.signcolumn = 'yes'
opt.smartcase = true
opt.ignorecase = true
opt.wrapscan = true
opt.hidden = true
opt.startofline = false
opt.showmatch = true
opt.matchtime = 1
opt.guicursor = ''
opt.cursorline = true
opt.wildmenu = true
opt.number = true
opt.showcmd = true
opt.autoread = true
opt.hlsearch = true
opt.backspace:append{'indent', 'eol', 'start'}
opt.showtabline = 1
opt.laststatus = 3
opt.ambiwidth = 'single'
opt.confirm = true
opt.pumblend = 15
opt.winblend = 15
opt.mouse = 'a'
opt.cmdheight = 2
opt.timeout = true
opt.ttimeout = true
opt.ttimeoutlen = 10
opt.clipboard:append{'unnamedplus'}
opt.termguicolors = true
opt.showmode = false
opt.completeopt:append{'menuone', 'noinsert'}
opt.backup = false
opt.swapfile = false
opt.encoding = 'utf-8'
opt.fileencodings = {'utf-8', 'iso-2022-jp', 'cp932', 'euc-jp', 'sjis'}
vim.opt.shortmess:append('I')
vim.cmd('set completeopt-=preview')


----ADVANCED SETTINGS

--KEEP CURSOR
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
    pattern = { '*' },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})


----KEY MAPPING

--EDIT
vim.keymap.set('n', 'ew', ':<C-u>w<CR>')
vim.keymap.set('n', 'eq', ':<C-u>wq<CR>')
vim.keymap.set('n', 'Q', ':<C-u>quit!<CR>')
vim.keymap.set('n', '<leader>q', ':<C-u>bd<CR>')
vim.keymap.set('n', '<C-s>', ':<C-u>%s///cg<Left><Left><Left><Left>')
vim.keymap.set('n', '<C-c>', ":<C-u>echo wordcount()['chars']<CR>")

--TAB
vim.keymap.set('n', '<leader><TAB>', ':bprev<CR>', {silent = true})
vim.keymap.set('n', '<leader>t', ':tabclose<CR>', {silent = true})
vim.keymap.set('n', ']b', ':bnext<CR>', {silent =true})

--SPLIT
vim.keymap.set('n', 'sv', ':<C-u>vsplit<CR>', {silent = true})
vim.keymap.set('n', 'sp', ':<C-u>split<CR>', {silent =true})

--NOP
vim.keymap.set('n', '<MiddleMouse>', '<Nop>')
vim.keymap.set('n', '<2-MiddleMouse>', '<Nop>')
vim.keymap.set('n', '<3-MiddleMouse>', '<Nop>')
vim.keymap.set('n', '<4-MiddleMouse>', '<Nop>')
vim.keymap.set('i', '<1-MiddleMouse>', '<Nop>')
vim.keymap.set('i', '<2-MiddleMouse>', '<Nop>')
vim.keymap.set('i', '<3-MiddleMouse>', '<Nop>')
vim.keymap.set('i', '<4-MiddleMouse>', '<Nop>')
vim.keymap.set('n', 'qq', '<Nop>')
vim.keymap.set('n', 'gg', '<Nop>')
vim.keymap.set('n', 'ZZ', '<Nop>')
vim.keymap.set('n', 'ZQ', '<Nop>')
vim.keymap.set('n', '<C-z>', '<Nop>')
vim.keymap.set('n', '<F1>', '<Nop>')
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('v', 'x', '"_x')
vim.keymap.set('n', 's', '"_s')

--MOVE
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', '<UP>', 'gk')
vim.keymap.set('n', '<DOWN>', 'gj')
vim.keymap.set('n', 'O', ":<C-u>call append(expand('.'), '')<CR>j")
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', 'sH', '<C-w>H')
vim.keymap.set('n', 'sJ', '<C-w>J')
vim.keymap.set('n', 'sK', '<C-w>K')
vim.keymap.set('n', 'sL', '<C-w>L')

--COPY
vim.keymap.set('n', 'p', ']p')
vim.keymap.set('n', 'P', ']P')
vim.keymap.set('n', ']p', 'p')
vim.keymap.set('n', ']P', 'P')


----PLUGINS

--MANAGER
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
 vim.fn.system({
   'git',
   'clone',
   '--filter=blob:none',
   'https://github.com/folke/lazy.nvim.git',
   '--branch=stable',
   lazypath,
 })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({ 
defaults = {lazy = true},
{'nvim-lualine/lualine.nvim', event = 'VeryLazy'},
{'nvim-telescope/telescope.nvim', cmd = 'Telescope'},
{'nvim-telescope/telescope-file-browser.nvim', event = 'VeryLazy'},
{'lewis6991/gitsigns.nvim', config = true, event = 'VeryLazy'},
{'ryanoasis/vim-devicons', event = 'VeryLazy'},
{'nvim-tree/nvim-web-devicons', event = 'VeryLazy'},
{'williamboman/mason.nvim', event = 'BufRead', cmd = {'Mason', 'MasonInstall'},},
{'neovim/nvim-lspconfig', event = 'LspAttach'},
{'williamboman/mason-lspconfig.nvim', event = 'LspAttach'},
{'mfussenegger/nvim-dap', event = 'LspAttach'},
{'rcarriga/nvim-dap-ui', event = 'LspAttach'},
{'suketa/nvim-dap-ruby', config = true, event = 'LspAttach'},
{'is0n/jaq-nvim', event = 'LspAttach'},
{'j-hui/fidget.nvim', config = true, event = 'LspAttach'},
{'sainnhe/edge', event = 'VeryLazy'},
{'nvim-lua/plenary.nvim', event = 'VeryLazy'},
{'stevearc/dressing.nvim', event = 'VeryLazy'},
{'hrsh7th/nvim-cmp', event = 'VeryLazy'},
{'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter'}, 
{'hrsh7th/cmp-buffer', event = 'InsertEnter'},
{'hrsh7th/cmp-path', event = 'InsertEnter'},
{'hrsh7th/cmp-vsnip', event = 'InsertEnter'},
{'hrsh7th/cmp-cmdline', event = 'ModeChanged'},
{'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertEnter'},
{'hrsh7th/cmp-nvim-lsp-document-symbol', event = 'InsertEnter'},
{'hrsh7th/cmp-calc', event = 'InsertEnter'},
{'onsails/lspkind.nvim', event = 'InsertEnter'},
{'hrsh7th/vim-vsnip', event = 'InsertEnter'},
{'hrsh7th/vim-vsnip-integ', event = 'InsertEnter'},
{'rafamadriz/friendly-snippets', event = 'InsertEnter'},
{'nvim-treesitter/nvim-treesitter', event = 'VeryLazy'},
{'yioneko/nvim-yati', event = 'VeryLazy'},
{'windwp/nvim-autopairs', config = true, event = 'InsertEnter'},
{'andymass/vim-matchup', event = 'VeryLazy'},
{'Maan2003/lsp_lines.nvim', config = true, event = 'VeryLazy'},
{'lambdalisue/suda.vim', cmd = {'SudaWrite', 'SudaRead'},},
{'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {}, event = 'VeryLazy'},
{'kevinhwang91/nvim-hlslens', event = 'VeryLazy'},
{'numToStr/Comment.nvim', config = true, event = 'VeryLazy'},
{'rhysd/clever-f.vim', event = 'VeryLazy'},
{'luochen1990/rainbow', event = 'VeryLazy'},
{'echasnovski/mini.surround', event = 'ModeChanged'},
{'echasnovski/mini.ai', event = 'ModeChanged'},
{'mvllow/modes.nvim', event = 'VeryLazy'},
{'monaqa/dial.nvim', event = 'VeryLazy'},
{'tpope/vim-repeat', event = 'VeryLazy'},
{'nvim-zh/colorful-winsep.nvim', config = true, event = 'WinNew'},
{'vim-jp/vimdoc-ja', ft = 'help'},

--non-lazy
{'vim-denops/denops.vim', lazy = false},
{'yuki-yano/fuzzy-motion.vim', lazy = false},
{'lambdalisue/gin.vim', lazy = false},
{'rbtnn/vim-ambiwidth', lazy = false},
{'lambdalisue/kensaku-search.vim', lazy = false},
{'lambdalisue/kensaku.vim', lazy = false},
{'brenoprata10/nvim-highlight-colors', config = true, lazy = false},

--disable default plugins
 performance = {
    rtp = {
      disable_plugins = {
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'gzip',
        'zip',
        'zipPlugin',
        'tar',
        'tarPlugin',
        'getscript',
        'getscriptPlugin',
        'vimball',
        'vimballPlugin',
        '2html_plugin',
        'logipat',
        'rrhelper',
        'spellfile_plugin',
        'sql_completion',
     },
    },
  },
})


--lualine
require('lualine').setup {
options = {
 icons_enabled = true,
 component_separators = { left = '', right = ''},
 section_separators = { left = '', right = ''},
 disabled_filetypes = {'TelescopePrompt'},
 always_divide_middle = true,
 colored = false,
 globalstatus = true,
 },
 sections = {
  lualine_a = {''},
  lualine_b = {'branch', 'diff'},
  lualine_c = {
   {
    'filename',
    path = 1,
    file_status = true,
    shorting_target = 40,
    symbols = {
    modified = '[+]',
    readonly = '[RO]',
    unnamed = 'Untitled',
    }
   }
  },
  lualine_x = {'filetype'},
  lualine_y = {
   {
    'diagnostics',
    source = {'nvim-lsp'},
     },
   {'progress'},
   {'location'}
    },
  lualine_z = {''}
 },
 inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {'filename'},
  lualine_x = {'location'},
  lualine_y = {},
  lualine_z = {}
 },
 tabline = {},
 extensions = {}
}


--telescope
require('telescope').setup({
  defaults = {
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    color_devicons = true,
    file_ignore_patterns = { 'node_modules', '.git', '.svg', '.npm', 'go' },
    mappings = {
      i = {
    ['<esc>'] = require('telescope.actions').close,
      },
    },
  },
})

vim.keymap.set('n', '<leader>.', '<cmd>Telescope find_files hidden=true<CR>')
vim.keymap.set('n', '<leader>,', '<cmd>Telescope oldfiles<CR>')
vim.keymap.set('n', '<leader>l', '<cmd>Telescope live_grep grep_open_files=true<CR>')
vim.keymap.set('n', '<leader>k', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>f', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>h', '<cmd>Telescope help_tags<CR>')
vim.keymap.set('n', '<leader>y', '<cmd>Telescope registers<CR>')
vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>')
vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>')
vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gx', '<cmd>Telescope diagnostics<CR>') 
vim.keymap.set('n', '<leader>e', '<cmd>Telescope file_browser<CR>')

local fb_actions = require 'telescope'.extensions.file_browser.actions
local previewers = require('telescope.previewers')
local Job = require('plenary.job')
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = 'file',
    args = { '--mime-type', '-b', filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], '/')[1]
      if mime_type == 'text' then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
        end)
      end
    end
  }):sync()
end


--LSP
local on_attach = function(client, bufnr)
 client.server_capabilities.documentFormattingProvider = false
 local set = vim.keymap.set
  set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  set('n', '<leader>1', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  set('n', '<leader>2', '<cmd>lua vim.lsp.buf.rename()<CR>')
  set('n', '<leader>3', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  set('n', '<leader>[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  set('n', '<leaaer>]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  set('n', '<leader>4', '<cmd>lua vim.lsp.buf.format {async = true}<CR>')
  end
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
require('mason').setup()
require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
}


--DAP
local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>5", ":lua require'dap'.continue()<CR>", { silent = true})
map("n", "<leader>6", ":lua require'dap'.step_over()<CR>", { silent = true})
map("n", "<leader>7", ":lua require'dap'.step_into()<CR>", { silent = true})
map("n", "<leader>8", ":lua require'dap'.step_out()<CR>", { silent = true})
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true})
map("n", "<leader>c", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { silent = true})
map("n", "<leader>i", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { silent = true})
map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true})
map("n", "<leader><leader>d", ":lua require'dapui'.eval()<CR>", { silent = true})


---DAP-UI
require('dapui').setup({
	icons = { expanded = '▾', collapsed = '▸', current_frame = '▸' },
	mappings = {
		expand = { '<CR>', '<2-LeftMouse>' },
		open = 'o',
		remove = 'd',
		edit = 'e',
		repl = 'r',
		toggle = 't',
	},
	expand_lines = vim.fn.has('nvim-0.7') == 1,
	layouts = {
		{
			elements = {
				{ id = 'scopes', size = 0.25 },
				'breakpoints',
				'stacks',
				'watches',
			},
			size = 40,
			position = 'left',
		},
		{
			elements = {
				'repl',
			},
			size = 0.25,
			position = 'bottom',
		},
	},
	controls = {
		enabled = true,
		element = 'repl',
		icons = {
			pause = '',
			play = '',
			step_into = '',
			step_over = '',
			step_out = '',
			step_back = '',
			run_last = '↻',
			terminate = '□',
		},
	},
	floating = {
		max_height = nil,
		max_width = nil,
		border = 'single',
		mappings = {
			close = { 'q', '<Esc>' },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil,
		max_value_lines = 100,
	}
})


---jaq-nvim
require('jaq-nvim').setup{
  cmds = {
    internal = {
      lua = 'luafile %',
      vim = 'source %'
    },
    external = {
      markdown = 'glow %',
      python   = 'python3 %',
      go       = 'go run %',
      sh       = 'sh %',
      ruby     = 'ruby %',
    }
  },

  behavior = {
    default     = 'float',
    startinsert = false,
    wincmd      = false,
    autosave    = false
  },

  ui = {
    float = {
      border    = 'none',
      winhl     = 'Normal',
      borderhl  = 'FloatBorder',
      winblend  = 0,
      height    = 0.8,
      width     = 0.8,
      x         = 0.5,
      y         = 0.5
    },

    terminal = {
      position = 'bot',
      size     = 10,
      line_no  = false
    },
    quickfix = {
      position = 'bot',
      size     = 10
    }
  }
}

vim.keymap.set('n', '<leader>j', ':<C-u>Jaq<CR>', { silent = true})


--nvim-cmp
local cmp = require('cmp')
local lspkind = require('lspkind')

 cmp.setup({
   snippet = {
     expand = function(args)
       vim.fn['vsnip#anonymous'](args.body)
     end
   },

   window = {
      completion = cmp.config.window.bordered({
        border = 'single'
    }),
      documentation = cmp.config.window.bordered({
        border = 'single'
    }),
   },

   mapping = cmp.mapping.preset.insert({
     ['<Tab>'] = cmp.mapping.select_next_item(),
     ['<S-Tab>'] = cmp.mapping.select_prev_item(),
     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
     ['<C-f>'] = cmp.mapping.scroll_docs(4),
     ['<C-Space>'] = cmp.mapping.complete(),
     ['<C-e>'] = cmp.mapping.abort(),
     ['<CR>'] = cmp.mapping.confirm({ select = true }),
   }),

   formatting = {
     format = lspkind.cmp_format({
       mode = 'symbol',
       maxwidth = 50,
       ellipsis_char = '...',
     })
   },
 
   sources = cmp.config.sources({
     { name = 'nvim_lsp' },
     { name = 'vsnip' },
     { name = 'nvim_lsp_signature_help' },
     { name = 'calc' },
    }, {
     { name = 'buffer', keyword_length = 2 },
    })
  })

 cmp.setup.cmdline({ '/', '?' }, {
   mapping = cmp.mapping.preset.cmdline(),
   sources = cmp.config.sources({
  { name = 'nvim_lsp_document_symbol' }
  }, {
   { name = 'buffer' }
  })
 })

 cmp.setup.cmdline(':', {
 mapping = cmp.mapping.preset.cmdline(),
 sources = cmp.config.sources({
   { name = 'path' }
  }, {
   { name = 'cmdline', keyword_length = 2 }
  })
 })

local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.cmd('let g:vsnip_filetypes = {}')


--nvim-treesitter 
require'nvim-treesitter.configs'.setup {
   highlight = {
       enable = true,
       disable = {'help', 'markdown', 'toml'},
   },
   refactor = {
    highlight_defintions = {
       enable = true,
     },
   },
   yati = {
    enable = true,
    },
   matchup = {
    enable = true,
    enable_quotes = true,
    },
   ensure_installed = 'all'
}


--dressing
require('dressing').setup({
  input = {
    border = 'single',
  },
  builtin = {
    border = 'single',
  },
})


--modes
require('modes').setup({
  colors = {
	copy = '#FFEE55',
	delete = '#DC669B',
	insert = '#55AAEE',
	visual = '#DD5522',
 },
})


--colorful-winsep
require('colorful-winsep').setup({
  highlight = {
    bg = '',
    fg = '#E8AEAA',
  },
})


--nvim-hlslens 
require('hlslens').setup()
local kopts = {noremap = true, silent = true}

vim.keymap.set('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.keymap.set('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.keymap.set('n', '*', [[*<cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set('n', '#', [[#<cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set('n', 'g*', [[g*<cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set('n', 'g#', [[g#<cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set('n', '<ESC>', ':nohl<CR><ESC>', kopts)


--fuzzy-motion
vim.keymap.set('n', 'S', '<cmd>FuzzyMotion<CR>')
vim.cmd("let g:fuzzy_motion_matchers = ['kensaku', 'fzf']")


--kensaku-search
vim.keymap.set('c', '<CR>', '<Plug>(kensaku-search-replace)<CR>')


--clever-f
vim.cmd('let g:clever_f_across_no_line = 1')
vim.cmd('let g:clever_f_ignore_case = 1')
vim.cmd('let g:clever_f_smart_case = 1')
vim.cmd("let g:clever_f_chars_match_any_signs = ';'")
vim.cmd('let g:clever_f_use_migemo = 1')


--mini.surround
require('mini.surround').setup({
   mappings = {
    highlight = 'sx', 
  },
   custom_surroundings = {
     ['{'] = {
     input = { '%b{}', '^.().*().$' },
     output = { left = '{', right = '}' },
   },
   ['}'] = {
     input = { '%b{}', '^.%{().*()%}.$' },
     output = { left = '{{', right = '}}' },
   },
   ['('] = {
     input = { '%b()', '^.().*().$' },
     output = { left = '(', right = ')' },
   },
   [')'] = {
     input = { '%b()', '^.%(().*()%).$' },
     output = { left = '((', right = '))' },
   },
   ['['] = {
     input = { '%b[]', '^.().*().$' },
     output = { left = '[', right = ']' },
   },
   [']'] = {
     input = { '%b[]', '^.%[().*()%].$' },
     output = { left = '[[', right = ']]' },
   },
   ['<'] = {
     input = { '%b<>', '^.().*().$' },
     output = { left = '<', right = '>' },
   },
   ['>'] = {
     input = { '%b[]', '^.<().*()>.$' },
     output = { left = '<<', right = '>>' },
   },
   ['j'] = {
     input = function()
       local ok, val = pcall(vim.fn.getchar)
       if not ok then return end
       local char = vim.fn.nr2char(val)

       local dict = {
         ['('] = { '（().-()）' },
         ['{'] = { '｛().-()｝' },
         ['['] = { '「().-()」' },
         [']'] = { '『().-()』' },
         ['<'] = { '＜().-()＞' },
         ['"'] = { '”().-()”' },
       }

      if char == 'b' then
         local ret = {}
         for _, v in pairs(dict) do table.insert(ret, v) end
         return { ret }
       end

       if dict[char] then return dict[char] end

       error('%s is unsupported surroundings in Japanese')
     end,
     output = function()
       local ok, val = pcall(vim.fn.getchar)
       if not ok then return end
       local char = vim.fn.nr2char(val)

       local dict = {
         ['('] = { left = '（', right = '）' },
         ['{'] = { left = '｛', right = '｝' },
         ['['] = { left = '「', right = '」' },
         [']'] = { left = '『', right = '』' },
         ['<'] = { left = '＜', right = '＞' },
         ['"'] = { left = '”', right = '”' },
       }

       if not dict[char] then error('%s is unsupported surroundings in Japanese') end

       return dict[char]
     end
  }
 },
})


--mini.ai
require('mini.ai').setup({
   custom_textobjects = {
   ['{'] = { '%b{}', '^.().*().$' },
   ['}'] = { '%b{}', '^.%{().*()%}.$' },
   ['('] = { '%b()', '^.().*().$' },
   [')'] = { '%b()', '^.%(().*()%).$' },
   ['['] = { '%b[]', '^.().*().$' },
   [']'] = { '%b[]', '^.%[().*()%].$' },
   [''] = { '%b<', '^.().*().$' },
   ['>'] = { '%b', '^.().*().$' },
   ['j'] = function()
      local ok, val = pcall(vim.fn.getchar)
      if not ok then return end
      local char = vim.fn.nr2char(val)

      local dict = {
        ['('] = { '（().-()）' },
        ['{'] = { '｛().-()｝' },
        ['['] = { '「().-()」' },
        [']'] = { '『().-()』' },
        ['<'] = { '＜().-()＞' },
        ['"'] = { '”().-()”' },
      }

      if char == 'b' then
          local ret = {}
          for _, v in pairs(dict) do table.insert(ret, v) end
          return { ret }
        end

      if dict[char] then return dict[char] end

      error('%s is unsupported textobjects in Japanese')
  end
 }
})


--rainbow
vim.cmd('let g:rainbow_active = 1')
vim.cmd("let g:indent_guides_exclude_filetypes = ['help']")


--dial 
vim.keymap.set('n', '<C-a>', require('dial.map').inc_normal(), {noremap = true})
vim.keymap.set('n', '<C-x>', require('dial.map').dec_normal(), {noremap = true})
vim.keymap.set('v', '<C-a>', require('dial.map').inc_visual(), {noremap = true})
vim.keymap.set('v', '<C-x>', require('dial.map').dec_visual(), {noremap = true})
vim.keymap.set('v', 'g<C-a>', require('dial.map').inc_gvisual(), {noremap = true})
vim.keymap.set('v', 'g<C-x>', require('dial.map').dec_gvisual(), {noremap = true})


--gin
vim.keymap.set('n', '<leader>gs', ':<C-u>GitStatus<CR>', {silent = true})
vim.keymap.set('n', '<leader>ga', ':<C-u>Gin add .<CR>', {silent = true})
vim.keymap.set('n', '<leader>gc', ":<C-u>Gin commit -m ")
vim.keymap.set('n', '<leader>gp', ':<C-u>Gin push<CR>')


--OTHER SETTINGS
vim.cmd('colorscheme edge')
