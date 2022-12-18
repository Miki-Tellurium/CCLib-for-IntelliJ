---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Use modems to locate the position of the current turtle or computers.
--- It broadcasts a PING message over rednet and wait for responses. In order for this
--- system to work, there must be at least 4 computers used as gps hosts which will respond
--- and allow trilateration. Three of these hosts should be in a plane, and the fourth
--- should be either above or below the other three. The three in a plane should not be
--- in a line with each other. You can set up hosts using the gps program.
---@class gps
gps = {}

---@generic
--- The channel which GPS requests and responses are broadcast on.
CHANNEL_GPS = {}

--- Tries to retrieve the computer or turtles own location.
---@param timeout number The maximum time in seconds taken to establish our position
---@param debug boolean Print debugging messages
---@return number, number, number | nil This computer x, y and z position or nil if the position could not be established
function gps.locate(timeout, debug) end
