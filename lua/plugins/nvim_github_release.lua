return {
  dir = "/home/ont/work/codex.tools/nvim-github-release",
  name = "nvim-github-release",
  enabled = function()
    return vim.uv.fs_stat("/home/ont/work/codex.tools/nvim-github-release") ~= nil
  end,
  build = function(plugin)
    vim.cmd.helptags(plugin.dir .. "/doc")
  end,
  config = function()
    require("github_release").setup({
      open_in_browser_after_create = true,
    })
  end,
}
