require "helpers/globals"
require "helpers/keyboard"

g.mapleader = ' '                                                                 -- Use Space, like key for alternative hotkeys

-- LSP {{{
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>' )                                      -- Hover object
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')                                -- Code actions
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')                                     -- Rename an object
nm('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')                                -- Go to declaration
 -- }}}

-- Telescope {{{
nm('gd', '<cmd>Telescope lsp_definitions<CR>')                                    -- Goto declaration
nm('tp', '<cmd>Telescope oldfiles<CR>')                                   -- Show recent files
nm('to', '<cmd>Telescope git_files<CR>')                                  -- Search for a file in project
nm('ti', '<cmd>Telescope jumplist<CR>')                                   -- Show jumplist (previous locations)
nm('tO', '<cmd>Telescope find_files<CR>')                                 -- Search for a file (ignoring git-ignore)
nm('tb', '<cmd>Telescope git_branches<CR>')                               -- Show git branches
nm('tf', '<cmd>Telescope live_grep<CR>')                                  -- Find a string in project
nm('tq', '<cmd>Telescope buffers<CR>')                                    -- Show all buffers
nm('ta', '<cmd>Telescope<CR>')                                            -- Show all commands
nm('tt', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')              -- Search for dynamic symbols
-- }}}

-- Trouble {{{
nm('<leader>x', '<cmd>TroubleToggle<CR>')                                         -- Show all problems in project (with help of LSP)
nm('gr', '<cmd>Trouble lsp_references<CR>')                                       -- Show use of object in project
-- }}}

-- Neo Tree {{{
nm('<leader>v', '<cmd>NeoTreeFocusToggle<CR>')                                        -- Toggle file explorer
-- }}}

-- vim-fugitive {{{

nm('<leader>gs', '<cmd>G<CR>')
nm('<leader>gp', '<cmd>Git push<CR>')
nm('<leader>gP', '<cmd>Git pull<CR>')
nm('<leader>gj', '<cmd>diffget //3<CR>')
nm('<leader>gf', '<cmd>diffget //2<CR>')
nm('<leader>gd', '<cmd>Git diff<CR>')
--- }}}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
