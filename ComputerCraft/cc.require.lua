---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- A pure Lua implementation of the builtin require function and package library.
--- Generally you do not need to use this module - it is injected into the every
--- program's environment. However, it may be useful when building a custom shell
--- or when running programs yourself.
---@class require
require = {}

--- Build an implementation of Lua's package library, and a require function to load modules within it.
---@param env table The environment to load packages into
---@param dir string The directory that relative packages are loaded from
---@return function | table The new require function and the new package library
function require.make(env, dir) end