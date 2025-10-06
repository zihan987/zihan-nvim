-- Lualine 状态栏配置
return {
    {
      "nvim-lualine/lualine.nvim",
      opts = function()
        return {
          options = {
            theme = "visual_studio_code",
            icons_enabled = true,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            globalstatus = true,
          },
          sections = require("visual_studio_code").get_lualine_sections(),
        }
      end,
    },
  }