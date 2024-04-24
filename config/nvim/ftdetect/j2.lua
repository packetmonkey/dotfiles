vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.service.j2"},
  command = "set filetype=systemd"
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.yaml.j2", "*.yml.j2"},
  command = "set filetype=yaml"
})
