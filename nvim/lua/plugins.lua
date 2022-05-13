return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
	}
	use {
		'phaazon/hop.nvim',
		branch = 'v1', -- optional but strongly recommended
		config = function()
		-- you can configure Hop the way you like here; see :h hop-config
		require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		end
	}
end)
