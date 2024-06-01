-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "ayu_dark",
  tabufline = {
    order = { "treeOffset", "buffers", "tabs", "btns", "abc" },
    modules = {
      abc = function()
        return "Thou code shall not work!!"
      end,
    },
  },
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
    formatting = {
      format = require("lspkind").cmp_format {
        mode = "symbol",
        max_width = 50,
        symbol_map = { Supermaven = "" },
      },
    },
  },
  sources = {
    { name = "supermaven" },
  },
  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    order = nil,
    modules = nil,
  },
  nvdash = {
    load_on_startup = true,

    header = {
      "           ▄ ▄                   ",
      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

local function has_lsp_errors()
  local bufnr = vim.api.nvim_get_current_buf()
  local method = "textDocument/diagnostic"
  local params = {
    textDocument = vim.lsp.util.make_text_document_params(),
  }
  local diagnostics = vim.lsp.buf_request_sync(bufnr, method, params)

  return diagnostics and #diagnostics == 0
end

local function reload_if_has_lsp_errors()
  if has_lsp_errors() then
    M.ui.tabufline.modules = {
      -- You can add your custom component
      abc = function()
        return "thou code shall not work!!"
      end,
    }
  else
    M.ui.tabufline.modules = {
      -- You can add your custom component
      abc = function()
        return ""
      end,
    }
  end
end

-- vim.cmd [[autocmd BufWritePost * lua reload_if_has_lsp_errors()]]

return M
