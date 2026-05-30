require('lualine').setup {
    options = {
        globalstatus = true,
        theme = 'auto',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { '%S', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    }
}
