require("symbols-outline").setup {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    width = 20,
    show_numbers = false,
    show_relative_numbers = false,
    preview_bg_highlight = 'Pmenu',
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
}


