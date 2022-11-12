require('lsp-setup').setup({
    servers = {
        -- pylsp = {
        --     plugins = {
        --         pycodestyle = {
        --           ignore = {'W391'},
        --           maxLineLength = 120
        --         },
        --         pylint =  { enabled = false }
        --       }
        -- }
        pylsp = require("lsp.config.pylsp")
    }
})
