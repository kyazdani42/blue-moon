# blue-moon

A dark color scheme for Neovim derived from palenight and carbonight

## Notices

- Support for [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) and related plugins.
- Consider using [vim-polyglot](https://github.com/sheerun/vim-polyglot) if you are not using treesitter.

## Installation

Using packer:
```lua
use {
  "kyazdani42/blue-moon",
  config = function()
    vim.opt.termguicolors = true
    vim.cmd "colorscheme blue-moon"
  end
}
```

## Additional support

To configure lightline, add the following line:
```vim
let g:lightline = { 'colorscheme': 'blue-moon' }
```

## Screenshots

![fullvim](https://user-images.githubusercontent.com/23156099/198065840-c7e150dc-4ec6-48b5-9011-f3839616b911.jpg)
![git](https://user-images.githubusercontent.com/23156099/198065852-5b58a2cb-0dfb-45c4-9bac-fe1146ce10d8.jpg)
![c_example](https://user-images.githubusercontent.com/23156099/198065833-95ca1472-9998-452d-a248-339aeda83b68.jpg)
![rust_example](https://user-images.githubusercontent.com/23156099/198065856-3b258529-38c8-40e3-b835-4d97d240ea62.jpg)
