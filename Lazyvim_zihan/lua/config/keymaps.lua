-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- 窗口分屏
map("n", "vs", ":split<Return><C-w>w", { desc = "水平分屏" })
map("n", "sv", ":vsplit<Return><C-w>w", { desc = "垂直分屏" })

-- 全选
map("n", "<C-a>", "gg<S-v>G", { desc = "全选" })

-- 新建标签页
map("n", "te", ":tabedit<CR>", { desc = "新建标签页" })

-- 缓冲区切换（使用 Tab 和 Shift-Tab）
map("n", "<Tab>", ":bn<CR>", { desc = "下一个缓冲区" })
map("n", "<S-Tab>", ":bp<CR>", { desc = "上一个缓冲区" })

-- 延迟执行，确保 LazyVim 的默认键位已加载
vim.schedule(function()
    -- 删除 LazyVim 默认的 <leader>e (通常是“Explorer / Export”)
    pcall(vim.keymap.del, "n", "<leader>e")
  
    -- 绑定 <leader>e 打开 NeoTree
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle left<CR>", { desc = "Toggle NeoTree" })
  
    -- 绑定 <leader>E 聚焦当前文件所在目录
    vim.keymap.set("n", "<leader>E", "<cmd>Neotree reveal<CR>", { desc = "Reveal Current File in NeoTree" })
  end)
