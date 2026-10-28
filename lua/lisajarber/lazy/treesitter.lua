return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({})

        -- Install parsers
        require("nvim-treesitter").install({
            "vimdoc", "javascript", "typescript", "c", "lua", "rust",
            "jsdoc", "bash",
        })

        -- Register templ as a custom parser
        vim.treesitter.language.register("templ", "templ")

        -- Enable highlighting and indent per-filetype via autocmd
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "jsdoc", "bash", "templ" },
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
