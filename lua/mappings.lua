require "nvchad.mappings" -- add yours here
local map = vim.keymap.set

-- map("n", "<CapsLock>", "<C-u>", { noremap = true, silent = true })
-- map({ "n", "i", "v", "c", "t" }, "<Esc>", "<Nop>")
-- map({ "n", "i", "v", "c", "t" }, "<Esc>", "<Nop>", { desc = "Remap Esc" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Show hover documentation
map("n", "gk", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true })

-- Jump to definition
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { noremap = true })
map("n", "<leader>d", "<cmd>TSToolsGoToSourceDefinition<cr>", { noremap = false })

-- Open code actions using the default LSP UI
map({ "n", "v" }, "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true })

map("n", "<leader>v", "<cmd>lua require('lsp_lines').toggle()<CR>", { noremap = true })

map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })

map("n", "<leader>w", "<cmd>w<cr>", { noremap = true })

map("v", "rr", "<cmd>SnipRun<cr>", { noremap = true })

map("n", "<A-j>", function()
  vim.diagnostic.goto_next()
end, { noremap = true, silent = true })

map("n", "<A-k>", function()
  vim.diagnostic.goto_prev()
end, { noremap = true, silent = true })

-- harpoon
map("n", "<leader><C-Space>", "<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>")
map("n", "<leader>tu", "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>")
map("n", "<leader>te", "<cmd>lua require('harpoon.term').gotoTerminal(2)<CR>")
map("n", "<leader>cu", "<cmd>lua require('harpoon.term').sendCommand(1, 1)<CR>")
map("n", "<leader>ce", "<cmd>lua require('harpoon.term').sendCommand(1, 2)<CR>")
map("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>")
map("n", "<leader><leader>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
map("n", "<leader>1", "<CMD>lua require('harpoon.ui').nav_file(1)<CR>")
map("n", "<leader>2", "<CMD>lua require('harpoon.ui').nav_file(2)<CR>")
map("n", "<leader>3", "<CMD>lua require('harpoon.ui').nav_file(3)<CR>")
map("n", "<leader>4", "<CMD>lua require('harpoon.ui').nav_file(4)<CR>")
map("n", "<leader>5", "<CMD>lua require('harpoon.ui').nav_file(5)<CR>")
-- end harpoon

-- toggleterm
local Terminal = require("toggleterm.terminal").Terminal
local _v_term = Terminal:new { direction = "vertical" }
local _h_term = Terminal:new { direction = "horizontal" }
local _f_term = Terminal:new { direction = "float" }

map("n", "<A-a>", function()
  _h_term:toggle()
end, { desc = "Terminal toggle 1" })
map("t", "<A-a>", function()
  _h_term:toggle()
end, { desc = "Terminal toggle 1" })

map("n", "<A-s>", function()
  _v_term:toggle()
end, { desc = "Terminal toggle 2" })
map("t", "<A-s>", function()
  _v_term:toggle()
end, { desc = "Terminal toggle 2" })

map("n", "<A-d>", function()
  _f_term:toggle()
end, { desc = "Terminal toggle 3" })
map("t", "<A-d>", function()
  _f_term:toggle()
end, { desc = "Terminal toggle 3" })
-- end toggleterm

--copilot
-- map("i", "<A-a>", 'copilot#Accept("\\<CR>")', { noremap = true, silent = true, expr = true, replace_keycodes = false })
-- map("i", "<A-n>", "copilot#Next()", { noremap = true, silent = true, expr = true, replace_keycodes = false })
-- map("i", "<A-p>", "copilot#Previous()", { noremap = true, silent = true, expr = true, replace_keycodes = false })
-- map("i", "<A-s>", "copilot#Suggest()", { noremap = true, silent = true, expr = true, replace_keycodes = false })
-- vim.g.copilot_no_tab_map = true
--end copilot
--

-- Telescope
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { noremap = true })
map("n", "<leader>fl", "<cmd>Telescope resume<CR>", { noremap = true })
map("n", "<leader>fc", "<cmd>Telescope resume<CR>", { noremap = true })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { noremap = true })

-- noice
map("n", "<leader>fn", "<cmd>NoiceTelescope<CR>", { noremap = true })

-- dap
vim.keymap.set("n", "dc", function()
  require("dap").continue()
end)
-- vim.keymap.set("n", "ds", function()
--   require("dap").step_over()
-- end)
-- vim.keymap.set("n", "di", function()
--   require("dap").step_into()
-- end)
-- vim.keymap.set("n", "do", function()
--   require("dap").step_out()
-- end)
vim.keymap.set("n", "db", function()
  require("dap").toggle_breakpoint()
end)
-- vim.keymap.set("n", "<Leader>B", function()
--   require("dap").set_breakpoint()
-- end)
-- vim.keymap.set("n", "<Leader>lp", function()
--   require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
-- end)
vim.keymap.set("n", "dr", function()
  require("dap").repl.open()
end)
-- vim.keymap.set("n", "dl", function()
--   require("dap").run_last()
-- end)
vim.keymap.set({ "n", "v" }, "dh", function()
  require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "dp", function()
  require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "df", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "dv", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.scopes)
end)
