{ ... }: {
  programs.neovim.enable = true;
}

# { pkgs, ... }:
#
# {
#   programs.neovim = {
#     enable = true;
#     defaultEditor = true;
#     viAlias = true;
#     vimAlias = true;
#     vimdiffAlias = true;
#
#     plugins = with pkgs.vimPlugins; [
#       cmp-nvim-lsp
#       luasnip
#       lsp-format-nvim
#       lsp_signature-nvim
#       mason-lspconfig-nvim
#       mason-nvim
#       neodev-nvim
#       nvim-cmp
#       nvim-lspconfig
#       nvim-treesitter.withAllGrammars
#       onedarkpro-nvim
#       tabular
#       telescope-fzf-native-nvim
#       vim-dispatch
#       vim-endwise
#       vim-fugitive
#       vim-nix
#       vim-surround
#       vim-test
#       vim-unimpaired
#       vimux
#
#       {
#         plugin = comment-nvim;
#         type = "lua";
#         config = ''
#           require('Comment').setup()
#         '';
#       }
#
#       {
#         plugin = which-key-nvim;
#         type = "lua";
#         config = ''
#           require('which-key').setup()
#         '';
#       }
#
#       {
#         plugin = lualine-nvim;
#         type = "lua";
#         config = ''
#           require('lualine').setup {
#             options = {
#               icons_enabled = false,
#               theme = 'onedark',
#               component_separators = '|',
#               section_separators = ' ',
#             }
#           }
#         '';
#       }
#
#       {
#         plugin = telescope-nvim;
#         type = "lua";
#         config = ''
#           require('telescope').setup {
#             defaults = {
#               mappings = {
#                 i = {
#                   ['<C-u>'] = false,
#                   ['<C-d>'] = false,
#                 },
#               },
#             },
#            extensions = {
#               fzf = {
#                 fuzzy = true,                    -- false will only do exact matching
#                 override_generic_sorter = true,  -- override the generic sorter
#                 override_file_sorter = true,     -- override the file sorter
#                 case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
#                                                  -- the default case_mode is "smart_case"
#               }
#             }
#           }
#
#           require('telescope').load_extension('fzf')
#
#           vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
#           vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
#           vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
#         '';
#       }
#
#
#       {
#         plugin = telescope-file-browser-nvim;
#         type = "lua";
#         config = ''
#           -- To get telescope-file-browser loaded and working with telescope,
#           -- you need to call load_extension, somewhere after setup function:
#           require("telescope").load_extension "file_browser"
#
#           vim.keymap.set('n', '<leader>fb', ":Telescope file_browser<cr>", { desc = '[F]ile [B]rowser' })
#         '';
#       }
#
#       {
#         plugin = vim-startify;
#         type = "viml";
#         config = ''
#           let g:startify_change_to_dir = 0
#           let g:startify_list_order = ['dir', 'sessions']
#         '';
#       }
#
#       {
#         plugin = vim-better-whitespace;
#         type = "viml";
#         config = ''
#           let g:better_whitespace_operator = ""
#           set list listchars=tab:»·,trail:·
#         '';
#       }
#
#       {
#         plugin = ack-vim;
#         type = "viml";
#         config = ''
#           if executable('rg')
#             " Use Ack with rg
#             let g:ackprg = 'rg --vimgrep --ignore-case'
#
#             " Use rg over Grep
#             set grepprg=rg\ --vimgrep\ --ignore-case
#           endif
#         '';
#       }
#     ];
#
#     extraLuaConfig = ''
#         vim.g.mapleader = ' '
#         vim.g.maplocalleader = ' '
#         -- Show proper colors in terminal
#         vim.o.termguicolors = true
#         vim.cmd.colorscheme 'onedark'
#         -- Share clipboard with MacOS
#         vim.o.clipboard = 'unnamed'
#         -- Set highlight on search
#         vim.o.hlsearch = false
#         -- Make line numbers default
#         vim.wo.number = true
#         -- Enable mouse mode
#         vim.o.mouse = 'a'
#         -- Case insensitive searching UNLESS /C or capital in search
#         vim.o.ignorecase = true
#         vim.o.smartcase = true
#         -- Decrease update time
#         vim.o.updatetime = 250
#         vim.o.timeout = true
#         vim.o.timeoutlen = 500
#         vim.o.ttimeoutlen = 500
#         -- Set completeopt to have a better completion experience
#         vim.o.completeopt = 'menuone,noselect'
#
#         -- Testing
#         vim.g.VimuxOrientation = "v"
#         vim.g.VimuxHeight = "30"
#         vim.g.VimuxUseNearestPane = 1
#         vim.g['test#strategy'] = "neovim"
#
#         vim.keymap.set('n', '<leader>tf', ":TestNearest<cr>", { desc = '[T]est [F]ocused' })
#         vim.keymap.set('n', '<leader>tt', ":TestFile<cr>", { desc = '[T]est from the [T]op' })
#         vim.keymap.set('n', '<leader>tl', ":TestLast<cr>", { desc = '[T]est [L]ast' })
#
#         if os.getenv("TMUX") then
#           vim.g['test#strategy'] = "vimux"
#         end
#
#         -- Treesitter
#         require'nvim-treesitter.configs'.setup {
#           highlight = {
#             enable = true,
#             disable = { },
#           },
#         }
#
#         -- EnMasse
#         vim.keymap.set('n', '<leader>e', ":EnMasse<cr>", { desc = 'R[E]place' })
#
#         -- LSP Format on save
#         require("lsp-format").setup {}
#
#         -- LSP settings.
#         --  This function gets run when an LSP connects to a particular buffer.
#         local on_attach = function(client, bufnr)
#           -- NOTE: Remember that lua is a real programming language, and as such it is possible
#           -- to define small helper and utility functions so you don't have to repeat yourself
#           -- many times.
#
#           -- Format on save
#           require("lsp-format").on_attach(client)
#
#           -- Floating signatures
#           require "lsp_signature".on_attach({
#             bind = true, -- This is mandatory, otherwise border config won't get registered.
#             handler_opts = {
#               border = "rounded"
#             }
#           }, bufnr)
#
#           -- In this case, we create a function that lets us more easily define mappings specific
#           -- for LSP related items. It sets the mode, buffer and description for us each time.
#           local nmap = function(keys, func, desc)
#             if desc then
#               desc = 'LSP: ' .. desc
#             end
#
#             vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
#           end
#
#           nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
#           nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
#
#           nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
#           nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
#           nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
#           nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
#           nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
#           nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
#
#           -- See `:help K` for why this keymap
#           nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
#           nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
#
#           -- Lesser used LSP functionality
#           nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
#           nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
#           nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
#           nmap('<leader>wl', function()
#             print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
#           end, '[W]orkspace [L]ist Folders')
#
#           -- Create a command `:Format` local to the LSP buffer
#           vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
#             vim.lsp.buf.format()
#           end, { desc = 'Format current buffer with LSP' })
#         end
#
#         -- Enable the following language servers
#         --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
#         --
#         --  Add any additional override configuration in the following tables. They will be passed to
#         --  the `settings` field of the server config. You must look up that documentation yourself.
#         local servers = {
#           -- clangd = {},
#           -- gopls = {},
#           -- pyright = {},
#           -- rust_analyzer = {},
#           -- tsserver = {},
#
#           lua_ls = {
#             Lua = {
#               workspace = { checkThirdParty = false },
#               telemetry = { enable = false },
#             },
#           },
#         }
#
#         -- Setup neovim lua configuration
#         require('neodev').setup()
#
#         -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
#         local capabilities = vim.lsp.protocol.make_client_capabilities()
#         capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
#
#         -- Setup mason so it can manage external tooling
#         require('mason').setup()
#
#         -- Ensure the servers above are installed
#         local mason_lspconfig = require 'mason-lspconfig'
#
#         mason_lspconfig.setup {
#           ensure_installed = vim.tbl_keys(servers),
#         }
#
#         mason_lspconfig.setup_handlers {
#           function(server_name)
#             require('lspconfig')[server_name].setup {
#               capabilities = capabilities,
#               on_attach = on_attach,
#               settings = servers[server_name],
#             }
#           end,
#         }
#
#       -- nvim-cmp setup
#       local cmp = require 'cmp'
#       local luasnip = require 'luasnip'
#
#       luasnip.config.setup {}
#
#       cmp.setup {
#         snippet = {
#           expand = function(args)
#             luasnip.lsp_expand(args.body)
#           end,
#         },
#         mapping = cmp.mapping.preset.insert {
#           ['<C-d>'] = cmp.mapping.scroll_docs(-4),
#           ['<C-f>'] = cmp.mapping.scroll_docs(4),
#           ['<C-Space>'] = cmp.mapping.complete {},
#           ['<CR>'] = cmp.mapping.confirm {
#             behavior = cmp.ConfirmBehavior.Replace,
#             select = true,
#           },
#           ['<Tab>'] = cmp.mapping(function(fallback)
#             if cmp.visible() then
#               cmp.select_next_item()
#             elseif luasnip.expand_or_jumpable() then
#               luasnip.expand_or_jump()
#             else
#               fallback()
#             end
#           end, { 'i', 's' }),
#           ['<S-Tab>'] = cmp.mapping(function(fallback)
#             if cmp.visible() then
#               cmp.select_prev_item()
#             elseif luasnip.jumpable(-1) then
#               luasnip.jump(-1)
#             else
#               fallback()
#             end
#           end, { 'i', 's' }),
#         },
#         sources = {
#           { name = 'nvim_lsp' },
#           { name = 'luasnip' },
#         },
#       }
#     '';
#
#   };
#
# }
