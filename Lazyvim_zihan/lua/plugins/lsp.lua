-- LSP 配置
return {
  -- 禁用 Mason 自动安装
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {}, -- 清空自动安装列表
    },
  },

  -- 配置 LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- 禁用自动安装 LSP 服务器
      autoformat = true,
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
      setup = {},
    },
  },

  -- 禁用 Mason 的自动安装功能
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = false, -- 禁用自动安装
    },
  },
}
