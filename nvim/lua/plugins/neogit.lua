return {
  "TimUntersberger/neogit",
  cmd = "Neogit",
  config = function()
    require("neogit").setup({
      kind = "split",
      signs = {
        -- { CLOSED, OPENED }
        section = { "c", "C" },
        item = { "i", "I" },
        hunk = { "h", "H" },
      },
      integrations = { diffview = true },
    })
  end,
}
