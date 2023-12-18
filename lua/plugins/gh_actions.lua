return
{
    'topaxi/gh-actions.nvim',
    cmd = 'GhActions',
    keys = {
        { '<leader>gh', '<cmd>GhActions<cr>', desc = 'Open Github Actions' },
        { '<F6>', '<cmd>GhActions<cr>', desc = 'Open Github Actions' },
    },
    build = 'make',
    dependencies = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
    opts = {},
    config = function(_, opts)
        require('gh-actions').setup(opts)
    end,
}
