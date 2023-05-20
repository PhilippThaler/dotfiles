local code_runner = require("code_runner")

code_runner.setup({
  filetype = {
    go = {
      "cd $dir &&",
      "go run $fileName"
    }
  }
})
