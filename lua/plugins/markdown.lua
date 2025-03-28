return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }

    -- Initialize the flag to track if the popup has been shown (per session)
    if vim.g.mkdp_popup_shown == nil then
      vim.g.mkdp_popup_shown = false
    end
  end,
  config = function()
    -- Show the popup if npm is missing and plugin hasn't been built yet
    if vim.fn.executable("npm") == 0 and vim.g.mkdp_popup_shown == false then
      vim.schedule(function()
        -- Create the popup with installation instructions
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

        -- Mark the popup as shown for the session to prevent showing it again
        vim.g.mkdp_popup_shown = true
      end)
    end
  end,
}

