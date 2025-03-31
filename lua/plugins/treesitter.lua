return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- 🛠 Warn if compilers are missing (for auto-install to succeed)
    if vim.fn.executable("gcc") == 0 or vim.fn.executable("make") == 0 then
      vim.schedule(function()
        vim.notify(
          "⚠️  Tree-sitter: Missing 'gcc' or 'make'. Auto-install may fail for some languages.\nRun: sudo apt install build-essential",
          vim.log.levels.WARN
        )
      end)
    end

    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "bash", "json", "yaml", "markdown", "markdown_inline", "html", "xml", "php"
      },
      auto_install = true,

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },
    })
  end,
}
