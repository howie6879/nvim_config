return {
    on_setup = function(server)
      server.setup({
        flags = {
          debounce_text_changes = 150,
        },
        settings = {
          pylsp = {
            plugins = {
              -- pycodestyle = {
              --   ignore = {'W391', 'E501'},
              --   maxLineLength = 120
              -- },
              -- pycodestyle =  { enabled = false },
              -- pyflakes =  { enabled = false },
              -- pylint =  { enabled = false }
            }
          }
        },
        on_attach = function(client, bufnr)
          -- 禁用格式化功能，交给专门插件插件处理
          if vim.fn.has("nvim-0.8") == 1 then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          else
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
          end
  
          local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
          end
          -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
          -- 绑定快捷键
          require("keybindings").mapLSP(buf_set_keymap)
        end,
      })
    end,
  }
