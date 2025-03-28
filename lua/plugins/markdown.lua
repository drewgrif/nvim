return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    -- Bypass install if npm is not available
    if vim.fn.executable("npm") == 0 then
      print("⚠️ npm or yarn is required for markdown-preview.nvim, installation skipped.")
    else
      vim.fn["mkdp#util#install"]()  -- This will run mkdp#util#install() only if npm/yarn is present
    end
  end,
}


