# blue-moon

A dark color scheme for Neovim derived from palenight and carbonight

## Notices

- This plugin works better with [vim-polyglot](https://github.com/sheerun/vim-polyglot)
- I don't want to bother with non true color and terminal colors because don't use a tty, i use the good old [alacritty](https://github.com/alacritty/alacritty)

## Installation
Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'kyazdani42/blue-moon'
```

## Setup 

You'll need to enable `termguicolors` for the theme to work properly
```vim
set termguicolors
colorscheme blue-moon
```

To configure lightline, add the following line:
```vim
let g:lightline = { 'colorscheme': 'blue-moon' }
```

## Screenshot

![alt text](.github/rust.png?raw=true "rust vim")
