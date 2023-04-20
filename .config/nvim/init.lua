local ensure_packer = function()
	local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function (use)
	use "wbthomason/packer.nvim"
	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } }
	}
	use "navarasu/onedark.nvim"
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use "nvim-treesitter/playground"
	use "mbbill/undotree"
	use "tpope/vim-fugitive"
	use "theprimeagen/harpoon"
	use {
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		}
	}
	if packer_bootstrap then
		require('packer').sync()
	end
end)

require("custom.remap")
require("custom.set")

