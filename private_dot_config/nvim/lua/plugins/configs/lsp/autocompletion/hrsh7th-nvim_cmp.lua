local function config()
    local cmp = require('cmp')
    local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

    require("cmp_nvim_ultisnips").setup{}

    cmp.setup({
        snippet = {
            expand = function(args)
              vim.fn["UltiSnips#Anon"](args.body)
            end,
          },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
        mapping = cmp.mapping.preset.insert({
            ['<Tab>'] = cmp.mapping.select_next_item({
                behavior = cmp.SelectBehavior.Insert
            }),
            ['<S-Tab>'] = cmp.mapping.select_prev_item({
                behavior = cmp.SelectBehavior.Insert
            }),

            -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
            -- ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({select = true})
        }),
      sources = cmp.config.sources({{name = 'nvim_lsp'}, { name = "ultisnips" }, {name = 'buffer'}, })
    })

    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({{name = 'git'}}, {{name = 'buffer'}})
    })

    cmp.setup.cmdline({'/', '?'}, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {{name = 'buffer'}}
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}}),
        matching = { disallow_symbol_nonprefix_matching = false },
    })
end

local function opts() end

return 
{{
    "SirVer/ultisnips",
    config = function()
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
      vim.g.UltiSnipsEditSplit = "tabdo"
      vim.g.UltiSnipsSnippetDirectories = {
        "~/.config/nvim/UltiSnips", "UltiSnips"
      }
    end,
    -- event = "InsertEnter",
  },{
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = config,
    -- opts = opts
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- LSP completion source for nvim-cmp
        "hrsh7th/cmp-buffer", -- Buffer completion source for nvim-cmp
        "hrsh7th/cmp-path", -- Path completion source for nvim-cmp
        "hrsh7th/cmp-cmdline", -- Command-line completion source for nvim-cmp
        "hrsh7th/nvim-cmp", -- Completion plugin

        "quangnguyen30192/cmp-nvim-ultisnips",
        "honza/vim-snippets",
    }
}
}