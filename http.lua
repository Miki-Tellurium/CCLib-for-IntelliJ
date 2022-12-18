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
function Websocket.receive(timeout) end

--- Send a websocket message to the connected server. Throws if the message is too large or
--- if the websocket has been closed.
---@param message any The message to send
---@param binary boolean | nil Whether this message should be treated as a binary
function Websocket.send(message, binary) end

--- Close this websocket. This will terminate the connection, meaning messages can no longer be sent or received along it.
function Websocket.close() end


--- A http response. This provides the same methods as a file (or binary file if the request used binary mode),
--- though provides several request specific methods.
---@class Response
local Response = {}

--- Read a line from the file. Throws if the file has been closed.
---@param withTrailing boolean | nil Whether to include the newline characters with the returned string, defaults to false
---@return string | nil The read line or nil if at the end of the file
function Response.readLine(withTrailing) end

--- Read the remainder of the file. Throws if the file has been closed.
---@return nil | string The remaining contents of the file, or nil if we are at the end
function Response.readAll() end

--- Read a number of characters from this file. Throws when trying to read a negative number of characters
--- or if the file has been closed.
---@param count number | nil The number of characters to read, defaulting to 1
---@return string | nil The read characters, or nil if at the of the file
function Response.read(count) end

--- Close this file, freeing any resources it uses. Throws if the file has already been closed.
--- Once a file is closed it may no longer be read or written to.
function Response.close() end

--- Seek to a new position within the file, changing where bytes are written to. The new position is an offset
--- given by offset, relative to a start position determined by whence:
--- "set": offset is relative to the beginning of the file;
--- "cur": Relative to the current position. This is the default;
--- "end": Relative to the end of the file;
--- In case of success, seek returns the new file position from the beginning of the file. Throws if the file has been closed.
---@param whence string | nil Where the offset is relative to
---@param offset number | nil The offset to seek to
---@return number | nil | string The new position or nil if seeking failed and the reason seeking failed
function Response.seek(whence, offset) end

--- Returns the response code and response message returned by the server.
---@return number | string The response code (i.e. 200), the response message (i.e. "OK")
function Response.getResponseCode() end

--- Get a table containing the response's headers, in a format similar to that required by [http.request].
--- If multiple headers are sent with the same name, they will be combined with a comma.
---@return string The response's headers
function Response.getResponseHeaders() end
