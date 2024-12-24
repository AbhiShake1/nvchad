local M = {}
M.lsp = {}

--- collects diagnostics count in open buffers
---@return { errors: number, warnings: number, infos: number }
function M.lsp.collect_diagnostics()
  local allBuffers = vim.api.nvim_list_bufs()

  local cfg = {
    errors = 0,
    warnings = 0,
    infos = 0,
  }
  for _, buf in ipairs(allBuffers) do
    local errors = #vim.diagnostic.get(buf, { severity = "ERROR" })
    local warnings = #vim.diagnostic.get(buf, { severity = "WARN" })
    local infos = #vim.diagnostic.get(buf, { severity = "INFO" })
    local hints = #vim.diagnostic.get(buf, { severity = "HINT" })
    cfg.errors = cfg.errors + errors
    cfg.warnings = cfg.warnings + warnings
    cfg.infos = cfg.infos + infos + hints
  end

  return cfg
end

return M
