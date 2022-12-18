---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Make HTTP requests, sending and receiving data to a remote web server.
---@class http
http ={}

--- Make a HTTP GET request to the given url.
---@param url string The url to request
---@param headers string | nil Additional headers to send as part of this request
---@param binary boolean | nil Whether to make a binary HTTP request; if true, the body will not be UTF-8 encoded, and the received response will not be decoded
---@return Response | nil The resulting http response, which can be read from or nil when the http request failed, such as in the event of a 404 error or connection timeout and a message detailing why the request failed
function http.get(...) end

--- Make a HTTP POST request to the given url.
---@param url string The url to request
---@param body string The body of the POST request
---@param headers string | nil Additional headers to send as part of this request
---@param binary boolean | nil Whether to make a binary HTTP request; if true, the body will not be UTF-8 encoded, and the received response will not be decoded
---@return Response | nil The resulting http response, which can be read from or nil when the http request failed, such as in the event of a 404 error or connection timeout and a message detailing why the request failed
function http.post(...) end

--- Asynchronously make a HTTP request to the given url.
--- This returns immediately, a [http_success] or [http_failure] will be queued once the request has completed.
---@param url string The url to request
---@param body string | nil An optional string containing the body of the request; if specified, a POST request will be made instead
---@param headers string | nil Additional headers to send as part of this request
---@param binary boolean | nil Whether to make a binary HTTP request; if true, the body will not be UTF-8 encoded, and the received response will not be decoded
function http.request(...) end

--- Asynchronously determine whether a URL can be requested. If this returns true, one should also
--- listen for [http_check] which will contain further information about whether the URL is allowed or not.
---@param url string The URL to check
---@return boolean | string If this url is valid (this does not imply that it is allowed) or not and a reason why this URL is not valid (for instance, if it is malformed, or blocked)
function http.checkURLAsync(url) end

--- Determine whether a URL can be requested. If this returns true, one should also listen for
--- [http_check] which will container further information about whether the URL is allowed or not.
---@param url string The URL to check
---@return boolean |string If this url is valid and can be requested via [http.request] or not and a reason why this URL is not valid (for instance, if it is malformed, or blocked)
function http.checkURL(url) end

--- Asynchronously open a websocket. This returns immediately, a [websocket_success] or [websocket_failure]
--- will be queued once the request has completed.
---@param url string The websocket url to connect to. This should have the ws:// or wss:// protocol
---@param headers string | nil Additional headers to send as part of the initial websocket connection
function http.websocketAsync(url, headers) end


--- Open a websocket.
---@param url string The websocket url to connect to, this should have the ws:// or wss:// protocol
---@param headers string | nil Additional headers to send as part of the initial websocket connection
---@return Websocket | boolean | string The websocket connection or false if the websocket connection failed and an error message describing why the connection failed
function http.websocket(url, headers) end


---A websocket, which can be used to send an receive messages with a web server.
---@class Websocket
local Websocket = {}

--- Wait for a message from the server. Throws if the websocket has been closed.
---@param timeout number | nil The number of seconds to wait if no message is received
---@return string | boolean | nil The received message, if this was a binary message, if the websocket was closed while waiting, or if we timed out
function Websocket:receive(timeout) end

--- Send a websocket message to the connected server. Throws if the message is too large or
--- if the websocket has been closed.
---@param message any The message to send
---@param binary boolean | nil Whether this message should be treated as a binary
function Websocket:send(message, binary) end

--- Close this websocket. This will terminate the connection, meaning messages can no longer be sent or received along it.
function Websocket:close() end

--To add: file methods
--- A http response. This provides the same methods as a file (or binary file if the request used binary mode),
--- though provides several request specific methods.
---@class Response
local Response = {}

--- Returns the response code and response message returned by the server.
---@return number | string The response code (i.e. 200), the response message (i.e. "OK")
function Response:getResponseCode() end

--- Get a table containing the response's headers, in a format similar to that required by [http.request].
--- If multiple headers are sent with the same name, they will be combined with a comma.
---@return string The response's headers
function Response:getResponseHeaders() end
