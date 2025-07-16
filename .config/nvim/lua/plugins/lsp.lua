return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.inlay_hints = { enabled = false }
      return opts
    end,
  },
}
