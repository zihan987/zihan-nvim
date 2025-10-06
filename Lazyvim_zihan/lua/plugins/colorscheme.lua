-- Visual Studio Code 主题配置
return {
  -- 添加 visual_studio_code 主题
  {
    "askfiy/visual_studio_code",
    priority = 1000,
    config = function()
      require("visual_studio_code").setup({
        -- 深色模式
        mode = "dark",
        -- 加载所有配色方案
        preset = true,
        -- 背景透明（根据需要设置）
        transparent = false,
        -- 启用插件适配
        expands = {
          hop = true,
          lazy = true,
          nvim_cmp = true,
          gitsigns = true,
          which_key = true,
          nvim_tree = true,
          lspconfig = true,
          telescope = true,
          bufferline = true,
          nvim_notify = true,
          vim_illuminate = true,
          nvim_treesitter = true,
          indent_blankline = true,
        },
      })
    end,
  },

  -- 配置 LazyVim 使用 visual_studio_code 主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "visual_studio_code",
    },
  },
}
