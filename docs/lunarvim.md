# LunarVim

人变懒了，开始用现成的neovim。在lvim和lazy（lazyvim）中选择了lvim。

![zihan](/docs/image/zihan-lunarvim.png)

## 依赖

Make sure you have installed the latest version of Neovim v0.9.0+.
Have git, make, pip, python, npm, node and cargo installed on your system.
Resolve EACCES permissions when installing packages globally to avoid error when installing packages with npm.
PowerShell 7+ (for Windows)

## 配置方式

lazygit:

```bash
$ brew install lazygit
``

安装livm：

```bash
$ LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

替换我的config文件即可，在'/nvim/lunarvim/'中。

刚用没多久，而且“怀揣”着偷懒的原则，很多插件暂时没有配置，现在只是支持简单的功能。

## Plugins

现有插件：

> theme:NeoSolarized
>
> keymap修改
>
> markdown
>
> neotree
>
> ......

很多的按键可以用用过space查看，后面回陆续更新这个config file。
