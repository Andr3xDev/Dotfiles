---------------------------------------------------------------------------
-- Keybindings to each plugin or flow
---------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- save / close
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file", silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file (insert)", silent = true })
vim.keymap.set("n", "<C-q>", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- splits / windows
vim.keymap.set("n", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Window left", noremap = true })
vim.keymap.set("n", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Window down", noremap = true })
vim.keymap.set("n", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Window up", noremap = true })
vim.keymap.set("n", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Window right", noremap = true })
vim.keymap.set("n", "<leader>=", "<Cmd>vertical resize +5<CR>", { desc = "Resize +5", noremap = true })
vim.keymap.set("n", "<leader>-", "<Cmd>vertical resize -5<CR>", { desc = "Resize -5", noremap = true })

-- buffers
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bl", ":bnext<CR>", { desc = "Next buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bh", ":bprev<CR>", { desc = "Prev buffer", noremap = true, silent = true })

-- lsp actions
vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
vim.keymap.set('n', '<leader>cy', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.references, { desc = 'Find references' })

-- Refactor / edición
vim.keymap.set('n', '<leader>cn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('v', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action (visual)' })

-- Diagnósticos
vim.keymap.set('n', '<leader>ce', vim.diagnostic.open_float, { desc = 'Line diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- Estructura / arquitectura (estos son los que más te van a servir a ti)
vim.keymap.set('n', '<leader>ch', vim.lsp.buf.signature_help, { desc = 'Signature help' })
vim.keymap.set('n', '<leader>cI', vim.lsp.buf.incoming_calls, { desc = 'Incoming calls (callers)' })
vim.keymap.set('n', '<leader>cO', vim.lsp.buf.outgoing_calls, { desc = 'Outgoing calls (callees)' })
vim.keymap.set('n', '<leader>cS', function()
  require('telescope.builtin').lsp_document_symbols()
end, { desc = 'Document symbols' })
vim.keymap.set('n', '<leader>cw', function()
  require('telescope.builtin').lsp_workspace_symbols()
end, { desc = 'Workspace symbols' })

-- inline toggle
vim.keymap.set('n', '<leader>ct', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle inlay hints' })

-- file / find
vim.keymap.set(
  "n",
  "<leader>fH",
  ":Telescope command_history<CR>",
  { desc = "Command history", noremap = true, silent = true }
)

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })

-- git
vim.keymap.set("n", "<leader>gt", ":Telescope git_status<CR>", { desc = "Git status", noremap = true, silent = true })
vim.keymap.set("n", "<leader>gC", ":Telescope git_commits<CR>", { desc = "Git commits", noremap = true, silent = true })

-- search / replace
vim.keymap.set("n", "<leader>sR", function()
  require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
end, { desc = "Search & Replace" })
vim.keymap.set("n", "<leader>sr", function()
  require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
end, { desc = "Search & Replace (current file)" })
vim.keymap.set("v", "<leader>sr", function()
  require("grug-far").with_visual_selection()
end, { desc = "Search & Replace (visual)" })
