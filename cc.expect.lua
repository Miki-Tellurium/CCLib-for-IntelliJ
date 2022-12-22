---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- The [cc.expect] library provides helper functions for verifying that
--- function arguments are well-formed and of the correct type.
---@class expect
expect = {}

--- Expect an argument to have a specific type. Throws if the value
--- is not one of the allowed types.
---@param index number The 1-based argument index
---@param value any The argument's value
---@param ... string The allowed types of the argument
---@return any The given value
function expect(index, value, ...) end

--- Expect a field to have a specific type. Throws if the field
--- is not one of the allowed types.
---@param tbl table The table to index
---@param index string The field name to check
---@param ... string The allowed types of the argument
---@return any The contents of the given field
function field(tbl, index, ...) end

--- Expect a number to be within a specific range. Throws
--- if the value is outside of the allowed range.
---@param num number The value to check
---@param min number The minimum value, if nil then [math.huge] is used
---@param max number The maximum value, if nil then [math.huge] is used
---@return number The given value
function range(num, min, max) end