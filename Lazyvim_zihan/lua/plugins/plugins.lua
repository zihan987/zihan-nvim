-- 额外插件配置
return {
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
  
    -- Neo-tree 文件树（LazyVim 已包含，这里只做配置覆盖）
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        close_if_last_window = true,
        window = {
          width = 30,
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules",
            },
            never_show = {
              ".DS_Store",
              "thumbs.db",
            },
          },
        },
      },
    },
  
    -- 快速修复列表增强
    {
      "kevinhwang91/nvim-bqf",
      event = "BufRead",
      config = function()
        require("bqf").setup({
          auto_enable = true,
          preview = {
            win_height = 12,
            win_vheight = 12,
            delay_syntax = 80,
            border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
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
  
    -- minimap
    {
      "nvim-mini/mini.map",
      version = false,
      config = function()
        local map = require("mini.map")
        map.setup({
          integrations = {
            map.gen_integration.builtin_search(),
            map.gen_integration.diagnostic(),
          },
          symbols = {
            encode = map.gen_encode_symbols.dot("4x2"),
          },
          window = {
            show_integration_count = false,
          },
        })
        -- 快捷键：<leader>mm 打开/关闭 minimap
        vim.keymap.set("n", "<leader>mm", function()
          map.toggle()
        end, { desc = "切换 Minimap" })
      end,
    },
  
    -- 全局替换工具
    {
      "nvim-pack/nvim-spectre",
      cmd = "Spectre",
      opts = { open_cmd = "noswapfile vnew" },
      keys = {
        {
          "<leader>sr",
          function()
            require("spectre").open()
          end,
          desc = "全局替换 (Spectre)",
        },
      },
    },
  
    -- 行号预览
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


