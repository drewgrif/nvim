return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }

    -- Run the installation process after the plugin is loaded
    vim.defer_fn(function()
      vim.cmd("call mkdp#util#install()")
    end, 0)  -- Defer the installation to the next event loop cycle
  end,
}
