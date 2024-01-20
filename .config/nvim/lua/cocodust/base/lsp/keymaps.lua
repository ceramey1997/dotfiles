local M = {}

M._keys = nil

function M.get()
  M._keys = M._keys
    or {
      {
        "n",
        "gd",
        function()
          vim.lsp.buf.definition()
        end,
        { desc = "[G]oto [D]efinition" },
      },
      {
        "n",
        "gi",
        function()
          require("telescope.builtin").lsp_implementations()
        end,
        { desc = "[G]oto [I]mplementation" },
      },
      { -- NOT SURE WHAT THIS ONE DOES
        "n",
        "K",
        function()
          vim.lsp.buf.hover()
        end,
        { desc = "LSP Hover" },
      },
      {
        "n",
        "<leader>sd",
        function()
          require("telescope.builtin").diagnostics()
        end,
        { desc = "[S]earch [D]iagnostics" },
      },
      {
        "n",
        "<leader>dd",
        function()
          vim.diagnostic.open_float(nil, { focus = false })
        end,
        { desc = "[D]isplay [D]iagnostics" },
      },
      {
        "n",
        "[d",
        function()
          vim.diagnostic.goto_next()
        end,
        { desc = "Goto Next diagnostic" },
      },
      {
        "n",
        "]d",
        function()
          vim.diagnostic.goto_prev()
        end,
        { desc = "Goto Previous diagnostic" },
      },
      {
        "n",
        "<leader>ca",
        function()
          vim.lsp.buf.code_action()
        end,
        { desc = "[C]ode [A]ction" },
      },
      {
        "n",
        "<leader>sr",
        function()
          require("telescope.builtin").lsp_references()
        end,
        { desc = "[S]earch [R]eferences" },
      },
      {
        "n",
        "<leader>ss",
        function()
          require("telescope.builtin").lsp_document_symbols()
        end,
        { desc = "[S]earch [S]ymbols" }
      },
      {
        "n",
        "<leader>rn",
        function()
          vim.lsp.buf.rename()
        end,
        { desc = "[R]e [N]ame" },
      },
      {
        { "i", "n" },
        "<F4>",
        function()
          vim.lsp.buf.signature_help()
        end,
        { desc = "Method Signature Help" },
      },
      { "n", "<leader>cp", "<cmd>LspInfo<CR>", { desc = "[C]heck ls[P]" } },
    }
    return M._keys
end

function M.on_attach(client, bufnr)
  for _, mapping in ipairs(M.get()) do
    local opts = { silent = true, buffer = bufnr, remap = false }
    opts = vim.tbl_deep_extend("force", opts, mapping[4])
    vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
  end
end

return M
