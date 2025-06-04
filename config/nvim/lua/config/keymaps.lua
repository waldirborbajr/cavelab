-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", "<leader>zc", ":CopilotChat<CR>", { desc = "Copilot Chat" })
map("v", "<leader>ze", ":CopilotChatExplain<CR>", { desc = "Explain Code" })
map("v", "<leader>zr", ":CopilotChatReview<CR>", { desc = "Review Code" })
map("v", "<leader>zf", ":CopilotChatFix<CR>", { desc = "Fix Code Issues" })
map("v", "<leader>zo", ":CopilotChatOptimize<CR>", { desc = "Optimize Code" })
map("v", "<leader>zd", ":CopilotChatDocs<CR>", { desc = "Generate Docs" })
map("v", "<leader>zt", ":CopilotChatTests<CR>", { desc = "Generate Tests" })
map("n", "<leader>zm", ":CopilotChatCommit<CR>", { desc = "Generate Commit Message" })
map("v", "<leader>zs", ":CopilotChatCommit<CR>", { desc = "Generate Commit for Selection" })
