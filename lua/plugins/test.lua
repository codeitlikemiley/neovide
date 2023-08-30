return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "rouge8/neotest-rust",
    },
    keys = function()
      if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 and vim.fn.has("gui_running") == 1 then
        vim.keymap.set(
          "n",
          "<D-t>",
          ':lua require("neotest").run.run()<CR>',
          { silent = true, desc = "Run Test on Cursor" }
        )
        vim.keymap.set(
          "n",
          "<D-x>",
          ':lua require("neotest").run.run({strategy = "dap"})<CR>',
          { silent = true, desc = "Debug Test on Cursor" }
        )
      else
        vim.keymap.set(
          "n",
          "<M-t>",
          ':lua require("neotest").run.run()<CR>',
          { silent = true, desc = "Run Test on Cursor" }
        )
        vim.keymap.set(
          "n",
          "<M-z>",
          ':lua require("neotest").run.run({strategy = "dap"})<CR>',
          { silent = true, desc = "Debug Test on Cursor" }
        )
      end
    end,
    opts = {
      adapters = {
        "neotest-plenary",
        ["neotest-rust"] = {},
      },
    },
  },
}
