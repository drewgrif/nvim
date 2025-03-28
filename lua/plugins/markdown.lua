return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  init = function()
    -- Ensure mkdp#util#install is called when the plugin is loaded
    vim.cmd("call mkdp#util#install()")
  end,
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
