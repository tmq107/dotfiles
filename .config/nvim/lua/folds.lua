_G._fold_go = function()
    local line = vim.fn.getline(vim.v.lnum)
    if line:match("^func%s") or line:match("^type%s.+struct%s*{") or line:match("^type%s.+interface%s*{") then
        return ">1"
    end
    if line:match("^}") then return "<1" end
    return "="
end

_G._fold_python = function()
    local line = vim.fn.getline(vim.v.lnum)
    if line:match("^%s*def%s") or line:match("^%s*async%s+def%s") or line:match("^%s*class%s") then
        return ">1"
    end
    return "="
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "go", "gomod", "gowork", "python" },
    callback = function(args)
        vim.opt_local.foldmethod = "expr"
        if vim.bo[args.buf].filetype == "python" then
            vim.opt_local.foldexpr = "v:lua._fold_python()"
        else
            vim.opt_local.foldexpr = "v:lua._fold_go()"
        end
    end,
})
