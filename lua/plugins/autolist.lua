return 
  -- Autolist continuation for lists and checkboxes
  {
    "gaoDean/autolist.nvim",
    ft = { "markdown", "text", "tex" },
    config = function()
      require("autolist").setup()

      vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<CR>")
      vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<CR>")
      vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<CR>")
      vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<CR><CR>")

      vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<CR>")
      vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<CR>")
      vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<CR>")
    end,
  }
