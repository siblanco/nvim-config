return {
  "nvimdev/indentmini.nvim",
  config = function()
    require("indentmini").setup({
      char = "",
      exclude = {
        "erlang",
        "markdown",
      },
    })
  end,
}
