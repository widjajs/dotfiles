-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Fat finger protection when exiting and/or saving
vim.api.nvim_create_user_command("W", "w", { desc = "Same as :w" })
vim.api.nvim_create_user_command("Q", "q", { desc = "Same as :q" })
vim.api.nvim_create_user_command("Wa", "wa", { desc = "Same as :wa" })
vim.api.nvim_create_user_command("WA", "wa", { desc = "Same as :wa" })
vim.api.nvim_create_user_command("Wq", "wq", { desc = "Same as :wq" })
vim.api.nvim_create_user_command("WQ", "wq", { desc = "Same as :wq" })
vim.api.nvim_create_user_command("Wqa", "wqa", { desc = "Same as :wqa" })
vim.api.nvim_create_user_command("WQa", "wqa", { desc = "Same as :wqa" })

-- Y yanks to end of line now
vim.keymap.set("n", "Y", "y$")

-- Clear search highlighting
vim.keymap.set("n", "<leader>nh", "<cmd>nohlsearch<cr>", { desc = "Clear search highlighting" })
vim.keymap.set("n", "<leader>uh", "<cmd>set hlsearch!<cr>", { desc = "Toggle search highlighting" })

-- Tab navigation
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "Create new tab" })
vim.keymap.set("n", "]t", "gt", { desc = "Move to next tab" })
vim.keymap.set("n", "[t", "gT", { desc = "Move to previous tab" })

-- Close other buffers
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>", { desc = "Close other buffers", silent = true })

-- Yank/paste to/from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Open terminals
vim.keymap.set("n", "<leader>ts", "<cmd>split | terminal<cr>", { desc = "Open terminal in horizontal split" })
vim.keymap.set("n", "<leader>tv", "<cmd>vsplit | terminal<cr>", { desc = "Open terminal in vertical split" })
vim.keymap.set("n", "<leader>tt", "<cmd>tabnew | terminal<cr>", { desc = "Open terminal in new tab" })

-- Open buffer in split tabs
vim.keymap.set("n", "<leader>ve", "<cmd>vnew<cr>", { desc = "Open empty buffer in vertical split" })

-- Use '*' key to surround with C-style comments
vim.g.surround_42 = "/* \r */"

-- Move visual selected lines up and down
vim.keymap.set("v", "K", "<cmd>m '<-2<cr>gv=gv", { desc = "Move selected lines up" })
vim.keymap.set("v", "J", "<cmd>m '>+1<cr>gv=gv", { desc = "Move selected lines down" })

-- Lazy git
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })

-- Clear noice-nvim msgs
vim.keymap.set("n", "<leader>ca", function()
    require("noice").cmd("dismiss")
end, { desc = "Clear Noice messages" })

-- Close current buffer and go to previous one
vim.keymap.set("n", "<leader>bd", function()
    local buf = vim.api.nvim_get_current_buf()
    vim.cmd("bprevious")
    vim.cmd("bdelete " .. buf)
end, { desc = "Close Current Buffer" })

-- Better terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Terminal switch to left split", silent = true })
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Terminal switch to right split", silent = true })
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Terminal switch to top split", silent = true })
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Terminal switch to bottom split", silent = true })

-- Reload current config without restarting Neovim
vim.keymap.set("n", "<leader>sv", "<cmd>source $MYVIMRC<cr>", { desc = "Source current config" })

-- Toggle relative line numbers
vim.keymap.set("n", "<leader>rl", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative numbers" })

-- Buffer-local LSP key mappings
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
    callback = function(args)
        local bufnr = args.buf
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        local function bufmap(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
        end

        -- Normal mode LSP keymaps
        if client.supports_method("textDocument/definition") then
            bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
        end

        if client.supports_method("textDocument/implementation") then
            bufmap("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        end

        if client.supports_method("textDocument/references") then
            bufmap("n", "gr", vim.lsp.buf.references, "List references")
        end

        if client.supports_method("textDocument/hover") then
            bufmap("n", "<leader>h", vim.lsp.buf.hover, "Show hover documentation")
        end

        if client.supports_method("textDocument/rename") then
            bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        end

        if client.supports_method("textDocument/codeAction") then
            bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        end

        -- Insert mode LSP keymaps
        if client.supports_method("textDocument/signatureHelp") then
            bufmap("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
        end
    end,
})
