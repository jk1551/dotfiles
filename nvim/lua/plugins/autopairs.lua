return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local npairs = require("nvim-autopairs")

    npairs.setup({
      check_ts = true,
      fast_wrap = {},
    })

    local cmp_status, cmp_module = pcall(require, "cmp")
    if cmp_status then
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp_module.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  end,
}

