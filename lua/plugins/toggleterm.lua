local toggleterm   = require('toggleterm')

toggleterm.setup {
    size = function(term)
        if term.direction == "horizontal" then
        return 15
        elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
        end
    end,
    direction = 'float',
    hide_numbers = true, -- hide the number column in toggleterm buffers
    start_in_insert = false,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    close_on_exit = true, -- close the terminal window when the process exits
    hidden = true, 
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", count = 5 })
local console = Terminal:new({ hidden = true, direction = "vertical", count = 6 })

function _lazygit_toggle()
  lazygit:toggle()
end

function _console_toggle()
  console:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua _console_toggle()<CR>", {noremap = true, silent = true})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<A-y>', [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
