local M = {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
}

function M.config()
  require("bufferline").setup({})
end

return M
