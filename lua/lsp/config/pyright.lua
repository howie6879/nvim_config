return {
    on_setup = function(server)
        server.setup({
            flags = { debounce_text_changes = 150 },
            on_attach = function(client, bufnr)
                -- 禁用格式化功能，交给专门插件插件处理
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end

                -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
                -- 绑定快捷键
                require("keybindings").mapLSP(buf_set_keymap)
            end
        })
    end
}
