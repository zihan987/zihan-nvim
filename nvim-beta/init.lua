require('zihan.base')
require('zihan.highlights')
require('zihan.maps')
require('zihan.plugins')
require'lspconfig'.pyright.setup{}
require'lspconfig'.ccls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.rust_analyzer.setup{}

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('zihan.macos')
end
if is_win then
  require('zihan.windows')
end
