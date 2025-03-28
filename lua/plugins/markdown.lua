return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  config = function()
    -- Helper function to check if the plugin has already been built
    local function is_built()
      local build_path = vim.fn.stdpath("data") .. "/lazy/markdown-preview.nvim/app/node_modules"
      return vim.fn.isdirectory(build_path) == 1
    end

    -- Define the marker file path (storing it in the `nvim` data directory)
    local install_marker = vim.fn.stdpath("data") .. "/nvim/.mkdp_installed"

    -- If the marker file exists, skip the installation and popup
    if vim.fn.filereadable(install_marker) == 1 then
      return -- No need to show the popup again if the file exists
    end

    -- Check if `npm` is available and the plugin hasn't been built
    if not is_built() and vim.fn.executable("npm") == 1 then
      vim.schedule(function()
        vim.notify("📦 Building markdown-preview.nvim (first-time setup)...", vim.log.levels.INFO)
        vim.cmd("call mkdp#util#install()")
        
        -- After successful install, create marker file
        -- Ensure the plugin has installed properly before writing the marker
        vim.cmd('autocmd VimEnter * if !filereadable("' .. install_marker .. '") | call mkdp#util#install() | endif')

        -- Once installation completes, write the marker file
        local file = io.open(install_marker, "w") -- Open the file for writing
        if file then
          file:write("") -- Write an empty string to create the file
          file:close() -- Close the file after writing
          print("Marker file created at: " .. install_marker) -- Debug message
        else
          print("Failed to create marker file!") -- Debug message
        end
      end)

    -- If `npm` is missing and the installation hasn't been done, show the popup
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
