return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "rouge8/neotest-rust",
    },
    keys = function()
      if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 and vim.fn.has("gui_running") == 1 then
        vim.keymap.set("n", "<D-e>", ":lua require(\"neotest\").run.run()<CR>", { silent = true, desc = "Run Test on Cursor" })
        vim.keymap.set("n", "<D-x>", ":lua require(\"neotest\").run.run({strategy = \"dap\"})<CR>", { silent = true, desc = "Debug Test on Cursor" })
        vim.keymap.set("n", "<D-/>", ":lua require(\"neotest\").summary.toggle()<CR>", { silent = true, desc = "Test Summary" })
      else
        vim.keymap.set("n", "<M-e>", ":lua require(\"neotest\").run.run()<CR>", { silent = true, desc = "Run Test on Cursor" })
        vim.keymap.set("n", "<M-x>", ":lua require(\"neotest\").run.run({strategy = \"dap\"})<CR>", { silent = true, desc = "Debug Test on Cursor" })
        vim.keymap.set("n", "<M-/>", ":lua require(\"neotest\").summary.toggle()<CR>", { silent = true, desc = "Test Summary" })
      end

    end,
    opts = {
      adapters = {
        "neotest-plenary",
        ["neotest-rust"] = {},
      }
    },
  },
}
