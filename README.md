# 🧠 JustAGuy Linux Neovim Config

> Minimal, fast, and intuitive Neovim setup for the user - not a programmer.

This is my personal Neovim configuration, designed for speed and simplicity without sacrificing power. It's built with a Lua-first mindset and includes everything needed to without an LSP (since I really don't need one).

---

## ✨ Features

- ⚡ Fast startup using lazy.nvim
- 🧠 Treesitter for beautiful, context-aware syntax highlighting
- 🔍 Telescope for fuzzy finding anything
- 🎨 GitHub-inspired colorscheme with `github_dark_default`
- 🧭 Intuitive keybinds with which-key
- 📦 Easy to extend and modify

---

## 🧩 Plugin List

| Plugin | Description |
|--------|-------------|
| [**alpha-nvim**](https://github.com/goolord/alpha-nvim) | Customizable dashboard/start screen |
| [**indent-blankline.nvim**](https://github.com/lukas-reineke/indent-blankline.nvim) | Adds indentation guides to blank lines |
| [**bufferline.nvim**](https://github.com/akinsho/bufferline.nvim) | Tab-like buffer line with icons and styling |
| [**nvim-colorizer.lua**](https://github.com/norcalli/nvim-colorizer.lua) | Displays color codes with actual colors inline |
| [**github-nvim-theme**](https://github.com/projekt0n/github-nvim-theme) | GitHub-styled theme (using `github_dark_default`) |
| [**lualine.nvim**](https://github.com/nvim-lualine/lualine.nvim) | Lightweight and configurable statusline |
| [**markdown-preview.nvim**](https://github.com/iamcco/markdown-preview.nvim) | Live Markdown preview in browser |
| [**oil.nvim**](https://github.com/stevearc/oil.nvim) | Edit your filesystem like a normal Neovim buffer |
| [**telescope.nvim**](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, text, buffers, and more |
| [**transparent.nvim**](https://github.com/xiyaowong/transparent.nvim) | Toggle transparency for Neovim and plugins |
| [**nvim-treesitter**](https://github.com/nvim-treesitter/nvim-treesitter) | High-performance syntax highlighting and code navigation |
| [**vim-fugitive**](https://github.com/tpope/vim-fugitive) | Git integration for Vim/Neovim |

---

## 🚀 Installation

### 1. Install Neovim 0.11.0

You can install **Neovim 0.11.0** using the provided `.deb` file:

```bash
wget https://github.com/drewgrif/nvim/raw/main/nvim-linux-x86_64.deb
sudo apt install ./nvim-linux-x86_64.deb
```

> 💡 This installs the latest **stable** release (0.11.0) provided with this config.  
> You can also build from source or use your distro’s package manager if preferred.

### 2. Backup Your Old Config (optional)

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

### 3. Clone This Config

```bash
git clone https://github.com/drewgrif/nvim ~/.config/nvim
```

### 4. Launch Neovim

```bash
nvim
```

The config will auto-install plugins on first launch.

---

## ⌨️ Keybindings

Launch the `which-key` popup anytime with `<leader>`. Below are the default keymaps:

### 🔁 General

| Keybinding | Action |
|------------|--------|
| `<leader>a` | Select all (`gg<S-v>G`) |
| `<leader>q` | Close current buffer |
| `<` / `>` in visual mode | Indent left/right and reselect |
| `<Tab>` / `<S-Tab>` | Next / Previous buffer |

### 🪟 Window Management

| Keybinding | Action |
|------------|--------|
| `<leader>v` | Vertical split |
| `<leader>s` | Horizontal split |
| `<C-Left>` / `<C-Right>` | Resize vertical split |

### 🧭 Tab Navigation

| Keybinding | Action |
|------------|--------|
| `<leader>t` | New tab |
| `<leader>x` | Close current tab |
| `<leader>j` / `<leader>k` | Previous / Next tab |

### 📁 File Explorer (Oil.nvim)

| Keybinding | Action |
|------------|--------|
| `<leader>e` | Toggle Oil (floating file manager) |

### 🔍 Telescope Search

| Keybinding | Action |
|------------|--------|
| `<leader>ff` | Find files |
| `<leader>fw` | Live grep |
| `<leader>fh` | Help tags |
| `<leader>fc` | Find files in `~/.config/nvim` |
| `<leader>gc` | Git branches (Telescope) |


### 📝 Markdown

| Keybinding | Action |
|------------|--------|
| `<leader>md` | Toggle Markdown preview |

### 🚀 Dashboard

| Keybinding | Action |
|------------|--------|
| `<leader>m` | Open Alpha dashboard |

🔧 All keybindings are defined in:

```
lua/core/mappings.lua
```

---

## 🎨 Colorschemes

This config uses [**github-nvim-theme**](https://github.com/projekt0n/github-nvim-theme) with the `github_dark_default` variant.

You can change themes easily by editing your `init.lua` or `colorscheme.lua`.

---

## 🛠 Requirements

- `ripgrep` (for Telescope live grep)
- `fd` (for fast file searching)
- `nerd-fonts` (recommended for icons)

Install them with:

```bash
sudo apt install ripgrep fd-find
```

(Also make sure you’re using a Nerd Font terminal like WezTerm, Kitty, or Alacritty.)

---

## 📁 Directory Structure

```text
nvim/
├── init.lua                  # Entry point
├── lua/
│   ├── core/                 # Options and mappings
│   ├── config/               # Plugin configs and general settings
│   ├── plugins/              # Plugin declarations for lazy.nvim
│   └── colorscheme/          # Custom themes + lualine support
└── nvim-linux-x86_64.deb     # Latest Neovim .deb installer (0.11.0)
```

---

## 🙋‍♂️ Maintained By

**JustAGuy Linux**

🖥️ YouTube: [JustAGuy Linux](https://youtube.com/@justaguylinux)  
