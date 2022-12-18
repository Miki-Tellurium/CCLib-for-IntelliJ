---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---

--- Execute Minecraft commands and gather data from the results from a command computer.
--- While one may use [commands.exec] directly to execute a command, the [commands] API also provides
--- helper methods to execute every command.
---@class commands
commands = {}

--- Execute a specific command.
---@param command string The command to execute
---@return boolean, string, number | nil  Whether the command executed successfully, the output of this command as a list of lines and the number of "affected" objects, or nil if the command failed
function commands.exec(command) end

--- Asynchronously execute a command. Unlike [commands.exec], this will immediately return, instead of
--- waiting for the command to execute. This allows you to run multiple commands at the same time.
--- When this command has finished executing, it will queue a [task_complete] event containing the
--- result of executing this command (what [commands.exec] would return).
---@param command string The command to execute
---@return number The "task id". When this command has been executed, it will queue a [task_complete] event with a matching id
function commands.execAsync(command) end

--- List all available commands which the computer has permission to execute.
---@param ... string The sub-command to complete
---@return string A list of all available commands
function commands.list(...) end

--- Get the position of the current command computer.
---@return number, number, number This computer's x, y and z position
function commands.getBlockPosition() end

--- Get information about a range of blocks.This returns the same information as getBlockInfo,
--- just for multiple blocks at once. Blocks are traversed by ascending y level, followed by z
--- and x. The returned table may be indexed using x + z*width + y*depth*depth. Throws:
--- if the coordinates are not within the world;
--- if trying to get information about more than 4096 blocks.
---@param minX number The start x coordinate of the range to query
---@param minY number The start y coordinate of the range to query
---@param minZ number The start z coordinate of the range to query
---@param maxX number The end x coordinate of the range to query
---@param maxY number The end y coordinate of the range to query
---@param maxZ number The end z coordinate of the range to query
---@param dimension string | nil The dimension to query (e.g. "minecraft:overworld"), defaults to the current dimension
---@return table A list of information about each block
function commands.getBlockInfos(minX, minY, minZ, maxX, maxY, maxZ , dimension) end

--- Get some basic information about a block. The returned table contains the current name, metadata and
--- block state (as with [turtle.inspect]). If there is a tile entity for that block, its NBT will also be returned.
---@param x number The x position of the block to query
---@param y number The y position of the block to query
---@param z number The z position of the block to query
---@param dimension string | nil The dimension to query (e.g. "minecraft:overworld"), defaults to the current dimension
---@return table The given block's information
function commands.getBlockInfo(x, y, z , dimension) end

---@generic
--- The built-in commands API, without any generated command helper functions.
--- This may be useful if a built-in function (such as [commands.list]) has been overwritten by a command.
native = {}

---@generic
--- A table containing asynchronous wrappers for all commands. As with [commands.execAsync],
--- this returns the "task id" of the enqueued command.
commands.async = {}