return {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function ()
        require('alpha').setup(require('config.core.starter').opts)
    end
}
