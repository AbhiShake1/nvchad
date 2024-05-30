require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Show hover documentation
map("n", "gk", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true })

-- Jump to definition
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { noremap = true })

-- Open code actions using the default LSP UI
map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true })

map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })

map("n", "<leader>w", "<cmd>w<cr>", { noremap = true })

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

map("n", "<A-3>", function()
  require("nvchad.term").toggle { pos = "sp", id = "abc" }
end, { desc = "Terminal toggle floating" })

--copilot
map("i", "<A-a>", 'copilot#Accept("\\<CR>")', { noremap = true, silent = true, expr = true, replace_keycodes = false })
map("i", "<A-n>", "copilot#Next()", { noremap = true, silent = true, expr = true, replace_keycodes = false })
map("i", "<A-p>", "copilot#Previous()", { noremap = true, silent = true, expr = true, replace_keycodes = false })
map("i", "<A-s>", "copilot#Suggest()", { noremap = true, silent = true, expr = true, replace_keycodes = false })
vim.g.copilot_no_tab_map = true
--end copilot
