return {
  "TimUntersberger/neogit",
  cmd = "Neogit",
  config = function()
    require("neogit").setup({
      kind = "split",
      -- signs = {
      --   -- { CLOSED, OPENED }
      --   section = { ">", "v" },
      --   item = { ">", "v" },
      --   hunk = { "", "" },
      -- },
      integrations = { diffview = true },
    })
  end,
}
