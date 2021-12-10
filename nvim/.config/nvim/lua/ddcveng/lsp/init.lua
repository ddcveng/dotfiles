local lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')
--local completion = require('completion')
local pid = vim.fn.getpid()
--local nvim_status = require('lsp-status')
--local status = require("ddcveng.lsp.status")
--status.activate()

local mapper = function(mode, key, result)
  local opts = { noremap = true, silent = true }
  -- 0 is current buffer
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", opts)
end

local custom_attach = function(client, bufnr)
    --completion.on_attach(client, bufnr) --???
    --nvim_status.on_attach(client)
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- key mappings
    mapper('n', 'gd', 'vim.lsp.buf.definition()')
    mapper('n', 'gD', 'vim.lsp.buf.declaration()')
    mapper('n', 'gr', 'vim.lsp.buf.references()')
    --mapper('n', '<leader>h', 'vim.lsp.buf.hover()')
    --mapper('n', '<leader>dn', 'vim.lsp.diagnostic.goto_next()')
    --mapper('n', '<leader>dp', 'vim.lsp.diagnostic.goto_prev()')
    --mapper('n', '<leader>cw', 'vim.lsp.buf.rename()')


    --if client.resolved_capabilities.document_highlight then
    --  nvim_exec [[
    --    augroup lsp_document_highlight
    --      autocmd! * <buffer>
    --      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --    augroup END
    --  ]]
    --end

    -- Format on save
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
    end

    protocol.CompletionItemKind = {
        '', -- Text
        '', -- Method
        '', -- Function
        '', -- Constructor
        '', -- Field
        '', -- Variable
        '', -- Class
        'ﰮ', -- Interface
        '', -- Module
        '', -- Property
        '', -- Unit
        '', -- Value
        '', -- Enum
        '', -- Keyword
        '﬌', -- Snippet
        '', -- Color
        '', -- File
        '', -- Reference
        '', -- Folder
        '', -- EnumMember
        '', -- Constant
        '', -- Struct
        '', -- Event
        'ﬦ', -- Operator
        '', -- TypeParameter
      }
end
local updated_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())



-- vim.lsp.protocol.make_client_capabilities()



updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
--updated_capabilities = vim.tbl_deep_extend("keep", updated_capabilities, nvim_status.capabilities)
--updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }
--updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
--updated_capabilities.textDocument.completion.completionItem.resolveSupport = {
--  properties = {
--    "documentation",
--    "detail",
--    "additionalTextEdits",
--  },
--}

local omnisharp_bin = "/home/ddcveng/build/omnisharp/run"
lsp.omnisharp.setup {
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
        debounce_text_changes = 50,
    },
}

lsp.clangd.setup{
    cmd = { "clangd", 
            "--background-index", 
            "--query-driver=/opt/mff-nswi004//bin/mipsel-linux-gnu-gcc",
            "--log=verbose",
        },
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
        debounce_text_changes = 50,
    },
}

lsp.pyright.setup{}

lsp.cssls.setup {
  capabilities = capabilities,
}

lsp.html.setup {
  capabilities = capabilities,
}

