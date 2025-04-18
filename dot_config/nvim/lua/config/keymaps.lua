-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lazyvim/config/keymaps
-- Add any additional keymaps here

local map = vim.keymap.set
-- local autocmd = vim.api.nvim_create_autocmd
-- local augroup = vim.api.nvim_create_augroup
-- local lsp = vim.lsp.buf

local telescope = require("telescope.builtin")

local default_opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map("v", "<Leader>p", '"_dP', default_opts)

-- map('n', '<Leader>n', ':bn<CR>', default_opts)
-- map('n', '<Leader>p', ':bp<CR>', default_opts)

-- map('', '<up>', ':echoe "Use k !!!"<CR>', default_opts)
-- map('', '<down>', ':echoe "Use j !!!"<CR>', default_opts)
-- map('', '<left>', ':echoe "Use h !!!"<CR>', default_opts)
-- map('', '<right>', ':echoe "Use l !!!"<CR>', default_opts)

-- map('n', 'n', 'nzzzv', default_opts)
-- map('n', 'N', 'Nzzzv', default_opts)

-- map('i', '<A-h>', '<Esc>hli', default_opts)
-- map('i', '<A-l>', '<Esc>lli', default_opts)
-- map('i', '<A-j>', '<Esc>jli', default_opts)
-- map('i', '<A-k>', '<Esc>kli', default_opts)

map("n", "<Leader>h", "<C-w>h", default_opts)
map("n", "<Leader>k", "<C-w>k", default_opts)
map("n", "<Leader>j", "<C-w>j", default_opts)
map("n", "<Leader>l", "<C-w>l", default_opts)

-- map("n", "<F6>", require("auto-session.session-lens").search_session, {noremap = true,})

-- Navigation
-- map('n', '<F3>', ':BufferLineCycleNext<CR>', default_opts)
-- map('n', '<F2>', ':BufferLineCyclePrev<CR>', default_opts)

map("n", "<leader>y", ":%y+<CR>", default_opts)

map("n", "<F2>", ":ToggleTerm<CR>", default_opts)
map("n", "<F3>", ":LazyGit<CR>", default_opts)
map("n", "<F4>", ":Trouble diagnostics<CR>", default_opts)
map("n", "<F5>", ":DapContinue<CR>", default_opts)

map("n", "<F10>", ":Neotree toggle<CR>", default_opts)
map("n", "<F11>", ":AerialToggle<CR>", default_opts)
-- map('n', '<F11>', '<cmd>Trouble symbols toggle focus=false<cr>', default_opts)

-- map('n', '<F4>', ':ClangdSwitchSourceHeader<CR>', default_opts)
-- map('n', '<F4>', ':e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>', default_opts)
-- map('n', 'h<F4>', ':sp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>', default_opts)
-- map('n', 'v<F4>', ':vs %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>', default_opts)

map("n", "<leader>u", "<cmd>Telescope undo<CR>", default_opts)

map("n", "<leader>fl", telescope.live_grep, default_opts)

-- map('n', '<A-Up>', ':split<CR>', default_opts)
-- map('n', '<A-Down>', ':split<CR>', default_opts)
-- map('n', '<A-Left>', ':vsplit<CR>', default_opts)
-- map('n', '<A-Right>', ':vsplit<CR>', default_opts)

-- map("n", "<leader>;", "<cmd>lua require('memento').toggle()<CR>", default_opts)
-- map('n', '<F9>', ':Arrow open<CR>', default_opts) -- in plugin config

map("n", "<A-Right>", "<C-w><", default_opts)
map("n", "<A-Left>", "<C-w>>", default_opts)
map("n", "<A-Up>", "<C-w>+", default_opts)
map("n", "<A-Down>", "<C-w>-", default_opts)

-- мешает find references
-- map('n', '<leader>g', ':AerialNavToggle<CR>', default_opts)

-- Code
-- map('n', '<Leader>fi', require('qmlformat').preview_qmlformat_changes, default_opts)

-- Build & Run
-- map("n", "<leader>c", ":CMakeToggle<CR><C-w>j<CR>", default_opts)

-- map("n", "<Insert>", "<Plug>(CMakeStop)", default_opts)

-- Lsp
-- autocmd('LspAttach', {
--     group = augroup('UserLspConfig', {}),
--     callback = function(ev)
--         -- Включаем автодополнение по нажатию <C-x><C-o>
--         vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--         -- Локальные отображения для буфера
--         local opts = {buffer = ev.buf}
--
--         map('n', 'gD', lsp.declaration, opts)
--         map('n', 'gd', lsp.definition, opts)
--         map('n', 'gi', lsp.implementation, opts)
--         map('n', 'gr', lsp.references, opts)
--
--         map('n', 'H', lsp.hover, opts)
--         -- map('n', '<A-h>', lsp.signature_help, opts)
--
--         -- map('n', '<space>wa', lsp.add_workspace_folder, opts)
--         -- map('n', '<space>wr', lsp.remove_workspace_folder, opts)
--         -- map('n', '<space>wl',
--         --     function() print(vim.inspect(lsp.list_workspace_folders())) end,
--         --     opts)
--
--         -- map('n', '<space>D', lsp.type_definition, opts)
--         map('n', '<space>rn', lsp.rename, opts)
--         -- map({ 'n', 'v' }, '<space>ca', lsp.code_action, opts)
--
--         -- map('n', '<space>f', function()
--         --   lsp.format { async = true }
--         -- end, opts)
--     end
-- })

-- Terminal go
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<Leader>h", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<Leader>j", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<Leader>k", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<Leader>l", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
