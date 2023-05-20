local dapgo = require("dap-go")

dapgo.setup({
  dap_configurations = {
    {
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    }
  },
  delve = {
    initialize_timeout_sec = 20,
    port = "${port}"
  }
})

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})
