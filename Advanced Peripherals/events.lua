---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Support for Advanced Peripherals events.
---@class advanced_peripherals_event
local event = string

--- Fires when a player sends a message in the chat. The [chat] event will fire once a chatbox has
--- been connected to the computer. You don't have to [peripheral.wrap] or [peripheral.find] the
--- peripheral (unless you intend to send messages).
---@return string | boolean The name of the event, the username of the player, the message, the uuid of the player and if the message is hidden
chat = event

--- Fires when a player clicks on the block.
---@return string The name of the event and the name of the player who clicked
playerClick = event
