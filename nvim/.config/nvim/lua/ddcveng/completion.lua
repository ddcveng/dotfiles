local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp', max_item_count = 7 },
        { name = 'vsnip', max_item_count = 7},
        { name = 'path' },
        { name = 'buffer', keyword_length = 5},
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            menu = ({
                buffer = "[buffer]",
                nvim_lsp = "[LSP]",
                vsnip = "[vsnip]",
                path = "[path]",
            })
        }),
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
})
