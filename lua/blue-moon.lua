-- vim:fdm=marker

local util = require'blue-moon.util'

local M = {}

-- Highlight Function And Color definitons {{{

local function highlight(group, styles)
  local gui = styles.gui and 'gui='..styles.gui or 'gui=NONE'
  local sp = styles.sp and 'guisp='..styles.sp or 'guisp=NONE'
  local fg = styles.fg and 'guifg='..styles.fg or 'guifg=NONE'
  local bg = styles.bg and 'guibg='..styles.bg or 'guibg=NONE'
  vim.api.nvim_command('highlight! '..group..' '..gui..' '..sp..' '..fg..' '..bg)
end

local bg_dark        = '#1b1e2b'
local bg             = '#292d3e'
local bg_light       = '#32374d'
local bg_lighter     = '#444267'
local grey           = '#8796b0'
local grey_dark      = '#353b52'
local red            = '#d06178'
local heavy_red      = '#e61f44'
local green          = '#b4c4b4'
local green_high     = '#bcd9c4'
local blue           = '#959dcb'
local blue_light     = '#b8bcf3'
local yellow         = '#cfcfbf'
local yellow_light   = '#dfdf9f'
local orange         = '#b4b4b4'
local orange_light   = '#c2b0b0'
local purple         = '#b9a3eb'
local cyan_dark      = '#89bbdd'
local cyan           = '#89ddff'
local fg             = '#a6accd'
local fg_light       = '#fbfbfb'
local fg_dark        = '#676e96'
local hollow         = '#424760'
local hollow_lighter = '#30354e'
local white          = '#ffffff'

-- }}}

-- Editor Highlight Groups {{{

local editor_syntax = {
  ColorColumn  = { bg = bg_light },
  CursorLine   = { bg = bg },
  Cursor       = { fg = bg_dark, bg = yellow },
  Directory    = { fg = blue, gui = 'bold' },
  DiffAdd      = { fg = green },
  DiffChange   = { fg = yellow },
  DiffDelete   = { fg = red },
  DiffText     = { fg = blue },
  EndOfBuffer  = { bg = bg_dark, fg = bg_dark },
  ErrorMsg     = { fg = red, gui = 'bold' },
  VertSplit    = { bg = bg_dark, fg = bg },
  Folded       = { fg = fg_dark, gui = 'italic' },
  FoldColumn   = { fg = yellow },
  SignColumn   = { fg = yellow },
  IncSearch    = { bg = yellow, fg = bg },
  Substitute   = { bg = blue, fg = bg },
  LineNr       = { fg = fg_dark },
  CursorLineNr = { fg = fg },
  MatchParen   = { fg = cyan, gui = 'bold' },
  Normal       = { fg = fg_light, bg = bg_dark },
  NormalFloat  = { bg = grey_dark, fg = white },
  Pmenu        = { bg = grey_dark, fg = fg_light },
  PmenuSel     = { bg = cyan, fg = bg_lighter, gui = 'bold' },
  PmenuSbar    = { bg = bg_lighter },
  PmenuThumb   = { bg = fg },
  Search       = { bg = hollow },
  SpecialKey   = { bg = bg_light },
  SpellBad     = { gui = 'undercurl', sp = red },
  SpellCap     = { gui = 'undercurl', sp = yellow },
  SpellLocal   = { gui = 'undercurl', sp = orange },
  SpellRare    = { gui = 'undercurl', sp = blue },
  TabLine      = { bg = bg_dark, fg = fg_light },
  TabLineFill  = { bg = bg_dark, fg = fg_light },
  TabLineSel   = { bg = cyan, fg = bg_dark, gui = 'bold'},
  Title        = { fg = green },
  Visual       = { bg = hollow_lighter },
  VisualNOS    = { bg = hollow_lighter },
  WarningMsg   = { fg = yellow, gui = 'italic' },
  Whitespace   = { bg = yellow }, -- TODO: i don't know where this is

  -- lsp
  DiagnosticError = { fg = red, gui = 'bold', bg = util.darken(red, 0.1) },
  DiagnosticWarn = { fg = orange, gui ='bold', bg = util.darken(orange, 0.1) },
  DiagnosticInfo = { fg = yellow, gui = 'bold', bg = util.darken(yellow, 0.1) },
  DiagnosticHint = { fg = green, gui = 'bold', bg = util.darken(green, 0.1) },

  DiagnosticUnderlineError   = { gui = 'undercurl', sp = red },
  DiagnosticUnderlineWarn = { gui = 'undercurl', sp = yellow },
  DiagnosticUnderlineInfo = { gui = 'undercurl', sp = green_high },
  DiagnosticUnderlineHint = { gui = 'undercurl', sp = green },

  -- git highlighting
  gitcommitComment        = { fg = fg_dark, gui = 'italic' },
  gitcommitUntracked      = { fg = fg_dark, gui = 'italic' },
  gitcommitDiscarded      = { fg = fg_dark, gui = 'italic' },
  gitcommitSelected       = { fg = fg_dark, gui = 'italic' },
  gitcommitUnmerged       = { fg = green },
  gitcommitBranch         = { fg = purple },
  gitcommitNoBranch       = { fg = purple },
  gitcommitDiscardedType  = { fg = red },
  gitcommitSelectedType   = { fg = green },
  gitcommitUntrackedFile  = { fg = cyan },
  gitcommitDiscardedFile  = { fg = red },
  gitcommitDiscardedArrow = { fg = red },
  gitcommitSelectedFile   = { fg = green },
  gitcommitSelectedArrow  = { fg = green },
  gitcommitUnmergedFile   = { fg = yellow },
  gitcommitUnmergedArrow  = { fg = yellow },
  gitcommitSummary        = { fg = fg_light },
  gitcommitOverflow       = { fg = red },
  gitcommitOnBranch      = {},
  gitcommitHeader        = {},
  gitcommitFile          = {},

  -- User dependent groups, probably useless to change the default:
  Conceal      = {},
  ModeMsg      = {},
  MsgArea      = {},
  MsgSeparator = {},
  MoreMsg      = {},
  NonText      = {},
  Question     = {},
  QuickFixLine = {},
  StatusLine   = {},
  StatusLineNC = {},
  WildMenu     = {}
}

-- }}}

-- Vim Default Code Syntax {{{

local code_syntax = {
  Comment        = { fg = fg_dark, gui = 'italic' },
  Constant       = { fg = cyan },
  String         = { fg = green },
  Character      = { fg = green, gui = 'bold' },
  Number         = { fg = orange },
  Float          = { fg = orange },
  Boolean        = { fg = orange },

  Identifier     = { fg = heavy_red },
  Function       = { fg = blue, gui = 'italic' },

  Statement      = { fg = blue_light, gui = 'italic' },
  Conditional    = { fg = blue, gui = 'italic' },
  Repeat         = { fg = blue, gui = 'italic' },
  Label          = { fg = blue, gui = 'italic' },
  Exception      = { fg = blue, gui = 'italic' },
  Operator       = { fg = blue },
  Keyword        = { fg = heavy_red },

  Include        = { fg = blue_light },
  Define         = { fg = purple },
  Macro          = { fg = purple },
  PreProc        = { fg = yellow },
  PreCondit      = { fg = yellow },

  Type           = { fg = yellow },
  StorageClass   = { fg = yellow },
  Structure      = { fg = yellow },
  Typedef        = { fg = yellow },

  Special        = { fg = blue },
  SpecialChar    = {},
  Tag            = { fg = orange },
  SpecialComment = { fg = fg_dark, gui = 'bold' },
  Debug          = {},
  Delimiter      = {},

  Ignore         = {},
  Underlined     = { gui = 'underline' },
  Error          = { fg = heavy_red },
  Todo           = { fg = purple, gui = 'bold' },
}

-- }}}

-- Plugin Highlight Groups {{{

local plugin_syntax = {
  GitGutterAdd           = { fg = green },
  GitGutterChange        = { fg = yellow },
  GitGutterDelete        = { fg = red },
  GitGutterChangeDelete  = { fg = orange },

  diffAdded              = { fg = green },
  diffRemoved            = { fg = heavy_red },

  ['@punctuation.delimiter'] = { fg = white },
  ['@punctuation.bracket']   = { fg = cyan_dark },
  ['@punctuation.special']   = { fg = cyan },

  ['@constant']         = { fg = yellow },
  ['@constant.builtin'] = { fg = orange },
  ['@constant.macro']   = { fg = yellow },

  ['@string']         = { fg = green },
  ['@string.regex']   = { fg = cyan_dark },
  ['@string.escape']  = { fg = cyan_dark },
  ['@string.special'] = { fg = cyan },

  ['@number']               = { fg = orange },
  ['@boolean']              = { fg = orange },
  ['@float']                = { fg = orange },

  ['@function']         = { fg = blue_light },
  ['@function.call']    = { fg = blue_light },
  ['@function.builtin'] = { fg = purple },
  ['@function.macro']   = { fg = orange },

  ['@parameter']   = { fg = white },
  ['@constructor'] = { fg = yellow },

  ['@method']      = { fg = blue_light },
  ['@method.call'] = { fg = blue_light },

  ['@field']                = { fg = blue_light },
  ['@property']             = { fg = blue_light },

  ['@conditional']          = { fg = blue, gui = 'italic' },
  ['@repeat']               = { fg = blue, gui = 'italic' },
  ['@exception']            = { fg = blue, gui = 'italic' },
  ['@label']                = { fg = cyan_dark, gui = 'italic' },
  ['@debug']                = { fg = cyan_dark, gui = 'italic' },
  ['@include']              = { fg = cyan_dark },

  ['@operator'] = { fg = cyan },
  ['@comment']  = { fg = fg_dark, gui = 'italic' },
  ['@error']    = {},
  ['@preproc']  = { fg = yellow },
  ['@define']   = { fg = purple },

  ['@keyword']          = { fg = blue },
  ['@keyword.function'] = { fg = blue_light },
  ['@keyword.operator'] = { fg = cyan },
  ['@keyword.return']   = { fg = blue },

  ['@type']            = { fg = yellow },
  ['@type.builtin']    = { fg = orange },
  ['@type.definition'] = { fg = blue },
  ['@type.qualifier']  = { fg = yellow },

  ['@tag']           = { fg = blue_light },
  ['@tag.delimiter'] = { fg = cyan },
  ['@tag.attribute'] = { fg = blue_light },

  ['@symbol']           = { fg = orange_light },
  ['@variable']         = { fg = "NONE" },
  ['@variable.builtin'] = { fg = orange },

  ['@text.title'] = { gui = 'bold,underline' },
  ['@text.reference'] = { fg = cyan },
  ['@text.uri'] = { gui = 'underline', fg = green },

  -- nvim-cmp
  CmpItemAbbr = { fg = white },
  CmpItemAbbrDeprecated = { fg = red },
  CmpItemAbbrMatch = { fg = white },
  CmpItemAbbrMatchFuzzy = { fg = cyan },
  -- TODO: not sure where this goes
  CmpItemKind = { fg = cyan, gui = 'bold' },
  CmpItemMenu = { fg = cyan },

  NeotestAdapterName = { fg = blue_light },
  NeotestBorder = { fg = '#ffa000' }, -- TODO
  NeotestDir = { fg = blue, gui = 'bold' },
  NeotestExpandMarker = { fg = grey },
  NeotestFailed = { fg = heavy_red },
  NeotestFile = { fg = purple, gui = 'bold,italic' },
  NeotestFocused = { gui = 'bold,underline' },
  NeotestIndent = { fg = grey },
  NeotestMarked = { fg = green_high, gui = 'bold,italic,underline' },
  NeotestNamespace = { fg = purple },
  NeotestPassed = { fg = green_high },
  NeotestRunning = { fg = yellow },
  NeotestWinSelect = { fg = '#0022ff' }, -- TODO
  NeotestSkipped = { fg = '#ff00ff' }, -- TODO
  NeotestTarget = { fg = '#00ffff' }, -- TODO
  NeotestTest = { fg = green },
  NeotestUnknown = { fg = grey, gui = 'bold' },

  NvimTreeLspDiagnosticsError = { fg = red, gui = 'bold' },
  NvimTreeLspDiagnosticsWarning = { fg = orange, gui = 'bold' },
  NvimTreeLspDiagnosticsInformation = { fg = yellow, gui = 'bold' },
  NvimTreeLspDiagnosticsHint = { fg = green, gui = 'bold' },

  GitSignsAdd = { fg = green_high },
  GitSignsChange = { fg = orange_light },
  GitSignsDelete = { fg = heavy_red },
  GitSignsTopDelete = { fg = heavy_red },
  GitSignsChangeDelete = { fg = yellow_light },
}

-- }}}

-- Setting Neovim Terminal Color {{{

function M.setup()
  for group, styles in pairs(editor_syntax) do
    highlight(group, styles)
  end

  for group, styles in pairs(code_syntax) do
    highlight(group, styles)
  end

  for group, styles in pairs(plugin_syntax) do
    highlight(group, styles)
  end

  vim.api.nvim_set_var('terminal_color_0',          bg_dark)
  vim.api.nvim_set_var('terminal_color_1',          red)
  vim.api.nvim_set_var('terminal_color_2',          green)
  vim.api.nvim_set_var('terminal_color_3',          yellow)
  vim.api.nvim_set_var('terminal_color_4',          blue)
  vim.api.nvim_set_var('terminal_color_5',          purple)
  vim.api.nvim_set_var('terminal_color_6',          cyan)
  vim.api.nvim_set_var('terminal_color_7',          fg)
  vim.api.nvim_set_var('terminal_color_8',          grey)
  vim.api.nvim_set_var('terminal_color_9',          red)
  vim.api.nvim_set_var('terminal_color_10',         green)
  vim.api.nvim_set_var('terminal_color_11',         orange)
  vim.api.nvim_set_var('terminal_color_12',         blue)
  vim.api.nvim_set_var('terminal_color_13',         purple)
  vim.api.nvim_set_var('terminal_color_14',         cyan)
  vim.api.nvim_set_var('terminal_color_15',         white)
  vim.api.nvim_set_var('terminal_color_background', bg_dark)
  vim.api.nvim_set_var('terminal_color_foreground', fg_light)
end

-- }}}

return M
