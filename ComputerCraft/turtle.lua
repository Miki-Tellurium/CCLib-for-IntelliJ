---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Turtles are a robotic device, which can break and place blocks, attack mobs, and
--- move about the world. They have an internal inventory of 16 slots, allowing them
--- to store blocks they have broken or would like to place.
---@class turtle
turtle = {}

--- Craft a recipe based on the turtle's inventory. The turtle's inventory should set up like
--- a crafting grid. For instance, to craft sticks, slots 1 and 5 should contain planks. All
--- other slots should be empty, including those outside the crafting "grid".
--- Throws when limit is less than 1 or greater than 64.
---@param limit number | nil  The maximum number of crafting steps to run (max is 64)
---@return boolean true if crafting succeeds or false if crafting fails and a string describing why crafting failed
function turtle.craft(limit) end

--- Move the turtle forward one block.
---@return boolean | string | nil Whether the turtle could successfully move, if false the reason the turtle could not move
function turtle.forward() end

--- Move the turtle backwards one block.
---@return boolean | string | nil Whether the turtle could successfully move, if false the reason the turtle could not move
function turtle.back() end

--- Move the turtle up one block.
---@return boolean | string | nil Whether the turtle could successfully move, if false the reason the turtle could not move
function turtle.up() end

--- Move the turtle down one block.
---@return boolean | string | nil Whether the turtle could successfully move, if false the reason the turtle could not move
function turtle.down() end

--- Rotate the turtle 90 degrees to the left.
---@return boolean | string | nil Whether the turtle could successfully turn, if false the reason the turtle could not turn
function turtle.turnLeft() end

--- Rotate the turtle 90 degrees to the right.
---@return boolean | string | nil Whether the turtle could successfully turn, if false the reason the turtle could not turn
function turtle.turnRight() end

--- Attempt to break the block in front of the turtle. This requires a turtle tool capable of breaking
--- the block. Diamond pickaxes (mining turtles) can break any vanilla block, but other tools (such
--- as axes) are more limited.
---@param side string | nil The specific tool to use, should be "left" or "right"
---@return boolean | string | nil Whether a block was broken or the reason no block was broken
function turtle.dig(side) end

--- Attempt to break the block above the turtle. See [turtle.dig] for full details.
------@param side string | nil The specific tool to use, should be "left" or "right"
-----@return boolean | string | nil Whether a block was broken or the reason no block was broken
function turtle.digUp(side) end

--- Attempt to break the block below the turtle. See [turtle.dig] for full details.
------@param side string | nil The specific tool to use, should be "left" or "right"
-----@return boolean | string | nil Whether a block was broken or the reason no block was broken
function turtle.digDown(side) end

--- Place a block or item into the world in front of the turtle. "Placing" an item allows it to
--- interact with blocks and entities in front of the turtle. For instance, buckets can pick up
--- and place down fluids, and wheat can be used to breed cows. However, you cannot use place to
--- perform arbitrary block interactions, such as clicking buttons or flipping levers.
---@param text string | nil When placing a sign, set its contents to this text
---@return boolean |string | nil Whether the block could be placed or the reason the block was not placed
function turtle.place(text) end

--- Place a block or item into the world below the turtle. See [turtle.place] for full details.
---@param text string | nil When placing a sign, set its contents to this text
---@return boolean |string | nil Whether the block could be placed or the reason the block was not placed
function turtle.placeUp(text) end

---Place a block or item into the world below the turtle. See [turtle.place] for full details.
---@param text string | nil When placing a sign, set its contents to this text
---@return boolean |string | nil Whether the block could be placed or the reason the block was not placed
function turtle.placeDown(text) end

--- Drop the currently selected stack into the inventory in front of the turtle, or as an item into
--- the world if there is no inventory. Throws if dropping an invalid number of items.
---@param count number | nil The number of items to drop, if not given the entire stack will be dropped
---@return boolean | string | nil Whether items were dropped ot the reason no items were dropped
function turtle.drop(count) end

--- Drop the currently selected stack into the inventory above the turtle, or as an item into
--- the world if there is no inventory. Throws if dropping an invalid number of items.
---@param count number | nil The number of items to drop, if not given the entire stack will be dropped
---@return boolean | string | nil Whether items were dropped ot the reason no items were dropped
function turtle.dropUp(count) end

--- Drop the currently selected stack into the inventory below the turtle, or as an item into
--- the world if there is no inventory. Throws if dropping an invalid number of items.
---@param count number | nil The number of items to drop, if not given the entire stack will be dropped
---@return boolean | string | nil Whether items were dropped ot the reason no items were dropped
function turtle.dropDown(count) end

--- Change the currently selected slot. The selected slot is determines what slot actions like
--- [turtle.drop] or [turtle.getItemCount] act on. Throws if the slot is out of range.
---@param slot number The slot to select
---@return boolean true when the slot has been selected
function turtle.select(slot) end

--- Get the number of items in the given slot. Throws if the slot is out of range.
---@param slot number | nil The slot we wish to check, defaults to the selected slot
---@return number The number of items in this slot
function turtle.getItemCount(slot) end

--- Get the remaining number of items which may be stored in this stack. For instance,
--- if a slot contains 13 blocks of dirt, it has room for another 51.
--- Throws if the slot is out of range.
---@param slot number | nil The slot we wish to check, defaults to the selected slot
---@return number The space left in in this slot
function turtle.getItemSpace(slot) end

--- Check if there is a solid block in front of the turtle. In this case, solid refers to any non-air or liquid block.
---@return boolean If there is a solid block in front
function turtle.detect() end

--- Check if there is a solid block above the turtle. In this case, solid refers to any non-air or liquid block.
---@return boolean If there is a solid block in front
function turtle.detectUp() end

--- Check if there is a solid block below the turtle. In this case, solid refers to any non-air or liquid block.
---@return boolean If there is a solid block in front
function turtle.detectDown() end

---Check if the block in front of the turtle is equal to the item in the currently selected slot.
---@return boolean If the block and item are equal
function turtle.compare() end

---Check if the block above the turtle is equal to the item in the currently selected slot.
---@return boolean If the block and item are equal
function turtle.compareUp() end

---Check if the block below the turtle is equal to the item in the currently selected slot.
---@return boolean If the block and item are equal
function turtle.compareDown() end

--- Attack the entity in front of the turtle.
---@param side string | nil The specific tool to use
---@return boolean | string | nil Whether an entity was attacked or the reason nothing was attacked
function turtle.attack(side) end

--- Attack the entity above the turtle.
---@param side string | nil The specific tool to use
---@return boolean | string | nil Whether an entity was attacked or the reason nothing was attacked
function turtle.attackUp(side) end

--- Attack the entity below the turtle.
---@param side string | nil The specific tool to use
---@return boolean | string | nil Whether an entity was attacked or the reason nothing was attacked
function turtle.attackDown(side) end

--- Suck an item from the inventory in front of the turtle, or from an item floating in the world.
--- This will pull items into the first acceptable slot, starting at the currently selected one.
--- Throws if given an invalid number of items.
---@param count number | nil The number of items to suck; if not given, up to a stack of items will be picked up
---@return boolean | string | nil  Whether items were picked up or the reason the no items were picked up
function turtle.suck(count) end

--- Suck an item from the inventory above the turtle, or from an item floating in the world.
--- This will pull items into the first acceptable slot, starting at the currently selected one.
--- Throws if given an invalid number of items.
---@param count number | nil The number of items to suck; if not given, up to a stack of items will be picked up
---@return boolean | string | nil  Whether items were picked up or the reason the no items were picked up
function turtle.suckUp(count) end

--- Suck an item from the inventory below the turtle, or from an item floating in the world.
--- This will pull items into the first acceptable slot, starting at the currently selected one.
--- Throws if given an invalid number of items.
---@param count number | nil The number of items to suck; if not given, up to a stack of items will be picked up
---@return boolean | string | nil  Whether items were picked up or the reason the no items were picked up
function turtle.suckDown(count) end

--- Get the maximum amount of fuel this turtle currently holds.
---@return number | string The current amount of fuel this turtle has or "unlimited" if turtles do not consume fuel when moving
function turtle.getFuelLevel() end

--- Refuel this turtle. While most actions a turtle can perform (such as digging or placing blocks)
--- are free, moving consumes fuel from the turtle's internal buffer. If a turtle has no fuel, it
--- will not move. [turtle.refuel] refuels the turtle, consuming fuel items (such as coal or lava buckets)
--- from the currently selected slot and converting them into energy. This finishes once the
--- turtle is fully refuelled or all items have been consumed.
--- Throws if the refuel count is out of range.
---@param count number | nil The maximum number of items to consume, one can pass 0 to check if an item is combustible or not
---@return boolean | string true if the turtle was refuelled or false if the turtle was not refuelled and the reason the turtle was not refuelled
function turtle.refuel(count) end

--- Compare the item in the currently selected slot to the item in another slot.
--- Throws if the slot is out of range.
---@param slot number The slot to compare to
---@return boolean If the two items are equal
function turtle.compareTo(slot) end

--- Move an item from the selected slot to another one. Throws if the slot is out of range
--- or if the number of items is out of range.
---@param slot number The slot to move this item to
---@param count number | nil The maximum number of items to move
---@return boolean If some items were successfully moved
function turtle.transferTo(slot, count) end

--- Get the currently selected slot.
---@return number The current slot
function turtle.getSelectedSlot() end

--- Get the maximum amount of fuel this turtle can hold. By default, normal turtles have
--- a limit of 20,000 and advanced turtles of 100,000.
---@return number | string The maximum amount of fuel a turtle can hold or "unlimited" if turtles do not consume fuel when moving
function turtle.getFuelLimit() end

--- Equip (or unequip) an item on the left side of this turtle. This finds the item in the
--- currently selected slot and attempts to equip it to the left side of the turtle. The
--- previous upgrade is removed and placed into the turtle's inventory. If there is no
--- item in the slot, the previous upgrade is removed, but no new one is equipped.
---@return boolean | string | nil If the item was equipped or the reason equipping this item failed
function turtle.equipLeft() end

--- Equip (or unequip) an item on the right side of this turtle. This finds the item in the
--- currently selected slot and attempts to equip it to the right side of the turtle. The
--- previous upgrade is removed and placed into the turtle's inventory. If there is no
--- item in the slot, the previous upgrade is removed, but no new one is equipped.
---@return boolean | string | nil If the item was equipped or the reason equipping this item failed
function turtle.equipRight() end

--- Get information about the block in front of the turtle.
---@return boolean | table | string Whether there is a block in front of the turtle and information about the block, or a message explaining that there is no block
function turtle.inspect() end

--- Get information about the block above the turtle.
---@return boolean | table | string Whether there is a block above the turtle and information about the block, or a message explaining that there is no block
function turtle.inspectUp() end

--- Get information about the block below the turtle.
---@return boolean | table | string Whether there is a block below the turtle and information about the block, or a message explaining that there is no block
function turtle.inspectDown() end

--- Get detailed information about the items in the given slot.  Throws if the slot is out of range.
---@param slot number | nil The slot to get information about, defaults to the selected slot
---@param detailed boolean | nil Whether to include "detailed" information; when true the method will contain much more information about the item at the cost of taking longer to run
---@return nil | table Information about the given slot, or nil if it is empty
function turtle.getItemDetail(slot , detailed) end

---@deprecated
---The builtin [turtle] API, without any generated helper functions.
---Historically this table behaved differently to the main [turtle] API, but this is no longer the case. You should not need to use it.
turtle.native = {}