---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- A collection of helper methods for working with input completion, such as that require by [read].
---@class completion
completion = {}

--- Complete from a choice of one or more strings.
---@param text string The input string to complete
---@param choices table The list of choices to complete from
---@param add_space boolean | nil Whether to add a space after the completed item
---@return table A list of suffixes of matching strings
function completion.choice(text, choices, add_space) end

--- Complete the name of a currently attached peripheral.
---@param text string The input string to complete
---@param add_space boolean | nil Whether to add a space after the completed name
---@return table A list of suffixes of matching peripherals
function completion.peripheral(text, add_space) end

--- Complete the side of a computer.
---@param text string The input string to complete
---@param add_space boolean | nil Whether to add a space after the completed side
---@return table A list of suffixes of matching sides
function completion.side(text, add_space) end

--- Complete a setting.
---@param text string The input string to complete
---@param add_space boolean | nil  Whether to add a space after the completed settings
---@return table A list of suffixes of matching settings
function completion.setting(text, add_space) end

--- Complete the name of a Minecraft command.
---@param text string The input string to complete
---@param add_space boolean | nil  Whether to add a space after the completed command
---@return table A list of suffixes of matching commands
function completion.command(text, add_space) end