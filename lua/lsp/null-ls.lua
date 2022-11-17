local status, null_ls = pcall(require, "null-ls")
if not status then
    vim.notify("没有找到 null-ls")
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    debug = false,
    sources = {
        -- Formatting ---------------------
        --  brew install shfmt
        formatting.shfmt, -- StyLua
        formatting.stylua, -- frontend
        formatting.prettier.with({ -- 比默认少了 markdown
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "css",
                "scss",
                "less",
                "html",
                "json",
                "yaml",
                "graphql"
            },
            prefer_local = "node_modules/.bin"
        }),
        -- rustfmt
        formatting.rustfmt,

        -- json
        -- npm i -g fixjson
        formatting.fixjson,

        -- python
        formatting.isort,
        formatting.black,
        -- formatting.black.with({ extra_args = { "--fast" } }),
        -- formatting.black.with({ args = { "--quiet", "-" }, extra_args = { "--line-length", "120" } }),

        diagnostics.eslint.with({
            prefer_local = "node_modules/.bin",
        }),
        -- code actions ---------------------
    },
    -- #{m}: message
    -- #{s}: source name (defaults to null-ls if not specified)
    -- #{c}: code (if available)
    diagnostics_format = "[#{s}] #{m}",
    on_attach = function(_)
        vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
        -- if client.resolved_capabilities.document_formatting then
        --   vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        -- end
    end,

    -- on_attach = function(client)
    --     if client.server_capabilities.document_formatting then
    --         vim.cmd(
    --             "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
    --     end
    -- end
})
