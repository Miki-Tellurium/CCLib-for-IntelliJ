---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- The [rs] module is the same as the [redstone] API. Go there for more details.
---@class rs
rs = {}

--- Returns a table containing the six sides of the computer. Namely, "top", "bottom",
--- "left", "right", "front" and "back".
---@return table A table of valid sides
function rs.getSides() end

--- Turn the redstone signal of a specific side on or off.
---@param side string The side to set
---@param on boolean Whether the redstone signal should be on or off, when on, a signal strength of 15 is emitted
function rs.setOutput(side, on) end

--- Get the current redstone output of a specific side.
---@param side string The side to get
---@return boolean Whether the redstone output is on or off
function rs.getOutput(side) end

--- Get the current redstone input of a specific side.
---@param side string The side to get
---@return boolean Whether the redstone input is on or off
function rs.getInput(side) end

--- Set the redstone signal strength for a specific side. Throws if value is not between 0 and 15.
---@param side string The side to set
---@param value number The signal strength between 0 and 15
function rs.setAnalogOutput(side, value) end

--- Set the redstone signal strength for a specific side. Throws if value is not between 0 and 15.
---@param side string The side to set
---@param value number The signal strength between 0 and 15
function rs.setAnalogueOutput(side, value) end

--- Get the redstone output signal strength for a specific side.
---@param side string The side to get
---@return number The output signal strength, between 0 and 15
function rs.getAnalogOutput(side) end

--- Get the redstone output signal strength for a specific side.
---@param side string The side to get
---@return number The output signal strength, between 0 and 15
function rs.getAnalogueOutput(side) end

--- Get the redstone input signal strength for a specific side.
---@param side string The side to get
---@return number The input signal strength, between 0 and 15
function rs.getAnalogInput(side) end

--- Get the redstone input signal strength for a specific side.
---@param side string The side to get
---@return number The input signal strength, between 0 and 15
function rs.getAnalogueInput(side) end

--- Set the bundled cable output for a specific side.
---@param side string The side to set
---@param output number The colour bitmask to set
function rs.setBundledOutput(side, output) end

--- Get the bundled cable output for a specific side.
---@param side string The side to get
---@return number The bundle cable's output
function rs.getBundledOutput(side) end

--- Get the bundled cable input for a specific side.
---@param side string The side to get
---@return number The bundle cable's input
function rs.getBundledInput(side) end

--- Determine if a specific combination of colors are on for the given side.
---@param side string The side to test
---@param mask number The mask to test
---@return boolean If the colors are on
function rs.testBundledInput(side, mask) end