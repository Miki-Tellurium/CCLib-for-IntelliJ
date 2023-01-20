---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Support for peripherals added by Advanced Peripherals.
peripheral = {}

--- Get a table containing all functions available on a peripheral. These can then be called
--- instead of using [peripheral.call] every time.
---@param name string The name of the peripheral to wrap
---@return chatbox_peripheral | environment_detector | player_detector | me_bridge | rs_bridge | energy_detector | AR_controller | inventory_manager | redstone_integrator | block_reader | NBT_storage | geo_scanner | colony_integrator | beacon | noteblock | nil The table containing the peripheral's methods, or nil if there is no peripheral present with the given name
function peripheral.wrap(name) end

--- Find all peripherals of a specific type, and return the wrapped peripherals.
---@param type string The type of peripheral to look for
---@param filter function A filter function, which takes the peripheral's name and wrapped table and returns if it should be included in the result
---@return chatbox_peripheral | environment_detector | player_detector | me_bridge | rs_bridge | energy_detector | AR_controller | inventory_manager | redstone_integrator | block_reader | NBT_storage | geo_scanner | colony_integrator | beacon | noteblock | nil Zero or more wrapped peripherals matching the given filters
function peripheral.find(type, filter) end


--- The Chat Box is able to read and write messages to the in-game chat. You can send messages to just one
--- player or to everyone.
---@class chatbox_peripheral
chatbox = {}

--- Broadcasts a message to the global chat.
---@param message string The message to send
---@param prefix string The prefix of the message
function chatbox.sendMessage(message, prefix) end

--- Broadcasts a text component message to the global chat.
---@param jsonObject string The component to send
---@param prefix string The prefix of the message
function chatbox.sendFormattedMessage(jsonObject, prefix) end

--- Sends a message to one specific player.
---@param message string The message to send
---@param user string The target player
---@param prefix string The prefix of the message
function chatbox.sendMessageToPlayer(message, user, prefix)	end


--- The Environment Detector provides current information from the environment like
--- the current time, the current moon phase, the light level of the block and many more.
---@class environment_detector
environment_detector = {}

--- Returns the biome the block is in.
---@return string
function environment_detector.getBiome() end

--- Returns the light level of the block (can be manipulated with light sources).
---@return number
function environment_detector.getBlockLightLevel() end

--- Returns the day light level of the current world from 0 to 15 (like the day light sensor).
---@return number
function environment_detector.getDayLightLevel() end

--- Returns the name of the dimension (ex. the_nether).
--- @return string
function environment_detector.getDimensionName() end

--- Returns the name with the provider of the dimension (ex. minecraft:overworld).
---@return string
function environment_detector.getDimensionPaN()	end

--- Returns the provider of the dimension (ex. minecraft).
---@return string
function environment_detector.getDimensionProvider() end

--- Returns the current moon phase as id:
--- - 0 Full moon
--- - 1 Waning gibbous
--- - 2 Third quarter
--- - 3 Wanning crescent
--- - 4 New moon
--- - 5 Waxing crescent
--- - 6 First quarter
--- - 7 Waxing gibbous
---@return number
function environment_detector.getMoonId() end

--- Returns the current moon phase as name (ex. Third quarter).
---@return string
function environment_detector.getMoonName() end

--- Returns the sky light level above the block.
---@return number
function environment_detector.getSkyLightLevel() end

--- (WIP) Returns the daytime of the current world.
---@return number
function environment_detector.getTime() end

--- Returns the radiation of Mekanism with the current unit.
---@return table
function environment_detector.getRadiation() end

--- Returns the raw radiation of Mekanism in Sv/h.
---@return number
function environment_detector.getRadiationRaw() end

--- Returns true if the current dimension matches the first parameter.
---@param dimension string The dimension to compare
---@return boolean
function environment_detector.isDimension(dimension) end

--- Returns true if the current moon phase matches the first parameter. Possible moonphases are:
--- - 0 Full moon
--- - 1 Waning gibbous
--- - 2 Third quarter
--- - 3 Wanning crescent
--- - 4 New moon
--- - 5 Waxing crescent
--- - 6 First quarter
--- - 7 Waxing gibbous
---@param moonphase number The moonphase to check
---@return boolean
function environment_detector.isMoon(moonphase) end

--- Returns true if it's raining.
---@return boolean
function environment_detector.isRaining() end

--- Returns true if the chunk is a slime chunk.
---@return boolean
function environment_detector.isSlimeChunk() end

--- Returns true if it's sunny.
---@return boolean
function environment_detector.isSunny() end

--- Returns true if it's thundering.
---@return boolean
function environment_detector.isThunder() end

--- Returns a table with all registered dimensions(also modded dimensions).
---@return table
function environment_detector.listDimensions() end


--- The Player Detector is able to recognize players within a certain range. In addition,
--- it recognizes the player who clicks on him ([playerClick] event).
---@class player_detector
player_detector = {}

--- Returns player's position.
---@param player string The name of the player
---@return table
function player_detector.getPlayerPos(player) end

--- Returns a table of all online players.
---@return table A list of players
function player_detector.getOnlinePlayers() end

--- Return players within a certain range. The center of the range is the detector itself
--- and not the computer.
---@param range number The range around the detetcor to check
---@return table A list of players within the range
function player_detector.getPlayersInRange(range) end

--- Return players within 2 positions. The tables need to have a x, y, and z value.
---@param posOne table The coordinates of the first position
---@param posTwo table The coordinates of the second position
---@return table A list of players within the two positions
function player_detector.getPlayersInCoords(posOne, posTwo) end

--- Return players within a certain range. You can define the range in every 3 axes.
---@param x number The range on the x axis
---@param y number The range on the y axis
---@param z number The range on the z axis
---@return table A list of players within the range
function player_detector.getPlayersInCubic(x, y, z) end

--- Returns true if the player is in range, false if not.
---@param range number The range around the detector to check
---@param username string The name of the player to search for
---@return boolean
function player_detector.isPlayerInRange(range, username) end

--- Returns true if the player is within 2 positions. The tables need to have a x, y, and z value.
---@param posOne table The coordinates of the first position
---@param posTwo table The coordinates of the second position
---@return boolean
function player_detector.isPlayerInCoords(posOne, posTwo) end

--- Returns true if the player is within a certain range. You can define the range in every 3 axes.
---@param x number The range on the x axis
---@param y number The range on the y axis
---@param z number The range on the z axis
---@return boolean
function player_detector.isPlayerInCubic(x, y, z) end

--- Returns true if any player is in range, false if not.
---@param range number The range around the detector to check
---@return boolean
function player_detector.isPlayersInRange(range) end

--- Returns true if any player is within 2 positions. The tables need to have a x, y, and z value.
---@param posOne table The coordinates of the first position
---@param posTwo table The coordinates of the second position
---@return boolean
function player_detector.isPlayersInCoords(posOne, posTwo) end

--- Returns true if any player is within a certain range. You can define the range in every 3 axes.
---@param x number The range on the x axis
---@param y number The range on the y axis
---@param z number The range on the z axis
---@return boolean
function player_detector.isPlayersInCubic(x, y, z) end


--- The ME Bridge is able to interact with Applied Energistics 2. You can retrieve items,
--- craft items, get all items as a list and more. The ME Bridge uses one channel.
---@class me_bridge
me_bridge = {}

--- Crafts an item. See [wiki](https://docs.intelligence-modding.de/1.16/othersandutilities/item_parameter/)
--- for info about the parameters to use.
---@param item table A table containing information about the item to craft
---@return table
function me_bridge.craftItem(item) end

--- Exports an item to a chest in the direction of the block. Valid directions are "up", "down",
--- "north", "west", "east" and "south".
---@param item table Info about the item to export
---@param direction string The direction towards to export the items
---@return number The amount of item exported
function me_bridge.exportItem(item, direction) end

--- Exports an item to a chest (every inventory tile entity should work) which is connected to the peripheral network.
---@param item table Info about the item to export
---@param chest string The chest to export the item to
---@return number The amount of item exported
function me_bridge.exportItemToPeripheral(item, chest) end

--- Returns all connected crafting cpus.
---@return table A list of crafting CPUs
function me_bridge.getCraftingCPUs() end

--- Returns the stored energy of the whole ME System.
---@return number
function me_bridge.getEnergyStorage() end

--- Returns the energy usage of the whole ME System.
---@return number
function me_bridge.getEnergyUsage() end

--- Returns a table with information of an item.
---@param item table Info about the item to gather information of
---@return table
function me_bridge.getItem(item) end

--- Returns the maximum energy storage of the whole ME System.
---@return number
function me_bridge.getMaxEnergyStorage() end

--- Imports an item to the ME System from the chest in the direction of the block. Valid
--- directions are "up", "down", "north", "west", "east" and "south".
---@param item table Info about the item to import
---@param direction string The direction to import the items from
---@return number The number of items imported
function me_bridge.importItem(item, direction) end

--- Imports an item to a chest (every inventory tile entity should work) which is connected to the peripheral network.
---@param item table Info about the item to import
---@param chest string The chest to import the item from
---@return number The number of items imported
function me_bridge.importItemFromPeripheral(item, chest) end

--- Returns true if a job for the item already exists.
---@param item table Info about the item to gather information of
---@return boolean
function me_bridge.isItemCrafting(item) end

--- Returns true if the item is craftble.
---@param item table Info about the item to gather information of
---@return boolean
function me_bridge.isItemCraftable(item) end

--- Returns all craftable fluids.
---@return table
function me_bridge.listCraftableFluid() end

--- Returns all craftable items.
---@return table
function me_bridge.listCraftableItems() end

--- Returns all stored fluids.
---@return table
function me_bridge.listFluid() end

--- Returns all stored items.
---@return table
function me_bridge.listItems() end


--- The RS Bridge is able to interact with Refined Storage. You can retrieve items,
--- craft items, get all items as a list and more.
---@class rs_bridge
rs_bridge = {}

--- Crafts an item. See [wiki](https://docs.intelligence-modding.de/1.16/othersandutilities/item_parameter/)
--- for info about the parameters to use.
---@param item table A table containing information about the item to craft
---@return table
function rs_bridge.craftItem(item) end

--- Exports an item to a chest in the direction of the block. Valid directions are "top",
--- "bottom", "left", "right", "back" and "front".
---@param item table Info about the item to export
---@param direction string The direction towards to export the items
---@return number The amount of item exported
function rs_bridge.exportItem(item, direction) end

--- Exports an item to a chest (every inventory tile entity should work) which is connected to the peripheral network.
---@param item table Info about the item to export
---@param chest string The chest to export the item to
---@return number The amount of item exported
function rs_bridge.exportItemToPeripheral(item, chest) end

--- Returns the stored energy of the whole RS System.
---@return number
function rs_bridge.getEnergyStorage() end

--- Returns the energy usage of the whole RS System.
---@return number
function rs_bridge.getEnergyUsage() end

--- Returns a table with information of an item.
---@param item table Info about the item to gather information of
---@return table
function rs_bridge.getItem(item) end

--- Returns the maximum energy storage of the whole RS System.
---@return number
function rs_bridge.getMaxEnergyStorage() end

--- Imports an item to the ME System from the chest in the direction of the block. Valid
--- directions are "top", "bottom", "left", "right", "back" and "front".
---@param item table Info about the item to import
---@param direction string The direction to import the items from
---@return number The number of items imported
function rs_bridge.importItem(item, direction) end

--- Imports an item to a chest (every inventory tile entity should work) which is connected to the peripheral network.
---@param item table Info about the item to import
---@param chest string The chest to import the item from
---@return number The number of items imported
function rs_bridge.importItemFromPeripheral(item, chest) end

--- Returns true if a job for the item already exists.
---@param item table Info about the item to gather information of
---@return boolean
function rs_bridge.isItemCrafting(item) end

--- Returns true if the item is craftble.
---@param item table Info about the item to gather information of
---@return boolean
function rs_bridge.isItemCraftable(item) end

--- Returns all craftable fluids.
---@return table
function rs_bridge.listCraftableFluid() end

--- Returns all craftable items.
---@return table
function rs_bridge.listCraftableItems() end

--- Returns all stored fluids.
---@return table
function rs_bridge.listFluid() end

--- Returns all stored items.
---@return table
function rs_bridge.listItems() end

--- Returns the total amount of availabe item disk storage.
---@return number
function rs_bridge.getMaxItemDiskStorage() end

--- Returns the total amount of availabe fluid disk storage.
---@return number
function rs_bridge.getMaxFluidDiskStorage() end

--- Returns the total amount of availabe extern item storage.
---@return number
function rs_bridge.getMaxItemExternalStorage() end

--- Returns the total amount of availabe extern fluid storage.
---@return number
function rs_bridge.getMaxFluidExternalStorage() end


--- The Energy Detector can detect energy flow and acts as a resistor. You
--- can define the max flow rate to use it as a resistor.
---@class energy_detector
energy_detector = {}

--- Returns the current energy which go through the block.
---@return number
function energy_detector.getTransferRate() end

--- Returns the max rate limit which has been set with [setTransferRateLimit].
---@return number
function energy_detector.getTransferRateLimit() end

--- Set the transfer rate limit.
---@param limit number The transfer limit
function energy_detector.setTransferRateLimit(limit) end


--- The AR Controller is used to control your AR Goggles wirelessly.
--- You can draw anything you wish into an overlay that will be visible
--- as long as you're wearing the goggles.
---@class AR_controller
AR_controller = {}

--- Clears the entire canvas.
function AR_controller.clear() end

--- Clears the element with that id.
---@param id string The id of the element to clear
function AR_controller.clearElement(id) end

--- The same as [drawString], but centers the string horizontally around the specified position.
---@param text string The text to write
---@param x number The x coordinate
---@param y number The y coordinate
---@param color number The color of the text
function AR_controller.drawCenteredString(text, x, y, color) end

--- The same as [drawCenteredString], but has an id so it can be overridden later on or can be completely cleared.
---@param id string The id of the element
---@param text string The text to write
---@param x number The x coordinate
---@param y number The y coordinate
---@param color number The color of the text
function AR_controller.drawCenteredStringWithId(id, text, x, y, color) end

--- Draws a circle without filling it.
---@param x number The x coordinate
---@param y number The y coordinate
---@param radius number The radius of the circle
---@param color number The color of the circle
function AR_controller.drawCircle(x, y, radius, color) end

--- The same as drawCircle(), but has an id so it can be overridden later on or can be completely cleared.
---@param id string The id of the element
---@param x number The x coordinate
---@param y number The y coordinate
---@param radius number The radius of the circle
---@param color number The color of the circle
function AR_controller.drawCircleWithId(id, x, y, radius, color) end

--- Draws the given item to the specified position.
---@param itemId string The id of the item
---@param x number The x coordinate
---@param y number The y coordinate
function AR_controller.drawItemIcon(itemId, x, y) end

--- The same as [drawItemIcon], but has an id so it can be overridden later on or can be completely cleared.
---@param id string The id of the element
---@param itemId string The id of the item
---@param x number The x coordinate
---@param y number The y coordinate
function AR_controller.drawItemIconWithId(id, itemId, x, y) end

--- The same as [drawString], but the string is positioned with its right end at the specified position.
---@param text string The text to write
---@param x number The x coordinate
---@param y number The y coordinate
---@param color number The color of the text
function AR_controller.drawRightboundString(text, x, y, color) end

--- The same as [drawRightboundString], but has an id so it can be overridden later on or can be completely cleared.
---@param id string The id of the element
---@param text string The text to write
---@param x number The x coordinate
---@param y number The y coordinate
---@param color number The color of the text
function AR_controller.drawRightboundStringWithId(id, text, x, y, color) end

--- Draws the given string to the specified position and the specified color.
---@param text string The text to write
---@param x number The x coordinate
---@param y number The y coordinate
---@param color number The color of the text
function AR_controller.drawString(text, x, y, color) end

--- The same as [drawString], but has an id so it can be overridden later on or can be completely cleared.
---@param id string The id of the element
---@param text string The text to write
---@param x number The x coordinate
---@param y number The y coordinate
---@param color number The color of the text
function AR_controller.drawStringWithId(id, text, x, y, color) end

--- Fills a rectangle with the given color from the corner minX, minY to maxX, maxY.
---@param minX number The x coordinate of the first corner
---@param minY number The y coordinate of the first corner
---@param maxX number The x coordinate of the last corner
---@param maxY number The y coordinate of the last corner
---@param color number The color of the rectangle
function AR_controller.fill(minX, minY, maxX, maxY, color) end

--- The same as [fill], but has an id so it can be overridden later on or can be completely cleared.
---@param id string The id of the element
---@param minX number The x coordinate of the first corner
---@param minY number The y coordinate of the first corner
---@param maxX number The x coordinate of the last corner
---@param maxY number The y coordinate of the last corner
---@param color number The color of the rectangle
function AR_controller.fillWithId(id, minX, minY, maxX, maxY, color) end

--- Draws a full circle.
---@param x number The x coordinate
---@param y number The y coordinate
---@param radius number The radius of the circle
---@param color number The color of the circle
function AR_controller.fillCircle(x, y, radius, color) end

--- The same as [fillCircle], but has an id so it can be overridden later on or can be completely cleared.
---@param id string The id of the element
---@param x number The x coordinate
---@param y number The y coordinate
---@param radius number The radius of the circle
---@param color number The color of the circle
function AR_controller.fillCircleWithId(id, x, y, radius, color) end

--- Draws a rectangular gradient from colorFrom to colorTo with the given corners.
---@param minX number The x coordinate of the first coorner
---@param minY number The y coordinate of the first coorner
---@param maxX number The x coordinate of the last coorner
---@param maxY number The y coordinate of the last coorner
---@param colorFrom number The starting color of the gradient
---@param colorTo number The ending color of the gradient
function AR_controller.fillGradient(minX, minY, maxX, maxY, colorFrom, colorTo) end

--- The same as [fillGradient], but has an id so it can be overridden later on or can be completely cleared.
---@param id string The id of the element
---@param minX number The x coordinate of the first coorner
---@param minY number The y coordinate of the first coorner
---@param maxX number The x coordinate of the last coorner
---@param maxY number The y coordinate of the last coorner
---@param colorFrom number The starting color of the gradient
---@param colorTo number The ending color of the gradient
function AR_controller.fillGradientWithId(id, minX, minY, maxX, maxY, colorFrom, colorTo) end

--- Draws a horizontal line in the given color from minX to maxX at vertical y.
---@param minX number The coordinate of the starting point
---@param maxX number The coordinate of the ending point
---@param y number The y coordinate of the line
---@param color number The color of the line
function AR_controller.horizontalLine(minX, maxX, y, color)	end

--- The same as [horizontalLine], but has an id so it can be overridden later on or can be completely cleared.
---@param id string The id of the element
---@param minX number The coordinate of the starting point
---@param maxX number The coordinate of the ending point
---@param y number The y coordinate of the line
---@param color number The color of the line
function AR_controller.horizontalLineWithId(id, minX, maxX, y, color) end

--- Draws a vertical line in the given color from minY to maxY at horizontal x.
---@param x number The x coordinate of line
---@param minY number The y coordinate of the starting point
---@param maxY number The y coordinate of the ending point
---@param color number The color of the line
function AR_controller.verticalLine(x, minY, maxY, color) end

--- The same as [verticalLine], but has an id so it can be overridden later on or can be completely cleared.
---@param id string The id of the element
---@param x number The x coordinate of line
---@param minY number The y coordinate of the starting point
---@param maxY number The y coordinate of the ending point
---@param color number The color of the line
function AR_controller.verticalLineWithId(id, x, minY, maxY, color) end

--- Returns true and the size of the virtual screen if relative mode is active, or just false if it isn't.
---@return boolean | number
function AR_controller.isRelativeMode() end

--- Activates or deactivates relative mode. Requires virtual screen width and height if it's being enabled.
---@param enabled boolean If the relative mode should be enabled
---@param virtualScreenWidth number | nil The width of the virtual screen
---@param virtualScreenHeight number | nil The height of the virtual screen
function AR_controller.setRelativeMode(enabled, virtualScreenWidth, bvirtualScreenHeight) end


--- The Inventory Manager can communicate with the player's inventory. You need to
--- right click a Memory Card and put the card into the manager to use it.
---@class inventory_manager
inventory_manager = {}

--- Adds an item to the player's inventory. direction is the direction for the chest/inventory
--- block. The Inventory Manager will add a random item to the player's inventory if the argument
--- item is null.
---@param direction string The direction of the storage block to move the item from
---@param count number The amount of items to move
---@param slot number | nil The inventory slot to move the items to
---@param item string | nil  The name of the item to move
---@return number The amount of items moved
function inventory_manager.addItemToPlayer(direction, count, slot, item) end

--- Returns the content of the player's armor.
---@return table
function inventory_manager.getArmor() end

--- Returns the content of the player's inventory.
---@return table
function inventory_manager.getItems() end

--- Returns the owner of the memory card, nil if the memory card is not linked to a player.
---@return string | nil
function inventory_manager.getOwner() end

--- Returns true if the player is wearing one or more armor.
---@return boolean
function inventory_manager.isPlayerEquipped() end

--- Returns true if the player is wearing a armor piece on the given slot. Slots:
--- - 100 Boots
--- - 101 Pants
--- - 102 Chestplate
--- - 103 Helmet
---@param slot number The slot to check
---@return boolean
function inventory_manager.isWearing(slot) end

--- Removes an item from the player's inventory to the given inventory direction. direction
--- is the direction for the chest/inventory block. The Inventory Manager will remove a
--- random item from the player's inventory if the argument item is null.
---@param direction string The direction of the storage block to move the item to
---@param count number The amount of items to move
---@param slot number | nil The inventory slot to move the items from
---@param item string | nil  The name of the item to move
---@return number The amount of items moved
function inventory_manager.removeItemFromPlayer(direction, count, slot, item) end

--- Returns the item in the hand.
---@return table Info about the item
function inventory_manager.getItemInHand() end

--- Returns the nearest free slot of the player(-1 if inventory is full).
---@return number
function inventory_manager.getFreeSlot() end

--- Returns true if space is available in the player inventory.
---@return boolean
function inventory_manager.isSpaceAvailable() end

--- Returns the amount of empty slots in the player inventory.
---@return number
function inventory_manager.getEmptySpace() end


--- The Redstone Integrator is able to interact with redstone. You can use the
--- same code you would use for a computer on a Redstone Integrator. You may need
--- this peripheral for cases where you need to output redstone signals on more
--- sides than a regular computer has to offer.
---@class redstone_integrator
redstone_integrator ={}

--- Returns true if the redstone at the given side is on. False if not.
---@param direction string The side of the redstone signal
---@return boolean
function redstone_integrator.getInput(direction) end

--- Returns true if the Redstone Integrator sends a redstone signal to the given side. False if not.
------@param direction string The side of the redstone signal
---@return boolean
function redstone_integrator.getOuput(direction) end

--- Returns the redstone level on the given side.
---@param direction string The side of the redstone signal
---@return number
function redstone_integrator.getAnalogInput(direction) end

--- Returns the redstone level which sends the Redstone Integrator on the given side.
---@param direction string The side of the redstone signal
---@return boolean
function redstone_integrator.getAnalogOutput(direction) end

--- Will set the redstone level to 15 on the given side if power is true.
---@param direction string The side to send the redstone signal
---@param power boolean If the redstone should be active
function redstone_integrator.setOutput(direction, power)	end

--- Will set the redstone level to the given power on the given side.
---@param direction string The side to send the redstone signal
---@param power number The level of the redstone signal
function redstone_integrator.setAnalogOutput(direction, power) end


--- This block is able to read data of blocks and tile entities in front of it.
---@class block_reader
block_reader = {}

--- Returns the registry name of the block(e.g. minecraft:dirt)
---@return string
function block_reader.getBlockName() end

--- Returns the block data if the target block is a tile entity.
---@return table
function block_reader.getBlockData() end


--- NBT Storage is custom block that allow input/output custom data to block.
--- Mostly provided for ID support.
---@class NBT_storage
NBT_storage = {}

--- Returns data that stored in block.
---@return table
function NBT_storage.read()	end

--- Writes data into block, string should be valid json.
---@param string string The data to write
---@return boolean | nil
function NBT_storage.writeJSON(string) end

--- Writes data into block, table is just generic lua table.
---@param table table The data to write
---@return boolean | nil
function NBT_storage.writeTable(table) end

--- Returns configuration for this peripheral
---@return table
function NBT_storage.getConfiguration()	end


--- The Geo Scanner provides information about blocks around him and the chunk
--- of the geo scanner. Geo Scanner has delay between scans, so you should be
--- ready for this.
---@class geo_scanner
geo_scanner = {}

--- Returns stored fuel.
---@return number
function geo_scanner.getFuelLevel() end

--- Returns max stored fuel.
---@return number
function geo_scanner.getFuelMaxLevel() end

--- Returns cost in RF for scan.
---@param radius number The radius of the scan
---@return number
function geo_scanner.cost(radius) end

--- Returns data about blocks in radius.
---@param radius number The radius of the scan
---@return table | nil
function geo_scanner.scan(radius) end

--- Returns cooldown for scanner.
---@return number
function geo_scanner.getScanCooldown() end

--- Returns data about how much ores in current chunk.
---@return table | nil
function geo_scanner.chunkAnalyze() end

--- Returns configuration for this peripheral.
---@return table
function geo_scanner.getConfiguration() end


--- The colony integrator can interact with a colony from MineColonies.
---@class colony_integrator
colony_integrator = {}

--- Returns true if the block is in a colony.
---@return boolean
function colony_integrator.isInColony() end

--- Returns true if the given coordinates are in a colony.
---@param position table The coordinates to check
---@return boolean
function colony_integrator.isWithin(position) end

--- Returns a table with all citizens of the colony.
---@return table
function colony_integrator.getCitizens() end

--- Returns the id of the colony.
---@return number
function colony_integrator.getColonyID() end

--- Returns the name of the colony.
---@return string
function colony_integrator.getColonyName() end

--- Returns the style of the colony.
---@return string
function colony_integrator.getColonyStyle() end

--- Returns true if the colony is active (trusted players are online).
---@return boolean
function colony_integrator.isActive() end

--- Returns the overall happiness of the colony.
---@return number
function colony_integrator.getHappiness() end

--- Returns the position of the townhall.
---@return table
function colony_integrator.getLocation() end

--- Returns true if the colony is currently under attack.
---@return boolean
function colony_integrator.isUnderAttack() end

--- Returns the amount of citizens.
---@return number
function colony_integrator.amountOfCitizens() end

--- Returns the possible max amount of citizens.
---@return number
function colony_integrator.maxOfCitizens() end

--- Returns the amount of graves in the colony.
---@return number
function colony_integrator.amountOfGraves() end

--- Returns the amount of currently existing construction sites
---@return number
function colony_integrator.amountOfConstructionSites() end

--- Returns a table with all visitors in your tavern of the colony.
---@return table
function colony_integrator.getVisitors() end

--- Returns a table with all buildings in your colony.
---@return table
function colony_integrator.getBuildings() end

--- Returns a table with all work orders.
---@return table
function colony_integrator.getWorkOrders() end

--- Returns all possible researches, currently researches that is being worked on and research that has already been researched.
---@return table
function colony_integrator.getResearch() end

--- Returns a table with the resources of a work order. You can find out every order and its ID with [getWorkOrders].
---@param id number The id of the work order
---@return table
function colony_integrator.getWorkOrderResources(id) end

--- Returns all requests in any kind of the colony.
---@return table
function colony_integrator.getRequests() end

--- Returns the required resources of the given builder's hut.
---@param position table The coordinates of the builder's hut
---@return table
function colony_integrator.getBuilderResources(position) end


--- A beacon is a block that projects a light beam skyward and can provide
--- status effects such as Speed, Jump Boost, Haste, Regeneration, Resistance,
--- or Strength to nearby players.
---@class beacon
beacon = {}

--- Returns the level of the beacon.
---@return number
function beacon.getLevel() end

--- Returns the primary effect.
---@return string
function beacon.getPrimaryEffect() end

--- Returns the secondary effect.
---@return string
function beacon.getSecondaryEffect() end


--- A note block is a musical block that emits sounds when powered with redstone.
---@class noteblock
noteblock = {}

--- Plays the sound of the current note
function noteblock.playNote() end

--- Returns the current note. A value between 0 and 24
---@class number
function noteblock.getNote() end

--- Changes the note to the given note. A value between 0 and 24. Returns the note if successful.
---@param note number The note to play
---@return number
function noteblock.changeNoteBy(note) end

--- Changes the note to the next possible (like when you would click on the noteblock).
--- Returns the note if successful, -1 if not successful.
---@return number
function noteblock.changeNote() end


--- Mana generating flowers from botania can generate mana for other recipes or rituals.
---@class flower
flower = {}

--- Returns the capacity for mana.
---@return number
function flower.getMaxMana() end

--- Returns the stored mana.
---@return number
function flower.getMana() end

--- Returns true if the flower is a floating flower.
---@return boolean
function flower.isFloating() end

--- Returns true if the flower is on enchanted soil.
---@return boolean
function flower.isOnEnchantedSoil()	end


--- Mana pools can store mana. They're also used to craft items.
---@class mana_pool
mana_pool ={}

--- Returns the stored mana.
---@return number
function mana_pool.getMana() end

--- Returns the capacity for mana.
---@return number
function mana_pool.getMaxMana()	end

--- Returns the amount which is needed to fill the pool.
---@return number
function mana_pool.getManaNeeded() end

--- Returns true if the spreader is empty.
---@return boolean
function mana_pool.isEmpty() end

--- Returns true if the spreader is full.
---@return boolean
function mana_pool.isFull()	end


--- Mana spreaders can transfer mana from one source to another.
---@class mana_spreader
mana_spreader = {}

--- Returns the stored mana.
---@return number
function mana_spreader.getMana() end

---	Returns the capacity for mana.
---@return number
function mana_spreader.getMaxMana() end

--- Returns true if the spreader is empty.
---@return boolean
function mana_spreader.isEmpty() end

--- Returns true if the spreader is full.
---@return boolean
function mana_spreader.isFull() end

--- Returns the variant of the spreader.
---@return string
function mana_spreader.getVariant() end

--- Returns the coordinates of the target of the spreader.
---@return table
function mana_spreader.getBounding() end


--- A basin can hold items and fluids for processing crafting recipes with create.
---@class basin
basin = {}

--- Returns all fluids in the input tank of the basin.
---@return table
function basin.getInputFluids()	end

--- Returns all fluids in the output tank of the basin.
---@return table
function basin.getOutputFluids() end

--- Returns the filter of the basin as item.
---@return table
function basin.getFilter() end

--- Returns a table with all items in the basin.
---@return table
function basin.getInventory() end


--- A blaze burner uses blaze rods or other fuel types to heat up things above it.
--- As example a basin or a fluid tank.
---@class blaze_burner
blaze_burner = {}

--- Returns a table with information about the burner. fuelType, heatLevel, remainingBurnTime and isCreative.
---@return table
function blaze_burner.getInfo()	end


--- A Fluid Tank is a multiblock structure which can hold fluids. 8k mb per block.
---@class fluid_tank
fluid_tank =  {}

--- Returns a table with information about the tank. capacity, amount, fluid and isBoiler.
---@return table
function fluid_tank.getInfo() end


--- A mechanical mixer with a basin can process several shapeless recipes plus a couple extra ones.
---@class mechanical_mixer
mechanical_mixer = {}

--- Returns true if the mixer is currently running.
---@return boolean
function mechanical_mixer.isRunning() end

--- Returns true if the mixer has a basin.
---@return boolean
function mechanical_mixer.hasBasin() end


--- This integration works for all blocks with any type of a scroll value
--- behaviour. Like the speed controller or the creative motor.
---@class scroll_blocks
scroll_blocks = {}

--- Sets the target speed/value of the behaviour. Returns true if successful.
---@param number int
---@return boolean
function scroll_blocks.setTargetSpeed(int) end

--- Returns the target speed/value of the behaviour.
---@return number
function scroll_blocks.getTargetSpeed()	end