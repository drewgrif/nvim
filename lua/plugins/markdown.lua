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

    -- Marker file to track successful installation
    local install_marker = vim.fn.stdpath("config") .. "/.mkdp_installed"
    if vim.fn.filereadable(install_marker) == 1 then
      return -- No popup if marker exists
    end

    -- If npm is available and build hasn't been done, run it once
    if not is_built() and vim.fn.executable("npm") == 1 then
      vim.schedule(function()
        vim.notify("📦 Building markdown-preview.nvim (first-time setup)...", vim.log.levels.INFO)
        vim.cmd("call mkdp#util#install()")
        -- After successful install, create marker file
        vim.fn.writefile({}, install_marker) -- Create the marker file
      end)

    -- If npm is missing and we haven't warned before, show the popup
    elseif vim.fn.executable("npm") == 0 then
      vim.schedule(function()
        local buf = vim.api.nvim_create_buf(false, true)
        local lines = {
          "⚠️ npm is not installed.",
          "To manually install markdown-preview.nvim, run:",
          "",
          ":call mkdp#util#install()",
          "",
          "Please run the command above in Neovim's command line."
        }
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

        local width = 60
        local height = #lines
        local win_opts = {
          relative = "editor",
          width = width,
          height = height,
          col = math.floor((vim.o.columns - width) / 2),
          row = math.floor((vim.o.lines - height) / 2),
          style = "minimal",
          border = "rounded",
        }

        vim.api.nvim_open_win(buf, true, win_opts)
      end)
    end
  end,
}
