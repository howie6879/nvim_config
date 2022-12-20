local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", { clear = true })

local autocmd = vim.api.nvim_create_autocmd

-- 进入Terminal 自动进入插入模式
autocmd("TermOpen", { group = myAutoGroup, command = "startinsert" })

-- 保存时自动格式化
autocmd("BufWritePre", {
    group = myAutoGroup,
    pattern = { "*.lua", "*.py", "*.sh", "*.json", "*.md", "*.toml", "*.rs" },
    callback = function() vim.lsp.buf.format() end
})

-- 用o换行不要延续注释
autocmd("BufEnter", {
    group = myAutoGroup,
    pattern = "*",
    callback = function()
        vim.opt.formatoptions =
        vim.opt.formatoptions - "o" -- O and o, don't continue comments
            + "r" -- But do continue when pressing enter.
    end
})
