---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Communicate with other computers by using modems.
--- [rednet] provides a layer of abstraction on top of the main modem peripheral,
--- making it slightly easier to use.
---@class rednet
rednet = {}

--- The channel used by the [Rednet] API to broadcast messages.
CHANNEL_BROADCAST = 65535

--- The channel used by the [Rednet] API to repeat messages.
CHANNEL_REPEAT = 65533

--- The number of channels rednet reserves for computer IDs. Computers with IDs
--- greater or equal to this limit wrap around to 0.
MAX_ID_CHANNELS = 65500

--- Opens a modem with the given peripheral name, allowing it to send and receive
--- messages over rednet. This will open the modem on two channels: one which has
--- the same ID as the computer, and another on the broadcast channel.
--- Throws if there is no such modem with the given name.
---@param modem string The name of the modem to open
function rednet.open(modem) end

--- Close a modem with the given peripheral name, meaning it can no longer send and
--- receive rednet messages. Throws if there is no such modem with the given name.
---@param modem string | nil The side the modem exists on, if not given all open modems will be closed
function rednet.close(modem) end

--- Determine if rednet is currently open.
---@param modem string | nil Which modem to check, if not given all connected modems will be checked
---@return boolean If the given modem is open
function rednet.isOpen(modem) end

--- Allows a computer or turtle with an attached modem to send a message intended
--- for a sycomputer with a specific ID. At least one such modem must first be
--- opened before sending is possible. Assuming the target was in range and also
--- had a correctly opened modem, the target computer may then use [rednet.receive]
--- to collect the message.
---@param recipient number The ID of the receiving computer
---@param message The message to send, like with [modem.transmit], this can contain any primitive type (numbers, booleans and strings) as well as tables, other types (like functions), as well as metatables, will not be transmitted
---@param protocol string | nil The "protocol" to send this message under, when using [rednet.receive] one can filter to only receive messages sent under a particular protocol
---@return boolean If this message was successfully sent (i.e. if rednet is currently open); note, this does not guarantee the message was actually received
function rednet.send(recipient, message, protocol) end

--- Broadcasts a string message over the predefined [CHANNEL_BROADCAST] channel.
--- The message will be received by every device listening to rednet.
---@param message any The message to send, this should not contain coroutines or functions, as they will be converted to nil
---@param protocol string | nil The "protocol" to send this message under, when using [rednet.receive] one can filter to only receive messages sent under a particular protocol
function rednet.broadcast(message, protocol) end

--- Wait for a rednet message to be received, or until nTimeout seconds have elapsed.
---@param protocol_filter string The protocol the received message must be sent with, if specified any messages not sent under this protocol will be discarded
---@param timeout number | nil The number of seconds to wait if no message is received
---@return number | string | nil The computer which sent this message, the received message and the protocol this message was sent under; nil if the timeout elapsed and no message was received
function rednet.receive(protocol_filter, timeout) end

--- Register the system as "hosting" the desired protocol under the specified name.
--- If a [rednet.lookup] is performed for that protocol (and maybe name) on the same
--- network, the registered system will automatically respond via a background
--- process, hence providing the system performing the lookup with its ID number.
--- Multiple computers may not register themselves on the same network as having
--- the same names against the same protocols, and the title localhost is specifically
--- reserved. They may, however, share names as long as their hosted protocols
--- are different, or if they only join a given network after "registering"
--- themselves before doing so (eg while offline or part of a different network).
--- Throws if trying to register a hostname which is reserved, or currently in use.
---@param protocol string The protocol this computer provides
---@param hostname string The name this protocol exposes for the given protocol
function rednet.host(protocol, hostname) end

--- Stop hosting a specific protocol, meaning it will no longer respond to
--- [rednet.lookup] requests.
---@param protocol string The protocol to unregister your self from
function rednet.unhost(protocol) end

--- Search the local rednet network for systems hosting the desired protocol and returns
--- any computer IDs that respond as "registered" against it. If a hostname is specified,
--- only one ID will be returned (assuming an exact match is found).
---@param protocol string The protocol to search for
---@param hostname string | nil The hostname to search for
---@return number A list of computer IDs hosting the given protocol or the computer ID with the provided hostname and protocol, or nil if none exists
function rednet.lookup(protocol, hostname) end

--- Listen for modem messages and converts them into rednet messages, which may then be
--- received. This is automatically started in the background on computer startup, and
--- should not be called manually.
function rednet.run() end






