
return {

    -- ColorSchemes
    {
        'rose-pine/neovim',
        name = 'rose-pine'
    },

    -- Telescope (Fuzzy Finder)
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        dependencies = {
            {'nvim-lua/plenary.nvim'},
        }
    },

    {
        'folke/trouble.nvim',
        lazy = true,
        dependencies = {
            { 'nvim-tree/nvim-web-devicons' },
        }
    },

    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
    },

    { "nvim-treesitter/nvim-treesitter", },
    { 'theprimeagen/harpoon' },
    { 'hoob3rt/lualine.nvim' },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },
    { 'folke/which-key.nvim' },
    {
        'folke/neodev.nvim',
         opts = { }
    },

    -- LSP 
     {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-cmdline'},
            {'hrsh7th/cmp-nvim-lua'},
            {'hrsh7th/cmp-nvim-lua'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-vsnip'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/vim-vsnip'},
            {'saadparwaiz1/cmp_luasnip'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    },
}
