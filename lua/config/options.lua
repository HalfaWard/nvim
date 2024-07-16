-- [[ Setting options ]]
-- See `:help vim.opt`

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true
vim.o.formatoptions = "jcroqlnt"

vim.g.sqlite_clib_path = "C:/Users/hwpe/AppData/Local/nvim-data/sqlite-dll-win/sqlite3.dll"
local opt = vim.opt
-- UI
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 250
opt.cursorline = false
opt.hlsearch = true
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 50
opt.shiftwidth = 4
opt.tabstop = 4
opt.confirm = true
opt.laststatus = 3
opt.pumblend = 10
opt.pumheight = 10

-- Preview substitutions live, as you type!
opt.inccommand = "split"

-- Make cursor blink
opt.guicursor = {
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50",
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
    "sm:block-blinkwait175-blinkoff150-blinkon175",
}

-- Set shell to Powershell
if vim.fn.has("win64") == 1 then
	opt.shell='pwsh -NoLogo -CustomPipeName nvim'
	opt.shellcmdflag=
		'-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
	opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
	opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
	opt.shellquote=''
	opt.shellxquote=''
end
