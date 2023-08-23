-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.colorscheme = 'NeoSolarized'
lvim.lsp.automatic_servers_installation = false

-- keymap User:zihan
-- Split window
lvim.keys.normal_mode['vs'] = ":split<Return><C-w>w"
lvim.keys.normal_mode['sv'] = ":vsplit<Return><C-w>w"
-- edit
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G"

-- plugins
lvim.plugins = {
  -- theme  
  {
        'Tsuzat/NeoSolarized.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'NeoSolarized'
                    
                }
            }
        end
  },
  -- markdown
  {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        config = function()
        vim.g.mkdp_auto_start = 1
        end,
  },
  -- neo-tree  
  {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
            close_if_last_window = true,
            window = {
                width = 30,
            },
            buffers = {
                follow_current_file = true,
            },
            filesystem = {
                follow_current_file = true,
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        "node_modules"
                    },
                    never_show = {
                        ".DS_Store",
                        "thumbs.db"
                    },
                },
            },
        })
        end
  },
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
            func_map = {
            vsplit = "",
            ptogglemode = "z,",
            stoggleup = "",
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
    'wfxr/minimap.vim',
    build = "cargo install --locked code-minimap",
    -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function ()
      vim.cmd ("let g:minimap_width = 10")
      vim.cmd ("let g:minimap_auto_start = 1")
      vim.cmd ("let g:minimap_auto_start_win_enter = 1")
    end,
  },
  -- nvim-spectre
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  -- numb.nvim
  {
  "nacro90/numb.nvim",
  event = "BufRead",
  config = function()
  require("numb").setup {
    show_numbers = true, -- Enable 'number' for the window while peeking
    show_cursorline = true, -- Enable 'cursorline' for the window while peeking
  }
  end,
},
}
