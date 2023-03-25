# neovim config（Beta）

这个是我的neovim beta版本的配置，参考的一位[日本大叔](https://github.com/craftzdog/dotfiles-public.git)的，基于他的做了部分修改。

## 基本说明

nvim的文件树：

```bash
nvim-beta
├── after
│   └── plugin
│       ├── autopairs.rc.lua
│       ├── bufferline.rc.lua
│       ├── cmp.rc.lua
│       ├── colorizer.rc.lua
│       ├── comment.rc.lua
│       ├── git.rc.lua
│       ├── gitsigns.rc.lua
│       ├── lsp-colors.rc.lua
│       ├── lspkind.rc.lua
│       ├── lualine.rc.lua
│       ├── neosolarized.rc.lua
│       ├── telescope.rc.lua
│       ├── treesitter.rc.lua
│       ├── ts-autotag.rc.lua
│       ├── web-devicons.rc.lua
│       └── zen-mode.rc.lua
├── coc-settings.json
├── init.lua
├── lua
│   └── zihan
│       ├── base.lua
│       ├── highlights.lua
│       ├── macos.lua
│       ├── maps.lua
│       ├── plugins.lua
│       └── windows.lua
└── plugin
    ├── 0_mason.rc.lua
    ├── lspconfig.lua
    ├── lspsaga.rc.lua
    └── null-ls.rc.lua
```



我的常用的操作系统： 

> MacOS Monterey
>
> Ubuntu 18.0.4
>
> Kali


参考的开源项目以及配置如下：

- [Neovim](https://neovim.io/) >= 0.7
- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - A plugin manager for Neovim
- [svrana/neosolarized.nvim](https://github.com/svrana/neosolarized.nvim) - A truecolor, solarized dark colorscheme
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A blazing fast and easy to configure Neovim statusline written in Lua
- [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim) - VSCode-like pictograms
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Engine for Neovim written in Lua
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - nvim-cmp source for neovim's built-in LSP
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - nvim-cmp source for buffer words
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for Neovim's built-in LSP
- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
- [MunifTanjim/prettier.nvim](https://github.com/MunifTanjim/prettier.nvim) - Prettier plugin for Neovim's built-in LSP client
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
- [glepnir/lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - [Treesitter](https://github.com/tree-sitter/tree-sitter) configurations and abstraction layer for Neovim
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - Lua `fork` of vim-web-devicons for neovim
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extendable fuzzy finder over lists
- [nvim-telescope/telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) - File Browser extension for telescope.nvim
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autopairs
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Use treesitter to auto close and auto rename html tag
- [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) - A high-performance color highlighter
- [akinsho/nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua) - A snazzy bufferline
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration for buffers
- [dinhhuy258/git.nvim](https://github.com/dinhhuy258/git.nvim) - A simple clone of the plugin vim-fugitive
- [folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim) - Distraction-free mode
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) - Markdown live preview

## 配置教程

配置教程主要是针对MacOS以及Ubuntu，windows上的WSL2配置参考我的[wsl2 config](https://github.com/zihan987/wsl2-config.git)。

### MacOS 

Mac上的配置对于M1芯片和Intel芯片的电脑都适配，M1的电脑可以选择将iTerm2选择使用Rosetta打开。

安装Homebrew：

```bash
$ /bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
```

安装依赖：

```bash
$ brew install --HEAD tree-sitter luajit neovim 
```

nodejs安装需要去nodejs[官网](https://nodejs.org/en/)下载。

Mac上nodejs的安装比较无脑，使用包直接完成。

通过如下命令测试安装情况：

```bash
$ node --version
$ npm --version
```

安装packer：

```bash
$  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

打开自己的nvim，在命令行输入:PackerInstall安装插件。

### LSP的语言支持

neovim内置的功能非常强大，我也安装了部分插件，可直接安装自己使用的语言。

例如：

```bash
:CocInstall coc-rls
```

python等也可以通过其他添加对应的支持，例如：

```bash
npm install -g pyright
```

然后再init中添加对应的配置：

```lua
require'lspconfig'.pyright.setup{}
```

默认的配置可在开源项目中找到。

#### Rust

```bash
$ rustup component add rls rust-analysis rust-src
$ CocInstall coc-rls
```
