-- vim:fdm=marker

local util = require'blue-moon.util'

local M = {}

-- Highlight Function And Color definitons {{{

local function highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
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
local heavy_green    = '#acfab4'
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
  Directory    = { fg = blue, bold = true },
  DiffAdd      = { fg = green },
  DiffChange   = { fg = yellow },
  DiffDelete   = { fg = red },
  DiffText     = { fg = blue },
  EndOfBuffer  = { bg = bg_dark, fg = bg_dark },
  ErrorMsg     = { fg = red, bold = true },
  VertSplit    = { bg = bg_dark, fg = bg },
  Folded       = { fg = fg_dark, italic = true },
  FoldColumn   = { fg = yellow },
  SignColumn   = { fg = yellow },
  IncSearch    = { bg = yellow, fg = bg },
  Substitute   = { bg = blue, fg = bg },
  LineNr       = { fg = fg_dark },
  CursorLineNr = { fg = fg },
  MatchParen   = { fg = cyan, bold = true },
  Normal       = { fg = fg_light, bg = bg_dark },
  NormalFloat  = { bg = bg_dark },
  FloatBorder  = { fg = bg_light },
  FloatTitle   = { bg = bg_dark, fg = fg_light },
  Pmenu        = { bg = grey_dark, fg = fg_light },
  PmenuSel     = { bg = cyan, fg = bg_lighter, bold = true },
  PmenuSbar    = { bg = bg_lighter },
  PmenuThumb   = { bg = fg },
  Search       = { bg = hollow },
  SpecialKey   = { bg = bg_light },
  SpellBad     = { undercurl = true, sp = red },
  SpellCap     = { undercurl = true, sp = yellow },
  SpellLocal   = { undercurl = true, sp = orange },
  SpellRare    = { undercurl = true, sp = blue },
  TabLine      = { bg = bg_dark, fg = fg_light },
  TabLineFill  = { bg = bg_dark, fg = fg_light },
  TabLineSel   = { bg = cyan, fg = bg_dark, bold = true},
  Title        = { fg = green },
  Visual       = { bg = hollow_lighter },
  VisualNOS    = { bg = hollow_lighter },
  WarningMsg   = { fg = yellow, italic = true },
  Whitespace   = { bg = bg_dark },
  WinSeparator = { fg = bg },
  WinBar = { bg = bg_dark, fg = fg },

  -- lsp
  DiagnosticError = { fg = red, bold = true, bg = util.darken(red, 0.1) },
  DiagnosticWarn = { fg = orange, bold = true, bg = util.darken(orange, 0.1) },
  DiagnosticInfo = { fg = yellow, bold = true, bg = util.darken(yellow, 0.1) },
  DiagnosticHint = { fg = green, bold = true, bg = util.darken(green, 0.1) },
  DiagnosticOk   = { fg = green_high, bold = true, bg = util.darken(green_high, 0.1) },

  DiagnosticUnderlineError   = { undercurl = true, sp = red },
  DiagnosticUnderlineWarn = { undercurl = true, sp = orange },
  DiagnosticUnderlineInfo = { undercurl = true, sp = yellow },
  DiagnosticUnderlineHint = { undercurl = true, sp = green },
  DiagnosticUnderlineOk = { undercurl = true, sp = green_high },

  -- TODO: maybe implement this at some point, disable for now
  ['@lsp.type.class'] = {},
  ['@lsp.type.decorator'] = {},
  ['@lsp.type.enum'] = {},
  ['@lsp.type.enumMember'] = {},
  ['@lsp.type.function'] = {},
  ['@lsp.type.interface'] = {},
  ['@lsp.type.macro'] = {},
  ['@lsp.type.method'] = {},
  ['@lsp.type.namespace'] = {},
  ['@lsp.type.parameter'] = {},
  ['@lsp.type.property'] = {},
  ['@lsp.type.struct'] = {},
  ['@lsp.type.type'] = {},
  ['@lsp.type.typeParameter'] = {},
  ['@lsp.type.variable'] = {},

  -- git highlighting
  gitcommitComment        = { fg = fg_dark, italic = true },
  gitcommitUntracked      = { fg = fg_dark, italic = true },
  gitcommitDiscarded      = { fg = fg_dark, italic = true },
  gitcommitSelected       = { fg = fg_dark, italic = true },
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
  Comment        = { fg = fg_dark, italic = true },
  Constant       = { fg = cyan },
  String         = { fg = green },
  Character      = { fg = green, bold = true },
  Number         = { fg = orange },
  Float          = { fg = orange },
  Boolean        = { fg = orange },

  Identifier     = { fg = heavy_red },
  Function       = { fg = blue, italic = true },

  Statement      = { fg = blue_light, italic = true },
  Conditional    = { fg = blue, italic = true },
  Repeat         = { fg = blue, italic = true },
  Label          = { fg = blue, italic = true },
  Exception      = { fg = blue, italic = true },
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
  SpecialComment = { fg = fg_dark, bold = true },
  Debug          = {},
  Delimiter      = {},

  Ignore         = {},
  Underlined     = { underline = true },
  Error          = { fg = heavy_red },
  Todo           = { fg = purple, bold = true },
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

  ['@string']        = { fg = green },
  ['@string.regexp'] = { fg = cyan_dark },
  ['@string.escape'] = { fg = cyan_dark },

  ['@number']       = { fg = orange },
  ['@boolean']      = { fg = orange },
  ['@number.float'] = { fg = orange },

  ['@function']         = { fg = blue_light },
  ['@function.call']    = { fg = blue_light },
  ['@function.builtin'] = { fg = purple },
  ['@function.macro']   = { fg = orange },

  ['@variable.parameter'] = { fg = white },
  ['@constructor']        = { fg = yellow },

  ['@function.method']      = { fg = blue_light },
  ['@function.method.call'] = { fg = blue_light },

  ['@variable.member']      = { fg = blue_light },
  ['@property']             = { fg = blue_light },

  ['@keyword.conditional']  = { fg = blue, italic = true },
  ['@keyword.repeat']       = { fg = blue, italic = true },
  ['@keyword.exception']    = { fg = blue, italic = true },
  ['@label']                = { fg = cyan_dark, italic = true },
  ['@keyword.debug']        = { fg = cyan_dark, italic = true },
  ['@keyword.import']       = { fg = cyan_dark },
  ['@module']               = { fg = yellow },

  ['@operator'] = { fg = cyan },
  ['@comment']  = { fg = fg_dark, italic = true },

  ['@keyword.directive']        = { fg = yellow },
  ['@keyword.directive.define'] = { fg = purple },

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

  ['@string.special.symbol'] = { fg = orange_light },
  ['@variable']              = {},
  ['@variable.builtin']      = { fg = orange },

  ['@markup.heading'] = { bold = true, underline = true },
  ['@markup.link'] = { fg = cyan },
  ['@markup.link.url'] = { underline = true, fg = green },
  ['@string.special.url'] = { underline = true, fg = green },
  ['@markup.link.label'] = { fg = cyan },
  ['@markup.list']   = { fg = cyan },
  ['@comment.warning'] = { fg = purple, bold = true },

  ['@diff.plus'] = { bg = util.darken(heavy_green, 0.3) },
  ['@diff.minus'] = { bg = util.darken(heavy_red, 0.3) },
  ['@diff.delta'] = { bg = util.darken(purple, 0.3) },

  -- nvim-cmp
  CmpItemAbbr = { fg = white },
  CmpItemAbbrDeprecated = { fg = red },
  CmpItemAbbrMatch = { fg = white },
  CmpItemAbbrMatchFuzzy = { fg = cyan },
  -- TODO: not sure where this goes
  CmpItemKind = { fg = cyan, bold = true },
  CmpItemMenu = { fg = cyan },

  NeotestAdapterName = { fg = blue_light },
  NeotestBorder = { fg = '#ffa000' }, -- TODO
  NeotestDir = { fg = blue, bold = true },
  NeotestExpandMarker = { fg = grey },
  NeotestFailed = { fg = heavy_red },
  NeotestFile = { fg = purple, bold = true, italic = true },
  NeotestFocused = { bold = true, underline = true },
  NeotestIndent = { fg = grey },
  NeotestMarked = { fg = green_high, bold = true, italic = true, underline = true },
  NeotestNamespace = { fg = purple },
  NeotestPassed = { fg = green_high },
  NeotestRunning = { fg = yellow },
  NeotestWinSelect = { fg = '#0022ff' }, -- TODO
  NeotestSkipped = { fg = '#ff00ff' }, -- TODO
  NeotestTarget = { fg = '#00ffff' }, -- TODO
  NeotestTest = { fg = green },
  NeotestUnknown = { fg = grey, bold = true },

  NvimTreeLspDiagnosticsError = { fg = red, bold = true },
  NvimTreeLspDiagnosticsWarning = { fg = orange, bold = true },
  NvimTreeLspDiagnosticsInformation = { fg = yellow, bold = true },
  NvimTreeLspDiagnosticsHint = { fg = green, bold = true },

  NvimTreeFolderArrowClosed = { fg = grey },
  NvimTreeFolderArrowOpen = { fg = grey },
  NvimTreeRootFolder = { fg = purple },
  NvimTreeSpecialFile = { fg = yellow, bold = true, underline = true },
  NvimTreeExecFile = { fg = green, bold = true },
  NvimTreeSymlink = { fg = cyan, bold = true },

  NvimTreeGitDeletedIcon = { fg = red },
  NvimTreeGitDirtyIcon = { fg = red },
  NvimTreeGitRenamedIcon = { fg = purple },
  NvimTreeGitNewIcon = { fg = yellow },
  NvimTreeGitStagedIcon = { fg = green },
  NvimTreeGitMergeIcon = { fg = yellow },
  NvimTreeGitIgnoredIcon = { fg = grey },

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
