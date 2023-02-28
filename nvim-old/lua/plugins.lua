return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.api.nvim_command([[
      augroup ChangeBackgroudColour
      autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
      augroup END
      ]]     )
            -- load the colorscheme here
            vim.cmd([[colorscheme kanagawa]])
        end,
        vim.api.nvim_command([[
      autocmd ColorScheme * highlight LineNr guifg=#C34043
      ]] ),
    },
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/which-key.nvim",
    {
        "catppuccin/nvim",
        name = "catppuccin",
        event = "VeryLazy",
    },
    { "EdenEast/nightfox.nvim", event = "VeryLazy" },
    {
        "ellisonleao/gruvbox.nvim",
        event = "VeryLazy",
        config = function()
            require("gruvbox").setup({
                contrast = "hard",
            })
        end,
    },
    {
        "mbbill/undotree",
        cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" },
    },
    { "NvChad/nvim-colorizer.lua", ft = { "css" } },
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
}
