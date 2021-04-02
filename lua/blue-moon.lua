-- vim:fdm=marker
-- Vim Color File
-- Name:       blue-moon.lua
-- Maintainer: https://github.com/kyazdani42
-- License:    The MIT License (MIT)

local M = {}

-- Highlight Function And Color definitons {{{

local function highlight(group, styles)
  local gui = styles.gui and 'gui='..styles.gui or 'gui=NONE'
  local sp = styles.sp and 'guisp='..styles.sp or 'guisp=NONE'
  local fg = styles.fg and 'guifg='..styles.fg or 'guifg=NONE'
  local bg = styles.bg and 'guibg='..styles.bg or 'guibg=NONE'
  vim.api.nvim_command('highlight! '..group..' '..gui..' '..sp..' '..fg..' '..bg)
end

local bg_darker      = '#121622'
local bg_dark        = '#1b1e2b'
local bg             = '#292d3e'
local bg_light       = '#32374d'
local bg_lighter     = '#444267'
local grey           = '#8796b0'
local grey_dark      = '#353b52'
local red            = '#d06178'
local red_dimmed     = '#a05168'
local heavy_red      = '#e61f44'
local green          = '#b4c4b4'
local green_high     = '#bcd9c4'
local blue           = '#959dcb'
local blue_light     = '#b8bcf3'
local yellow         = '#cfcfbf'
local orange         = '#b4b4b4'
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
  SpellBad     = { gui = 'underline', sp = red },
  SpellCap     = { gui = 'underline', sp = yellow },
  SpellLocal   = { gui = 'underline', sp = orange },
  SpellRare    = { gui = 'underline', sp = blue },
  TabLine      = { bg = bg_dark, fg = fg_light },
  TabLineFill  = { bg = bg_dark, fg = fg_light },
  TabLineSel   = { bg = cyan, fg = bg_dark, gui = 'bold'},
  Title        = { fg = green },
  Visual       = { bg = hollow_lighter },
  VisualNOS    = { bg = hollow_lighter },
  WarningMsg   = { fg = yellow, gui = 'italic' },
  Whitespace   = { bg = yellow }, -- TODO: i don't know where this is

  -- lsp
  LspDiagnosticsDefaultError = { fg = red_dimmed },
  LspDiagnosticsDefaultWarning = { fg = orange },
  LspDiagnosticsDefaultInformation = { fg = yellow },
  LspDiagnosticsDefaultHint = { fg = yellow },

  LspDiagnosticsUnderlineError   = { gui = 'underline', sp = red },
  LspDiagnosticsUnderlineWarning = { gui = 'underline', sp = yellow },
  LspDiagnosticsUnderlineInformation = { gui = 'underline', sp = green_high },
  LspDiagnosticsUnderlineHint = { gui = 'underline', sp = green },

-- LspDiagnosticsFloatingError
--   Used to color "Error" diagnostic messages in diagnostics float.
--   See |vim.lsp.diagnostic.show_line_diagnostics()|

-- LspDiagnosticsFloatingWarning
--   Used to color "Warning" diagnostic messages in diagnostics float.
--   See |vim.lsp.diagnostic.show_line_diagnostics()|

-- LspDiagnosticsFloatingInformation
--   Used to color "Information" diagnostic messages in diagnostics float.
--   See |vim.lsp.diagnostic.show_line_diagnostics()|

-- LspDiagnosticsFloatingHint
--   Used to color "Hint" diagnostic messages in diagnostics float.
--   See |vim.lsp.diagnostic.show_line_diagnostics()|

-- LspDiagnosticsSignError
--   Used for "Error" signs in sign column.
--   See |vim.lsp.diagnostic.set_signs()|

-- LspDiagnosticsSignWarning
--   Used for "Warning" signs in sign column.
--   See |vim.lsp.diagnostic.set_signs()|

-- LspDiagnosticsSignInformation
--   Used for "Information" signs in sign column.
--   See |vim.lsp.diagnostic.set_signs()|

-- LspDiagnosticsSignHint
--   Used for "Hint" signs in sign column.
--   See |vim.lsp.diagnostic.set_signs()|


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

  TSError                = {},
  TSPunctDelimiter       = { fg = white },
  TSPunctBracket         = { fg = cyan_dark },
  TSPunctSpecial         = { fg = cyan },
  TSConstant             = { fg = yellow },
  TSConstBuiltin         = { fg = orange },
  TSConstMacro           = { fg = yellow },
  TSString               = { fg = green },
  TSStringRegex          = { fg = cyan_dark },
  TSStringEscape         = { fg = cyan_dark },
  TSNumber               = { fg = orange },
  TSBoolean              = { fg = orange },
  TSFloat                = { fg = orange },
  TSFunction             = { fg = blue_light },
  TSKeywordFunction      = { fg = blue_light },
  TSFuncBuiltin          = { fg = purple },
  TSFuncMacro            = { fg = orange },
  TSParameter            = { fg = white },
  TSParameterReference   = { fg = green_high },
  TSMethod               = { fg = blue_light },
  TSField                = { fg = blue_light },
  TSProperty             = { fg = blue_light },
  TSConstructor          = { fg = yellow },
  TSConditional          = { fg = blue, gui = 'italic' },
  TSRepeat               = { fg = blue, gui = 'italic' },
  TSException            = { fg = blue, gui = 'italic' },
  TSLabel                = { fg = cyan_dark, gui = 'italic' },
  TSOperator             = { fg = cyan },
  TSKeyword              = { fg = blue },
  TSType                 = { fg = yellow },
  TSTypeBuiltin          = { fg = orange },
  TSStructure            = { fg = orange },
  TSInclude              = { fg = cyan_dark },
  TSTag                  = { fg = blue_light },
  TSTagDelimiter         = { fg = cyan },
  -- TSAnnotation = {},
  TSVariable = { fg = fg_light },
  TSVariableBuiltin = { fg = orange },
  -- TSDefinitionUsage = {},
  -- TSDefinition = {},
  -- TSCurrentScope                 = {},
  -- TSText                 = {},
  -- TSStrong               = {},
  -- TSEmphasis             = {},
  -- TSUnderline            = {},
  -- TSTitle                = {},
  -- TSLiteral              = {},
  -- TSURI                  = {},
}

-- }}}

-- Syntax Plugin And Language Highlight Groups {{{

local lang_syntax = {
  -- lua.vim
  luaTable          = { fg = fg_light },
  luaBraces         = { fg = cyan },
  luaIn             = { fg = blue, gui = 'italic' },
  -- lua polyglot (tbastos/vim-lua)
  luaFunc           = { fg = blue_light },
  luaFuncCall       = { fg = blue_light },
  luaFuncName       = { fg = blue_light },
  luaBuiltIn        = { fg = blue_light },
  luaFuncTable      = { fg = blue, gui = 'italic' },
  luaFuncId         = { fg = blue, gui = 'italic' },
  luaLocal          = { fg = purple },
  luaSpecialValue   = { fg = purple },
  luaStatement      = { fg = purple },
  luaFunction       = { fg = blue, gui = 'italic' },
  luaCond           = { fg = blue, gui = 'italic' },
  luaElse           = { fg = blue, gui = 'italic' },
  luaOperator       = { fg = blue, gui = 'italic' },
  luaSymbolOperator = { fg = cyan },
  luaConstant       = { fg = orange },

  -- zsh.vim
  zshTodo            = code_syntax.Todo,
  zshComment         = code_syntax.Comment,
  zshPreProc         = code_syntax.PreProc,
  zshString          = code_syntax.String,
  zshStringDelimiter = { fg = cyan },
  zshPrecommand      = { fg = blue },
  zshKeyword         = code_syntax.Function,
  zshCommands        = { fg = blue },
  zshOptStart        = { fg = blue, gui = 'italic' },
  zshOption          = { fg = cyan, gui = 'italic' },
  zshNumber          = code_syntax.Number,
  zshSubst           = { fg = yellow },
  zshSubstDelim      = { fg = cyan },

  -- rust polyglot (rust.vim)
  rustKeyword     = { fg = orange },
  rustFuncCall    = { fg = blue_light },
  rustModPathSep  = { fg = cyan },
  rustIdentifier  = { fg = fg_light },
  rustFuncName    = { fg = blue },
  rustSigil       = { fg = cyan },
  rustMacro       = { fg = blue_light },
  rustStorage     = { fg = orange },
  rustModPath     = { fg = fg_light },
  rustEnumVariant = { fg = fg_light },
  rustStructure   = { fg = orange },
  rustTypedef     = { fg = orange },

  -- javascript polyglot (pangloss/vim-javascript)
  jsFunction            = { fg = cyan, gui = 'italic' },
  jsFuncName            = { fg = blue },
  jsImport              = { fg = cyan, gui = 'italic' },
  jsFrom                = { fg = cyan, gui = 'italic' },
  jsStorageClass        = { fg = purple },
  jsAsyncKeyword        = { fg = cyan, gui = 'italic' },
  jsForAwait            = { fg = cyan, gui = 'italic' },
  jsArrowFunction       = { fg = purple },
  jsReturn              = { fg = purple },
  jsFuncCall            = { fg = blue },
  jsFuncBraces          = { fg = cyan },
  jsExport              = { fg = cyan, gui = 'italic' },
  jsGlobalObjects       = { fg = yellow },
  jsxTagName            = { fg = red },
  jsxComponentName      = { fg = yellow },
  jsxAttrib             = { fg = purple },
  jsxBraces             = { fg = cyan },
  jsTemplateBraces      = { fg = cyan },
  jsFuncParens          = { fg = cyan },
  jsDestructuringBraces = { fg = cyan },
  jsObjectBraces        = { fg = cyan },
  jsObjectKey           = { fg = red },
  jsObjectShorthandProp = { fg = fg_light },
  jsNull                = { fg = orange },

  typescriptAsyncFuncKeyword  = { fg = cyan, gui = 'italic' },
  typescriptCall              = { fg = fg_light },
  typescriptBraces            = { fg = cyan },
  typescriptTemplateSB        = { fg = cyan },
  typescriptTry               = { fg = cyan, gui = 'italic' },
  typescriptExceptions        = { fg = cyan, gui = 'italic' },
  typescriptOperator          = { fg = cyan, gui = 'italic' },
  typescriptExport            = { fg = cyan, gui = 'italic' },
  typescriptStatementKeyword  = { fg = cyan, gui = 'italic' },
  typescriptImport            = { fg = cyan, gui = 'italic' },
  typescriptArrowFunc         = { fg = purple },
  typescriptArrowFuncArg      = { fg = fg_light },
  typescriptArrayMethod       = { fg = blue },
  typescriptStringMethod      = { fg = blue },
  typescriptTypeReference     = { fg = yellow },
  typescriptObjectLabel       = { fg = red },
  typescriptParens            = { fg = fg_light },
  typescriptTypeBrackets      = { fg = cyan },
  typescriptXHRMethod         = { fg = blue },
  typescriptResponseProp      = { fg = blue },
  typescriptBOMLocationMethod = { fg = blue },
  typescriptHeadersMethod     = { fg = blue },
  typescriptVariable          = { fg = purple },

  htmlTag = { fg = cyan },
  htmlEndTag = { fg = cyan },

  -- Go
  goDeclaration = { fg = blue, gui = 'italic' },
  goDeclType    = { fg = blue },
  goVar         = { fg = blue, gui = 'italic' },
  goBuiltins    = { fg = cyan_dark },

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
