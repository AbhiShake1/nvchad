require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

vim.g.neovide_window_blurred = true
vim.g.neovide_transparency = 0.8
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
-- vim.o.guifont = "FreeMono:h15"
vim.g.neovide_scale_factor = 0.8
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_fullscreen = true
vim.g.nvimtree_side = "right"
vim.g.neovide_underline_stroke_scale = 1.0
vim.g.neovide_theme = "dark"
vim.g.experimental_layer_grouping = true
vim.g.neovide_refresh_rate = 60
vim.g.neovide_no_idle = true

vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", { fg = "#6CC644" })
