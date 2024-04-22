local function setup_keymaps(client, bufnr)
  local keymap = vim.keymap
  local opts = { silent = true, noremap = true }
  opts.buffer = bufnr

  keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
  keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
  keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
  keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

  keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
  keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
  keymap.set("n", "gl", vim.diagnostic.open_float, opts)
  keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts)
  keymap.set("n", "gh", vim.lsp.buf.hover, opts)

  keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

  keymap.set("n", "<leader>lH", function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
  end, opts)
end

local function setup_signs()
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "folke/neodev.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local on_attach = function(client, bufnr)
      setup_keymaps(client, bufnr)

      if client.supports_method("textDocument/inlayHint") then
        vim.lsp.inlay_hint.enable(bufnr, true)
      end
    end

    setup_signs()

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- diagnostic config
    vim.diagnostic.config({
      virtual_text = false,
    })

    local servers = {
      "lua_ls",
      "tsserver",
    }

    for _, server in pairs(servers) do
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      local settings = require("mathstylish.plugins.lsp.lsp_servers." .. server)
      opts = vim.tbl_deep_extend("force", settings, opts)

      if server == "lua_ls" then
        require("neodev").setup({})
      end

      lspconfig[server].setup(opts)
    end
  end,
}
