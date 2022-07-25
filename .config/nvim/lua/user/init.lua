function CreateNoremapGlobal(type, opts)
    return function(lhs, rhs)
        vim.api.nvim_set_keymap(type, lhs, rhs, opts)
    end
end

function CreateNoremap(type, opts)
    return function(lhs, rhs, bufnr)
        bufnr = bufnr or 0
        vim.api.nvim_buf_set_keymap(bufnr, type, lhs, rhs, opts)
    end
end

NnoremapGlobal = CreateNoremapGlobal("n", { noremap = true })
NnoremapGlobal("<leader>nc",
    "<cmd>:lua require(\"tree-navigation.telescope\").navigate_to(require(\"tree-navigation\").get_class_nodes())<CR>");

Nnoremap = CreateNoremap("n", { noremap = true })
Inoremap = CreateNoremap("i", { noremap = true })

require("user.git-worktree")

require("refactoring.config").setup({
    formatting = {
        typescript = {},
        javascript = {},
    },
})

-- lsp
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>k', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local map = function(type, key, value)
    vim.fn.nvim_buf_set_keymap(0, type, key, value, { noremap = true, silent = true });
end

local on_attach = function(client, bufnr)
    -- DEFAULT LSP_CONFIG MAPPINGS
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<leader>b', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<Leader>mb', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<Leader>n', '<cmd>Telescope lsp_references<CR>', bufopts)
    vim.keymap.set('n', '<Leader>mn', '<cmd>Telescope lsp_implementations<CR>', bufopts)
    vim.keymap.set('n', '<Leader>mR', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>mk', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<Leader>mm', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<Leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<Leader>t', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<Leader><CR>', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<Leader>l', vim.lsp.buf.format, bufopts)
    vim.keymap.set('n', '<Leader>K','<cmd>Telescope diagnostics<CR>', bufopts)
end

local servers = {
    "svelte",
    "kotlin_language_server",
    "rust_analyzer",
    "sumneko_lua",
    "tsserver",
    "marksman",
    "yamlls",
}
local lspconfig = require('lspconfig')
for _, server in ipairs(servers) do
    lspconfig[server].setup {
        on_attach = on_attach
    }
end

-- Lua specific config
lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

require('lualine').setup()
require("nvim-lsp-installer").setup {}
require("autosave").setup()

-- lsp
require("trouble").setup {}
require('lspsaga').init_lsp_saga()
