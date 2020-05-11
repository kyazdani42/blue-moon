local api = vim.api

local colors = {
    normal = {},
    inactive = {},
    insert = {},
    replace = {},
    visual = {},
    tabline = {}
}

local function create_color(color)
    return { color, 0, 0 }
end

local colors_menu_grey      = create_color("#292d3e")
local colors_blue           = create_color("#959dcb")
local colors_green          = create_color("#d0e7d0")
local colors_purple         = create_color("#a9a3db")
local colors_yellow         = create_color("#cfcfbf")
local colors_red            = create_color("#d06179")
local colors_cyan           = create_color("#89bbdd")
local colors_comment_grey   = create_color("#697098")
local colors_black          = create_color("#1b1e2b")

colors.normal.left     = { { colors_black, colors_purple }, { colors_purple, colors_menu_grey } }
colors.normal.right    = colors.normal.left
colors.normal.middle   = { { colors_comment_grey, colors_black } }
colors.normal.warning  = { { colors_black, colors_yellow } }
colors.normal.error    = { { colors_black, colors_red } }

colors.insert.left     = { { colors_black, colors_blue }, { colors_blue, colors_menu_grey } }
colors.insert.right    = colors.insert.left
colors.insert.middle   = colors.normal.middle

colors.visual.left     = { { colors_black, colors_cyan }, { colors_cyan, colors_menu_grey } }
colors.visual.right    = colors.visual.left
colors.visual.middle   = colors.normal.middle

colors.replace.left    = { { colors_black, colors_green }, { colors_green, colors_menu_grey } }
colors.replace.right   = colors.replace.left
colors.replace.middle  = colors.normal.middle

colors.tabline.left    = { { colors_yellow, colors_menu_grey } }
colors.tabline.right   = { { colors_black, colors_yellow } }
colors.tabline.middle  = { { colors_black, colors_menu_grey } }
colors.tabline.tabsel  = colors.tabline.right

colors.inactive.left   = { { colors_comment_grey, colors_black }, { colors_comment_grey, colors_black } }
colors.inactive.right  = { { colors_black, colors_black }, { colors_black, colors_black } }
colors.inactive.middle = { {  colors_comment_grey, colors_black } }

local lightline_var       = 'lightline#colorscheme#blue-moon#palette'
local lightline_flat_func = 'lightline#colorscheme#flatten'
local colors_flattened    =  api.nvim_call_function(lightline_flat_func, { colors })

api.nvim_set_var(lightline_var, colors_flattened)
