return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- auto-update when installing via Lazy
  event = { "BufReadPost", "BufNewFile" }, -- lazy-load when files are opened
  config = function()
    -- Avoid "Press ENTER" issues
    vim.opt.shortmess:append("I")
    vim.opt.confirm = false
    vim.opt.more = false

    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query",
        "python", "rasi", "bash", "cpp", "json", "yaml", "css",
        "markdown", "markdown_inline",
      },
      auto_install = true, -- installs missing parsers automatically

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })

    -- Optional: one-time parser sync on startup (avoids manual :TSInstall)
    vim.api.nvim_create_autocmd("BufEnter", {
      once = true,
      callback = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
    })
  end,
}
