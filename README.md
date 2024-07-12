# Neovim configuration

_Installing neovim from the debian bookworm packages only provides v0.7.2_

The debian package included in this repo will install v0.10.0.

The nvim configuration files are within the nvim directory.

Plugins included:

* alpha - https://github.com/goolord/alpha-nvim
* blankline - https://github.com/lukas-reineke/indent-blankline.nvim
* bufferline - https://github.com/akinsho/bufferline.nvim
* colorizer - https://github.com/norcalli/nvim-colorizer.lua
* colorscheme - https://github.com/rebelot/kanagawa.nvim
* lualine - https://github.com/nvim-lualine/lualine.nvim
* markdown-preview - https://github.com/iamcco/markdown-preview.nvim
* oil.lua - https://github.com/stevearc/oil.nvim
* telescope - https://github.com/nvim-telescope/telescope.nvim
* transparent - https://github.com/xiyaowong/transparent.nvim
* treesitter - https://github.com/nvim-treesitter/nvim-treesitter
* vim-fugitive - https://github.com/tpope/vim-fugitive


## If you are replacing a neovim configurations, you may want to follow these steps.

_Source:  [LazyVim](https://www.lazyvim.org/installation 'LazyVim')_

* Make a backup of your current Neovim files:

```
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

```

* Clone the justaguylinux nvim packages

```
git clone https://github.com/drewgrif/nvim

```

* Remove the .git folder, so you can add it to your own repo later

```
rm -rf ~/.config/nvim/.git

```

