return {
  "nvim-neotest/neotest",
  optional = true,
  keys = function()
    if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 and vim.fn.has("gui_running") == 1 then
      --- run test on cursor moved to `cargo_run`
      vim.keymap.set(
        "n",
        "<D-d>",
        ':lua require("neotest").run.run({strategy = "dap"})<CR>',
        { silent = true, desc = "Debug Test on Cursor" }
      )
      vim.keymap.set(
        "n",
        "<D-F2>",
        ':lua require("neotest").summary.toggle()<CR>',
        { silent = true, desc = "Toggle Test Summary" }
      )
      vim.keymap.set(
        "n",
        "<D-F5>",
        ':lua require("neotest").output_panel.toggle()<CR>',
        { silent = true, desc = "Toggle Test Summary" }
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
  dependencies = {
    "rouge8/neotest-rust",
  },
  opts = {
    adapters = {
      ["neotest-rust"] = {
        args = { "--no-capture" },
      },
    },
  },
}
