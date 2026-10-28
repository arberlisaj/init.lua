return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({})

        -- Install parsers
        require("nvim-treesitter").install({
            "vimdoc", "javascript", "typescript", "tsx", "c", "lua", "rust",
            "jsdoc", "bash",
        })

        -- Enable highlighting and indent per-filetype via autocmd
        -- (filetype names, not parser names: e.g. sh uses the bash parser)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "c", "lua", "rust", "sh" },
            callback = function()
                -- Fails if the parser is missing (e.g. still installing on first launch)
                if pcall(vim.treesitter.start) then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end
}
