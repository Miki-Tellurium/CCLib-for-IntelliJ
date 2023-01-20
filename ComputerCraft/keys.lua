---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Constants for all keyboard "key codes", as queued by the [key] event.
--- These values are not guaranteed to remain the same between versions. It is
--- recommended that you use the constants provided by this file, rather than the
--- underlying numerical values.
---@class keys
keys = {}

--- Translates a numerical key code to a human-readable name. The human-readable name is
--- one of the constants in the [keys] API.
---@param code number The key code to look up
---@return string | nil The name of the key, or nil if not a valid key code
function keys.getName(code) end
