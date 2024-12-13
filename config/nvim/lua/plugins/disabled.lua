local disabled_plugins = {
  "dressing.nvim",
  "mini.indentscope",
  "flash.nvim",
  "lazydev.nvim",
  "luvit-meta",
  "mini.ai",
  "neo-tree.nvim",
  "noice.nvim",
  "nui.nvim",
  "nvim-notify",
  "persistence.nvim",
  "render-markdown.nvim",
  "todo-comments.nvim",
  "tokyonight.nvim",
  "ts-comments.nvim",
}

local lazy_disabled = {}
for _, plugin in ipairs(disabled_plugins) do
  lazy_disabled[#lazy_disabled + 1] = { plugin, enabled = false }
end

return lazy_disabled
