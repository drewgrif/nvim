return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  config = function()
    local function is_built()
      local build_path = vim.fn.stdpath("data") .. "/lazy/markdown-preview.nvim/app/node_modules"
      return vim.fn.isdirectory(build_path) == 1
    end

    -- If npm is available and build hasn't been done, run it once
    if not is_built() and vim.fn.executable("npm") == 1 then
      vim.schedule(function()
        print("📦 Building markdown-preview.nvim (first-time setup)...")
        vim.cmd("call mkdp#util#install()")
      end)
    elseif vim.fn.executable("npm") == 0 then
      vim.schedule(function()
        print("⚠️  npm not found. Markdown preview won't work until it's installed.")
      end)
    end
  end,
}
