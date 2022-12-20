local status, mason = pcall(require, "mason")
if not status then
    vim.notify("没有找到 mason")
    return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
    vim.notify("没有找到 mason-lspconfig")
    return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
    vim.notify("没有找到 lspconfig")
    return
end

-- :h mason-default-settings
-- ~/.local/share/nvim/mason
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mason_config.setup({
    ensure_installed = {
        -- https://github.com/python-lsp/python-lsp-server
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp
        "pylsp",
        -- https://github.com/williamboman/mason.nvim/blob/main/PACKAGES.md#rust-analyzer
        "rust_analyzer",
        "taplo",
        -- https://github.com/williamboman/mason.nvim/blob/main/PACKAGES.md#json-lsp
        -- npm i -g vscode-langservers-extracted
        -- npm i -g prettier
        -- npm i -g fixjson
        "jsonls",
        "yamlls",
    }
})

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
    pylsp = require("lsp.config.pylsp"),
    jsonls = require("lsp.config.json"),
    rust_analyzer = require("lsp.config.rust"),
    taplo = require("lsp.config.taplo"), -- toml
    yamlls = require("lsp.config.yamlls"),
}

for name, config in pairs(servers) do
    if config ~= nil and type(config) == "table" then
        -- 自定义初始化配置文件必须实现on_setup 方法
        config.on_setup(lspconfig[name])
    else
        -- 使用默认参数
        lspconfig[name].setup({})
    end
end

require("lsp.ui")
