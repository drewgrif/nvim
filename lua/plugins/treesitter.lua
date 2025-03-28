return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- async but stable
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- Optional: warn if missing compiler
    if vim.fn.executable("gcc") == 0 or vim.fn.executable("make") == 0 then
      vim.schedule(function()
        vim.notify("⚠️  Tree-sitter may fail to compile parsers: missing gcc/make", vim.log.levels.WARN)
      end)
    end

    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query",
        "python", "rasi", "bash", "cpp", "json", "yaml", "css",
        "markdown", "markdown_inline",
      },
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },
    })
  end,
}
