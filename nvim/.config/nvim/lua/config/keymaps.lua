-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Run the current Python file instantly using a floating terminal
vim.keymap.set("n", "<leader>rp", function()
  if vim.bo.filetype == "python" then
    local filename = vim.fn.expand("%")
    -- Opens LazyVim's native terminal and runs Python
    Snacks.terminal("python3 " .. filename, { interactive = true })
  else
    vim.notify("This shortcut is only for Python files!", vim.log.levels.WARN)
  end
end, { desc = "Run current Python file" })
