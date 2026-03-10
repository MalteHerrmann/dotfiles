return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections = opts.sections or {}
    opts.sections.lualine_c = {
      {
        "filename",
        path = 1, -- 0 = just filename
                  -- 1 = relative path
                  -- 2 = absolute path
                  -- 3 = absolute path, ~ for home
                  -- 4 = filename + parent dir
      },
    }
  end,
}
