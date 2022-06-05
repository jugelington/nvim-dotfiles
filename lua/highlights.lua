vim.cmd([[
highlight TestOk    ctermbg=green
highlight TestError ctermbg=red

syn match TestOk    "\<Ok:"
syn match TestError "Error Message:"
syn match TestError "Expected"
]])
