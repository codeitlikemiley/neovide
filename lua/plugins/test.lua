return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "rouge8/neotest-rust",
    },
    opts = { adapters = {
      "neotest-plenary",
      ["neotest-rust"] = {},
    } },
  },
}
