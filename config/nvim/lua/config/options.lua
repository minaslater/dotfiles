local set = vim.opt
set.encoding="utf-8"

-- Leader
vim.g.mapleader = " "

set.backup=false
set.writebackup=false
set.swapfile=false    -- http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set.history=50
set.ruler=true         -- show the cursor position all the time
set.showcmd=true       -- display incomplete commands
set.incsearch=true  -- do incremental searching
set.laststatus=2  -- Always display the status line
set.autowrite=true     -- Automatically :write before running commands
set.modelines=0   -- Disable modelines as a security precaution
set.modeline=false
set.wrap=true     -- Wrap at window width
set.number=true   -- Display line number
set.tabstop=2
set.shiftwidth=2  -- Auto indent is 2 spaces
set.expandtab=true -- Insert mode: use shiftwidth instead of tab

