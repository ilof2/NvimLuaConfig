local util = require("lspconfig").util

return {
  root_dir = util.root_pattern('.venv', "venv", "pyrightconfig.json"),
  settings = {
    pyright = { disableLanguageServices = false, disableOrganizeImports = true },
    python = {
      analysis = {
        typeCheckingMode = "on",
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}
