require("noice").setup {
  bottom_search = true, -- use a classic bottom cmdline for search
  command_palette = true, -- position the cmdline and popupmenu together
  long_message_to_split = true, -- long messages will be sent to a split
  inc_rename = true, -- enables an input dialog for inc-rename.nvim
  lsp_doc_border = false, -- add a border to hover docs and signature help
  lsp = {
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
  },
}
