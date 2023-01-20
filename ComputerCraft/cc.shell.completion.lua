---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- A collection of helper methods for working with shell completion. Most programs
--- may be completed using the [completion.build] helper method, rather than manually switching
--- on the argument index. Note, the helper functions within this module do not
--- accept an argument index, and so are not directly usable with the [shell.setCompletionFunction].
--- Instead, wrap them using [completion.build], or your own custom function.
---@class shell.completion
completion = {}

--- Complete the name of a file relative to the current working directory.
---@param shell table The shell we're completing in
---@param text string Current text to complete
---@return table A list of suffixes of matching files
function completion.file(shell, text) end

--- Complete the name of a directory relative to the current working directory.
---@param shell table The shell we're completing in
---@param text string Current text to complete
---@return table A list of suffixes of matching directories
function completion.dir(shell, text) end

--- Complete the name of a file or directory relative to the current working directory.
---@param shell table The shell we're completing in
---@param text string Current text to complete
---@param previous table The shell arguments before this one
---@param add_space boolean | nil Whether to add a space after the completed item
---@return table A list of suffixes of matching files and directories
function completion.dirOrFile(shell, text, previous, add_space) end

--- Complete the name of a program.
---@param shell table The shell we're completing in
---@param text string Current text to complete
---@return table A list of suffixes of matching programs
function completion.program(shell, text) end

--- Complete arguments of a program.
---@param shell table The shell we're completing in
---@param text string Current text to complete
---@param previous table The shell arguments before this one
---@param starting number Which argument index this program and args start at
---@return table A list of suffixes of matching programs and arguments
function completion.programWithArgs(shell, text, previous, starting) end

--- Wraps [help.completeTopic] as a [completion.build] compatible function.
function completion.help() end

--- Wraps [ cc.completion.choice] as a [completion.build] compatible function.
function completion.choice() end

--- Wraps [cc.completion.peripheral] as a [completion.build] compatible function.
function completion.peripheral() end

--- Wraps [cc.completion.side] as a [completion.build] compatible function.
function completion.side() end

--- Wraps [cc.completion.setting] as a [completion.build] compatible function.
function completion.settings() end

--- Wraps [cc.completion.command] as a [completion.build] compatible function.
function completion.commands() end

--- A helper function for building shell completion arguments. This accepts a series
--- of single-argument completion functions, and combines them into a function suitable
--- for use with [shell.setCompletionFunction]. Every argument to build represents an
--- argument to the program you wish to complete. Each argument can be one of three types:
--- * nil: This argument will not be completed;
--- * A function: This argument will be completed with the given function. It is called with
--- the shell object, the string to complete and the arguments before this one;
--- * A table: This acts as a more powerful version of the function case. The
--- table must have a function as the first item - this will be called with the
--- shell, string and preceding arguments as above, but also followed by any additional
--- items in the table. This provides a more convenient interface to pass options to
--- your completion functions. If this table is the last argument, it may also set the
--- many key to true, which states this function should be used to complete any remaining arguments.
---@param ... nil | table | function The completion functions to build
function completion.build(...) end