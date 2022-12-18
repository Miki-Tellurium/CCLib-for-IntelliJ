---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Control the current pocket computer, adding or removing upgrades. This API is only available
--- on pocket computers. As such, you may use its presence to determine what kind of computer you are using.
---@class pocket
pocket = {}

--- Search the player's inventory for another upgrade, replacing the existing one with that item if found.
--- This inventory search starts from the player's currently selected slot, allowing you to prioritise upgrades.
---@return boolean | string | nil  If an item was equipped or the reason an item was not equipped
function pocket.equipBack() end

--- Remove the pocket computer's current upgrade.
---@return boolean | string | nil If the upgrade was unequipped or the reason an upgrade was not unequipped
function pocket.unequipBack() end