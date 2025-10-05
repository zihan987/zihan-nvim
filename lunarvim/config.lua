-- ===========================
--  LunarVim User Config
--  for macOS + Neovim ≥ 0.9
-- ===========================

-- === 基础设置 ===
lvim.colorscheme = "NeoSolarized"

-- 停止自动安装 LSP 服务器（新版 Mason 接口）
lvim.lsp.installer.setup.automatic_installation = false

-- === 快捷键配置 ===
-- 窗口分屏
lvim.keys.normal_mode["vs"] = ":split<Return><C-w>w"
lvim.keys.normal_mode["sv"] = ":vsplit<Return><C-w>w"

-- 编辑类
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G"
lvim.keys.normal_mode["te"] = ":tabedit"

-- 缓冲区切换
lvim.keys.normal_mode["<Tab>"] = ":bn<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":bp<CR>"

-- === 插件配置 ===
lvim.plugins = {
  -- 主题：NeoSolarized
  {
    "Tsuzat/NeoSolarized.nvim",
    config = function()
      require("lualine").setup {
        options = { theme = "NeoSolarized" }
      }
    end,
  },

  -- Markdown 预览
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
    end,
  },

  -- 文件树（新版 Neo-tree）
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = { width = 30 },
        buffers = { follow_current_file = true },
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = { "node_modules" },
            never_show = { ".DS_Store", "thumbs.db" },
          },
        },
      })
    end,
  },

  -- 快速修复列表增强 (nvim-bqf)
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },

  -- minimap（使用更稳定的新版本）
  {
    "echasnovski/mini.map",
    version = false,
    config = function()
      local map = require("mini.map")
      map.setup()
    end,
  },

  -- 全局替换工具 nvim-spectre
  {
    "windwp/nvim-spectre",
    event = "VeryLazy",
    config = function()
      require("spectre").setup()
    end,
  },

  -- 行号预览（numb.nvim）
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup({
        show_numbers = true,
        show_cursorline = true,
      })
    end,
  },
}

-- === 启用 Lua LSP（方便编辑配置） ===
require("lvim.lsp.manager").setup("lua_ls")

