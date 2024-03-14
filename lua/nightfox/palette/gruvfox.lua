local C = require("nightfox.lib.color")
local Shade = require("nightfox.lib.shade")

-- References:
-- 1. https://lospec.com/palette-list/lost-century
-- 2. https://github.com/morhetz/gruvbox
-- 3. https://github.com/sainnhe/gruvbox-material

local meta = {
  name = "gruvfox",
  light = false,
}

local bg = C("#282828")
local fg = C("#d4be98")

-- stylua: ignore
local palette = {
  black   = Shade.new("#0e0b0d", 0.08, -0.06),
  red     = Shade.new("#da6e56", 0.04, -0.06),
  green   = Shade.new("#a9b964", 0.08, -0.06),
  yellow  = Shade.new("#dbb461", 0.08, -0.06),
  blue    = Shade.new("#8bb2ab", 0.08, -0.06),
  magenta = Shade.new("#bc87a6", 0.12, -0.06),
  cyan    = Shade.new("#8ab884", 0.08, -0.06),
  white   = Shade.new("#dec8a2", 0.08, -0.06),
  orange  = Shade.new("#e3934f", 0.08, -0.06),
  pink    = Shade.new("#da7676", 0.08, -0.06),

  comment = bg:blend(fg, 0.16):brighten(24):to_css(),

  bg0     = bg:brighten(-4):to_css(), -- Dark bg (status line and float)
  bg1     = bg:to_css(), -- Default bg
  bg2     = bg:brighten(4):to_css(), -- Lighter bg (colorcolm folds)
  bg3     = bg:brighten(8):to_css(), -- Lighter bg (cursor line)
  bg4     = bg:blend(fg, 0.24):brighten(24):to_css(), -- Conceal, border fg

  fg0     = fg:brighten(4):to_css(), -- Lighter fg
  fg1     = fg:to_css(), -- Default fg
  fg2     = fg:brighten(-16):to_css(), -- Darker fg (status line)
  fg3     = fg:blend(bg, 0.18):brighten(-24):to_css(), -- Darker fg (line numbers, fold colums)

  sel0    = bg:brighten(14):to_css(), -- Popup bg, visual selection bg
  sel1    = bg:blend(fg, 0.08):brighten(24):to_css(), -- Popup sel bg, search bg
}

local function generate_spec(pal)
  -- stylua: ignore start
  local spec = {
    bg0  = pal.bg0,  -- Dark bg (status line and float)
    bg1  = pal.bg1,  -- Default bg
    bg2  = pal.bg2,  -- Lighter bg (colorcolm folds)
    bg3  = pal.bg3,  -- Lighter bg (cursor line)
    bg4  = pal.bg4,  -- Conceal, border fg

    fg0  = pal.fg0,  -- Lighter fg
    fg1  = pal.fg1,  -- Default fg
    fg2  = pal.fg2,  -- Darker fg (status line)
    fg3  = pal.fg3,  -- Darker fg (line numbers, fold colums)

    sel0 = pal.sel0, -- Popup bg, visual selection bg
    sel1 = pal.sel1, -- Popup sel bg, search bg
  }

  spec.syntax = {
    bracket     = spec.fg2,           -- Brackets and Punctuation
    builtin0    = pal.red.base,       -- Builtin variable
    builtin1    = pal.cyan.bright,    -- Builtin type
    builtin2    = pal.orange.bright,  -- Builtin const
    builtin3    = pal.red.bright,     -- Not used
    comment     = pal.comment,        -- Comment
    conditional = pal.magenta.bright, -- Conditional and loop
    const       = pal.orange.bright,  -- Constants, imports and booleans
    dep         = spec.fg3,           -- Deprecated
    field       = pal.blue.base,      -- Field
    func        = pal.blue.bright,    -- Functions and Titles
    ident       = pal.cyan.base,      -- Identifiers
    keyword     = pal.magenta.base,   -- Keywords
    number      = pal.orange.base,    -- Numbers
    operator    = spec.fg2,           -- Operators
    preproc     = pal.pink.bright,    -- PreProc
    regex       = pal.yellow.bright,  -- Regex
    statement   = pal.magenta.base,   -- Statements
    string      = pal.green.base,     -- Strings
    type        = pal.yellow.base,    -- Types
    variable    = pal.white.base,     -- Variables
  }

  spec.diag = {
    error = pal.red.base,
    warn  = pal.magenta.base,
    info  = pal.blue.base,
    hint  = pal.orange.base,
    ok    = pal.green.base,
  }

  spec.diag_bg = {
    error = C(spec.bg1):blend(C(spec.diag.error), 0.12):to_css(),
    warn  = C(spec.bg1):blend(C(spec.diag.warn), 0.08):to_css(),
    info  = C(spec.bg1):blend(C(spec.diag.info), 0.08):to_css(),
    hint  = C(spec.bg1):blend(C(spec.diag.hint), 0.08):to_css(),
    ok    = C(spec.bg1):blend(C(spec.diag.ok), 0.08):to_css(),
  }

  spec.diff = {
    add    = C(spec.bg1):blend(C(pal.green.dim), 0.18):to_css(),
    delete = C(spec.bg1):blend(C(pal.red.dim), 0.16):to_css(),
    change = C(spec.bg1):blend(C(pal.blue.dim), 0.18):to_css(),
    text   = C(spec.bg1):blend(C(pal.cyan.dim), 0.34):to_css(),
  }

  spec.git = {
    add      = pal.green.base,
    removed  = pal.red.base,
    changed  = pal.yellow.base,
    conflict = pal.orange.base,
    ignored  = pal.comment,
  }

  -- stylua: ignore stop

  return spec
end

return { meta = meta, palette = palette, generate_spec = generate_spec }
