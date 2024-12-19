vim.cmd("set enc=utf-8")

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set numberwidth=5")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.cmd("set colorcolumn=112,224,336,448,560")
vim.cmd("set wrap")

vim.cmd("set foldlevel=99")
vim.cmd("set viewoptions=folds,cursor")

vim.cmd([[
augroup remember_folds
autocmd!
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent! loadview
augroup END
]])

vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")

function _G.MyFoldText()
  local sLine = vim.fn.getline(vim.v.foldstart)
  local eLine = vim.fn.getline(vim.v.foldend):gsub("%s+", "")
  return sLine .. "..." .. eLine
end

vim.opt.foldtext = "v:lua.MyFoldText()"
vim.opt.fillchars:append({
  fold = " ",
  eob = " ",
})

vim.cmd("set guicursor=n:blinkon1,i-ci-ve:ver1-blinkon1")

vim.opt.termguicolors = true

-- vim.opt.formatoptions = "l"
vim.opt.lbr = true

vim.cmd([[
augroup syncSyntax
autocmd!
autocmd TextChanged * syntax sync fromstart
autocmd InsertLeave * syntax sync fromstart
augroup END
]])

vim.cmd([[
augroup jsFolds
autocmd!
autocmd filetype javascript,typescript,json syntax region braceFold start="{" end="}" transparent fold
autocmd filetype javascript,typescript,json syntax region braceFold start="\[" end="\]" transparent fold 
autocmd filetype javascript,typescript,json syntax region commentText start="&\[" end="\]&"
autocmd filetype javascript,typescript,json syntax sync fromstart
autocmd filetype javascript,typescript,json setlocal foldmethod=syntax
augroup end
]])


function _G.MyFoldExpr(ln)
  if not not vim.fn.getline(ln):match("^%s*$") then
    return 0
  end

  if vim.fn.indent(ln + 1) > vim.fn.indent(ln) then
    return ">" .. (vim.fn.indent(ln) / vim.bo.shiftwidth) + 1
  elseif vim.fn.indent(ln + 1) < vim.fn.indent(ln) then
    return "<" .. (vim.fn.indent(ln) / vim.bo.shiftwidth)
  else
    if vim.fn.indent(ln - 1) > vim.fn.indent(ln) then
      return (vim.fn.indent(ln) / vim.bo.shiftwidth)
    else
      return "="
    end
  end
end

function _G.MyFoldTextPug()
  local sLine = vim.fn.getline(vim.v.foldstart)
  local eLine = vim.fn.getline(vim.v.foldend)
  if eLine:find("%)") and sLine:sub(-1) == "(" then
    eLine = ")" .. vim.fn.getline(vim.v.foldend):gsub(".-%)", "")
  else
    eLine = ""
  end
  return sLine .. "..." .. eLine
end

vim.cmd([[
augroup pugFolds
autocmd!
autocmd TextChanged *.pug set foldmethod=expr
autocmd InsertLeave *.pug set foldmethod=expr
autocmd filetype pug setlocal foldmethod=expr
autocmd filetype pug setlocal foldtext=v:lua.MyFoldTextPug()
autocmd filetype pug setlocal foldexpr=v:lua.MyFoldExpr(v:lnum)
autocmd filetype pug setlocal colorcolumn=110,220,330,440
autocmd filetype pug setlocal foldlevel=99
augroup end
]])

vim.cmd([[
augroup luaFolds
autocmd!
autocmd TextChanged *.lua set foldmethod=expr
autocmd InsertLeave *.lua set foldmethod=expr
autocmd filetype lua setlocal foldmethod=expr
autocmd filetype lua setlocal colorcolumn=110,220,330,440
augroup end
]])

function _G.MyFoldTextPython()
  local sLine = vim.fn.getline(vim.v.foldstart)
  if vim.fn.getline(vim.v.foldstart):sub(-1) == "(" then
    return sLine .. "..." .. vim.fn.getline(vim.v.foldend):gsub("%s+", "")
  else
    return sLine .. "..."
  end
end

vim.cmd([[
augroup pythonFold
autocmd!
autocmd TextChanged *.py set foldmethod=expr
autocmd InsertLeave *.py set foldmethod=expr
autocmd filetype python setlocal foldmethod=expr
" autocmd filetype python setlocal foldexpr=nvim_treesitter#foldexpr()
autocmd filetype python setlocal foldtext=v:lua.MyFoldTextPython()
augroup end
]])


vim.diagnostic.config({
  virtual_text = false,
})


vim.opt.cursorline = true
vim.cmd([[

highlight Normal guibg=#131720
" highlight Normal guibg=none
highlight Folded guibg=none guifg=#33995c
" highlight @comment guifg=#5c5c70
highlight comment guifg=#608a9f
highlight commentText guibg=#101319

highlight NormalNC guibg=none
highlight Visual guibg=#2e3238 guifg=#00FF00

highlight @ibl.whitespace.char.2 guibg=#101319
highlight @ibl.whitespace.char.1 guibg=#131720

highlight LineNr guifg=#505070 guibg=#101319
highlight CursorLineNr guifg=#ff6000 guibg=#101319
highlight signColumn  guibg=#101319
highlight CursorLine guibg=#101319
highlight ColorColumn guibg=#101319

highlight lualine_c_normal guibg=none
highlight lualine_c_command guibg=none
highlight lualine_c_visual guibg=none
highlight lualine_c_insert guibg=none
highlight lualine_c_inactive guibg=none

highlight String guifg=#ffb020

highlight @variable.builtin guifg=#2040b0

highlight htmlTagName guifg=#ff0000

highlight javascriptInterpolation guifg=#e4cf67
highlight JavascriptIdentifier guifg=#00ff00

highlight pugId guifg=#50ff50
highlight link pugIdChar pugId
highlight pugJavascript guifg=#707070 gui=underdotted
highlight link pugJavascriptChar pugJavascript
highlight link JavascriptParenthesisBlock pugJavascript
highlight link JavascriptParens pugJavascript
highlight pugClassChar guifg=#f04040
highlight pugAttributes guifg=#e4cf67
highlight pugJavascriptOutputChar guifg=#e4cf67
highlight pugAttributesDelimiter guifg=#f04040
highlight pugAngular2 guifg=#4070a0
highlight pugScriptLoopRegion guifg=#4070a0

highlight pugTag guifg=#505050
highlight pugScriptStatement guifg=#e4cf67
highlight pugScriptStatementKeywords guifg=#ff7a29

highlight pugScriptConditionalMatch guifg=#2040b0
highlight pugScriptConditionalBool guifg=#66a4ff
highlight pugScriptConditionalDelimiter guifg=#2040b0
highlight pugScriptConditional guifg=#4070a0

highlight pugScriptLoopKeywords guifg=#2040b0
highlight JavascriptRepeat guifg=#2040b0

highlight TelescopeBorder guifg=#527a62 guibg=none

highlight TodoFgNOTE guibg=#29293e guifg=cyan
highlight TodoBgNOTE guibg=#29293e guifg=cyan
highlight TodoFgFIX guibg=#432a24 guifg=#ff7a29
highlight TodoBgFIX guibg=#432a24 guifg=#ff7a29
highlight TodoFgWARN guibg=#432424 guifg=#ff2929
highlight TodoBgWARN guibg=#432424 guifg=#ff2929
highlight TodoFgTODO guibg=#282216 guifg=#ebff99
highlight TodoBgTODO guibg=#282216 guifg=#ebff99
]])

vim.keymap.set({ "n", "v" }, "j", "gjzz", {
  noremap = true,
  silent = true,
})
vim.keymap.set({ "n", "v" }, "k", "gkzz", {
  noremap = true,
  silent = true,
})

vim.keymap.set("n", "<leader>w", ":set wrap!<CR>", {
  noremap = true,
  silent = true,
})

vim.keymap.set({ "n", "v" }, "<C-u>", "10kzz", {
  noremap = true,
  silent = true,
})
vim.keymap.set({ "n", "v" }, "<C-d>", "10jzz", {
  noremap = true,
  silent = true,
})

vim.keymap.set({ "n", "v" }, "G", "Gzz", {
  noremap = true,
  silent = true,
})

vim.keymap.set({ "n", "v" }, "gg", "ggzz", {
  noremap = true,
  silent = true,
})

vim.keymap.set({ "n", "v" }, "<PageDown>", "5jzz", {
  noremap = true,
  silent = true,
})
vim.keymap.set({ "n", "v" }, "<PageUp>", "5kzz", {
  noremap = true,
  silent = true,
})

vim.keymap.set({ "n", "v" }, "zM", "zMzz", {
  noremap = true,
  silent = true,
})
vim.keymap.set({ "n", "v" }, "za", "zazz", {
  noremap = true,
  silent = true,
})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
