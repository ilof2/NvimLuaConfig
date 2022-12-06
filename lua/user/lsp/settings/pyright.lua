local util = require("lspconfig").util

return {
  root_dir = util.root_pattern('.venv', "venv", "pyrightconfig.json", ".git"),
  on_new_config = function(config, root_dir)
    local env = vim.trim(vim.fn.system('cd "' .. root_dir .. '"; poetry env info -p 2>/dev/null'))
    if string.len(env) > 0 then
      config.settings.python.pythonPath = env .. '/bin/python'
    end
  end,
  settings = {
    pyright = { disableLanguageServices = false, disableOrganizeImports = true },
    python = {
      analysis = {
        autoSearchPaths = true,
        typeCheckingMode = "basic",
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}
