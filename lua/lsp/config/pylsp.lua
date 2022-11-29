local common = require("lsp.common-config")
local opts = {
    capabilities = common.capabilities,
    flags = common.flags,
    on_attach = function(client, bufnr)
        common.disableFormat(client)
        common.keyAttach(bufnr)
    end,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = { ignore = { 'W391', 'E231', 'E203' }, maxLineLength = 120 }
                -- pycodestyle =  { enabled = false },
                -- pyflakes =  { enabled = false },
                -- pylint =  { enabled = false }
            }
        }
    }
}

return { on_setup = function(server) server.setup(opts) end }
