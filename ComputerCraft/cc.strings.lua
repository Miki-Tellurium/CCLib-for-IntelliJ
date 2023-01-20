---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Various utilities for working with strings and text.
---@class strings
strings = {}

--- Wraps a block of text, so that each line fits within the given width. This may be
--- useful if you want to wrap text before displaying it to a monitor or printer without
--- using [print].
---@param text string The string to wrap
---@param width number | nil The width to constrain to, defaults to the width of the terminal
---@return table The wrapped input string as a list of lines
function strings.wrap(text, width) end

--- Makes the input string a fixed width. This either truncates it, or pads it with spaces.
---@param line string The string to normalise
---@param width number | nil The width to constrain to, defaults to the width of the terminal
---@return string The string with a specific width
function strings.ensure_width(line, width) end