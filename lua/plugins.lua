return require('packer').startup(function()
    -- Packer can manage itself
    -- PackerSync
    use 'wbthomason/packer.nvim'
    -- gruvbox theme
    use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }
    -- nightfox
    -- https://github.com/EdenEast/nightfox.nvim
    use "EdenEast/nightfox.nvim"
    -- solarized
    use 'shaunsingh/solarized.nvim'
    -- onedark
    use 'navarasu/onedark.nvim'
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- nvim-tree
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
    -- bufferline
    use({
        "akinsho/bufferline.nvim",
        requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }
    })
    -- lualine
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" }
    })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { "nvim-lua/plenary.nvim" }
    }
    -- telescope extensions
    use "LinArcX/telescope-env.nvim"
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- treesitter
    -- 安装高亮语言: TSInstall python
    -- 卸载高亮语言: TSUninstall python
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- Comment plugin
    use { "tpope/vim-commentary", event = "VimEnter" }
    -- vim-pydocstring
    -- pip install doq
    use("heavenshell/vim-pydocstring")
    -- ui
    use("onsails/lspkind-nvim")
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    -- Automatic insertion and deletion of a pair of characters
    use { "Raimondi/delimitMate", event = "InsertEnter" }
    -- 鼠标移动到关键词高亮
    use { "itchyny/vim-cursorword" }
    -- terminals
    use { "akinsho/toggleterm.nvim", tag = 'v2.*' }
    -- Git command inside vim
    use { "tpope/vim-fugitive" }
    use { "airblade/vim-gitgutter" }
    -- 代码格式化
    -- NullLsInfo
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    -- 函数列表
    use("liuchengxu/vista.vim")
    -- Show undo history visually
    use { "simnalamburt/vim-mundo", cmd = { "MundoToggle", "MundoShow" } }
    --------------------- LSP --------------------
    -- installer
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
    -- Rust
    use 'simrat39/rust-tools.nvim'
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    use {
        "quangnguyen30192/cmp-nvim-ultisnips",
        after = { "nvim-cmp", "ultisnips" }
    }
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use { "SirVer/ultisnips", event = "InsertEnter" }
    -- JSON 增强
    use("b0o/schemastore.nvim")
end)
