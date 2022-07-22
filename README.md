# neovim config

这个是我的neovim的配置，参考的一位[日本大叔](https://github.com/craftzdog/dotfiles-public/tree/master/.config)的，基于他的做了部分修改。

## 基本说明

nvim的文件树：

```bash
nvim
├── after
│   └── plugin
│       ├── autopairs.rc.lua
│       ├── cmp.rc.vim
│       ├── defx.rc.vim
│       ├── fugitive.rc.vim
│       ├── lsp-colors.rc.vim
│       ├── lspconfig.rc.vim
│       ├── lspkind.rc.lua
│       ├── lspsaga.rc.vim
│       ├── lualine.rc.lua
│       ├── tabline.rc.vim
│       ├── telescope.rc.vim
│       ├── treesitter.rc.vim
│       ├── ts-autotag.rc.lua
│       └── web-devicons.rc.vim
├── coc-settings.json
├── colors
│   └── NeoSolarized.vim
├── init.vim
├── macos.vim
├── maps.vim
└── plug.vim
```



我的常用的操作系统： 

> MacOS Monterey
>
> Ubuntu 18.0.4
>
> Kali


参考的开源项目以及配置如下：

Neovim：

- [vim-plug](https://github.com/junegunn/vim-plug) - A minimalist Vim plugin manager

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for Neovim's built-in LSP

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - [Treesitter](https://github.com/tree-sitter/tree-sitter) configurations and abstraction layer for Neovim

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion plugin for neovim coded in Lua

- [lspsaga.nvim](https://github.com/tami5/lspsaga.nvim) - A light-weight LSP plugin based on Neovim built-in LSP with highly a performant UI

- nvim-lsp-installer

   

  \- An LSP server installer

  - It is used for installing an LSP server for Tailwind CSS

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extendable fuzzy finder over lists

- [defx.nvim](https://github.com/Shougo/defx.nvim) - A file explorer

## 配置教程

配置教程主要是针对MacOS以及Ubuntu，windows上的WSL配置过程后续补上。

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

安装vim-plug：
```bash
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

打开自己的nvim，在命令行输入:PlugInstall安装插件。

C/CPP/ObjC/ObjCPP的配置都添加，Python的需要安装部分脚本。
```bash
$ pip install 'python-lsp-server[all]'
```

安装其他工具（tmux或zellij）：
```bash
$ brew install tmux zellij
```

文件管理工具可以用ranger等。

### Ubuntu/Kali

服务器主要使用Ubuntu，虚拟机Kali系统用的比较多。

安装neovim：

```bash
$ sudo apt-add-repository ppa:neovim-ppa/stable
$ sudo add-apt-repository ppa:neovim-ppa/unstable
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install neovim
```

安装nodejs，最好不要直接apt install，会出现版本问题。

下载nodejs的[Linux](https://nodejs.org/en/download/)版本:

```bash
$ xz -d xxxxxxxx.tar.xz
$ tar -xf xxxxxxxx.tar
```

添加path：

```bash
$ sudo nvim /etc/profile
```

输入如下：

```profile
export NODEJS_HOME=/your path/
export PATH=$NODEJS_HOME/bin:$PATH
```

创建软连接：

```bash
$ sudo ln -s /your path/bin/node /usr/bin/node
$ sudo ln -s /your path/bin/npm /usr/bin/npm
$ sudo ln -s /your path/bin/npx /usr/bin/npx
```

安装vim-plug：

```bash
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

打开自己的nvim，在命令行输入:PlugInstall安装插件。

安装tree-sitter：

```bash
wget https://hub.fastgit.org/tree-sitter/tree-sitter/releases/download/v0.20.1/tree-sitter-linux-x64.gz
gzip -d  tree-sitter-linux-x64.gz
mv tree-sitter-linux-x64 /bin/tree-sitter
chmod +x /bin/tree-sitter
```

C/CPP/ObjC/ObjCPP的配置都添加，Python的需要安装部分脚本。

```bash
$ pip install 'python-lsp-server[all]'
```

安装其他工具（tmux）：

```bash
$ sudo apt-get install tmux
```

文件管理工具可以用ranger等。
