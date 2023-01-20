---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- The os API allows interacting with the current computer.
---@class os
os = {}

---@deprecated
--- *When possible it's best to avoid using this function. It pollutes the global table and can mask errors.
--- [require] should be used to load libraries instead.*
---
--- Loads the given API into the global environment. This function loads and executes the file at
--- the given path, and all global variables and functions exported by it will by available through
--- the use of [myAPI.function-name], where myAPI is the base name of the API file.
---@param path string The path of the API to load
---@return boolean Whether or not the API was successfully loaded
function os.loadAPI(path) end

---@deprecated
--- *🛈 DEPRECATED See [os.loadAPI] for why.*
---
--- Unloads an API which was loaded by os.loadAPI. This effectively removes the specified table from _G.
---@param name string The name of the API to unload
function os.unloadAPI(name) end

--- Pause execution of the current thread and waits for any events matching filter.
--- This function yields the current process and waits for it to be resumed with a
--- vararg list where the first element matches filter. If no filter is supplied,
--- this will match all events. Unlike [os.pullEventRaw], it will stop the application
--- upon a "terminate" event, printing the error "Terminated".
---@param filter event | nil Event to filter for
---@return event | any The name of the event that fired and optional additional parameters of the event
function os.pullEvent(filter) end

--- Pause execution of the current thread and waits for events, including the terminate event.
--- This behaves almost the same as [os.pullEvent], except it allows you to handle the terminate
--- event yourself - the program will not stop execution when Ctrl+T is pressed.
---@param filter event | nil Event to filter for
---@return event | any The name of the event that fired and optional additional parameters of the event
function os.pullEventRaw(filter) end

--- Pauses execution for the specified number of seconds, alias of [_G.sleep].
---@param time number The number of seconds to sleep for, rounded up to the nearest multiple of 0.05
function os.sleep(time) end

--- Get the current CraftOS version (for example, CraftOS 1.8). This is defined by bios.lua.
--- For the current version of CC:Tweaked, this should return CraftOS 1.8.
---@return string The current CraftOS version
function os.version() end

--- Run the program at the given path with the specified environment and arguments. This function
--- does not resolve program names like the shell does. This means that, for example, [os.run("edit")]
--- will not work. As well as this, it does not provide access to the [shell] API in the environment.
--- For this behaviour, use [shell.run] instead. If the program cannot be found, or failed to run,
--- it will print the error and return false. If you want to handle this more gracefully, use an
--- alternative such as [os.loadfile].
---@param env table The environment to run the program with
---@param path string The exact path of the program to run
---@param ... any The arguments to pass to the program
---@return boolean Whether or not the program ran successfully
function os.run(env, path, ...) end

--- Adds an event to the event queue. This event can later be pulled with [os.pullEvent].
---@param name event The name of the event to queue
---@param ... any The parameters of the event
function os.queueEvent(name, ...) end

--- Starts a timer that will run for the specified number of seconds. Once the timer fires, a timer
--- event will be added to the queue with the ID returned from this function as the first parameter.
--- As with [sleep], timer will automatically be rounded up to the nearest multiple of 0.05 seconds,
--- as it waits for a fixed amount of world ticks. Throws if the time is below zero.
---@param timer number The number of seconds until the timer fires
---@return number The ID of the new timer, this can be used to filter the timer event, or cancel the timer
function os.startTimer(timer) end

--- Cancels a timer previously started with [os.startTimer]. This will stop the timer from firing.
---@param token number The ID of the timer to cancel
function os.cancelTimer(token) end

--- Sets an alarm that will fire at the specified in-game time. When it fires, an alarm event will
--- be added to the event queue with the ID returned from this function as the first parameter.
---@param time number The time at which to fire the alarm, in the range [0.0, 24.0)
---@return number The ID of the new alarm, this can be used to filter the alarm event, or cancel the alarm
function os.setAlarm(time) end

--- Cancels an alarm previously started with [os.setAlarm]. This will stop the alarm from firing.
---@param token number The ID of the alarm to cancel
function os.cancelAlarm(token) end

--- Shuts down the computer immediately.
function os.shutdown() end

--- Reboots the computer immediately.
function os.reboot() end

--- Returns the ID of the computer.
---@return number The ID of the computer
function os.getComputerID() end

--- Returns the ID of the computer.
---@return number The ID of the computer
function os.computerID() end

--- Returns the label of the computer, or nil if none is set.
---@return string | nil The label of the computer
function os.getComputerLabel() end

--- Returns the label of the computer, or nil if none is set.
---@return string | nil The label of the computer
function os.computerLabel() end

--- Set the label of this computer.
---@param label string | nil The new label, may be nil in order to clear it
function os.setComputerLabel(label) end

--- Returns the number of seconds that the computer has been running.
---@return number The computer's uptime
function os.clock() end

--- Returns the current time depending on the string passed in. This will always be in the range [0.0, 24.0).
--- If called with ingame, the current world time will be returned. This is the default if nothing is passed.
--- If called with utc, returns the hour of the day in UTC time.
--- If called with local, returns the hour of the day in the timezone the server is located in.
--- This function can also be called with a table returned from [os.date], which will convert the date fields into
--- a UNIX timestamp (number of seconds since 1 January 1970). Throws if an invalid locale is passed.
---@param locale string | table | nil The locale of the time, or a table filled by [os.date("*t")] to decode, defaults to ingame locale if not specified
---@return any The hour of the selected locale, or a UNIX timestamp from the table, depending on the argument passed in
function os.time(locale) end

--- Returns the day depending on the locale specified. If called with ingame, returns the number of days since
--- the world was created. This is the default. If called with utc, returns the number of days since 1 January
--- 1970 in the UTC timezone. If called with local, returns the number of days since 1 January 1970 in the
--- server's local timezone. Throws if an invalid locale is passed.
---@param args string | nil The locale to get the day for. Defaults to ingame if not set
---@return number The day depending on the selected locale
function os.day(args) end

--- Returns the number of milliseconds since an epoch depending on the locale.
--- If called with ingame, returns the number of milliseconds since the world was created. This is the default.
--- If called with utc, returns the number of milliseconds since 1 January 1970 in the UTC timezone.
--- If called with local, returns the number of milliseconds since 1 January 1970 in the server's local timezone.
--- Throws if an invalid locale is passed.
---@param args string | nil The locale to get the milliseconds for, defaults to ingame if not set
---@return number The milliseconds since the epoch depending on the selected locale
function os.epoch(args) end

--- Returns a date string (or table) using a specified format string and optional time to format.
--- The format string takes the same formats as C's strftime function ([http://www.cplusplus.com/reference/ctime/
--- strftime/]). In extension, it can be prefixed with an exclamation mark (!) to use UTC time instead of the server's
--- local timezone. If the format is exactly *t (optionally prefixed with !), a table will be returned instead.
--- This table has fields for the year, month, day, hour, minute, second, day of the week, day of the year, and
--- whether Daylight Savings Time is in effect. This table can be converted to a UNIX timestamp (days since 1
--- January 1970) with date. Throws if an invalid format is passed.
---@param format string | nil The format of the string to return, this defaults to %c, which expands to a string similar to "Sat Dec 24 16:58:00 2011"
---@param time number | nil The time to convert to a string, this defaults to the current time
---@return any The resulting format string
function os.date(format, time) end

---@class event
local event = string

--- The [timer] event is fired when an alarm started with [os.setAlarm] completes.
---@return string | number The event name and the ID of the alarm that finished
alarm = event

--- The [char] event is fired when a character is typed on the keyboard. The [char] event is different
--- to a key press. Sometimes multiple key presses may result in one character being typed (for
--- instance, on some European keyboards). Similarly, some keys (e.g. Ctrl) do not have any
--- corresponding character. The key should be used if you want to listen to key presses themselves.
---@return string The event name and the string representing the character that was pressed
char = event

--- The [computer_command] event is fired when the /computercraft queue command is run for the current computer.
---@return string The event name and the arguments passed to the command
computer_command = event

--- The [disk] event is fired when a disk is inserted into an adjacent or networked disk drive.
---@return string The event name and the side of the disk drive that had a disk inserted
disk = event

--- The [disk_eject] event is fired when a disk is removed from an adjacent or networked disk drive.
---@return string The event name and the side of the disk drive that had a disk removed
disk_eject = event

--- The [file_transfer] event is queued when a user drags-and-drops a file on an open computer.
--- This event contains a single argument, that in turn has a single method [getFiles]. This
--- returns the list of files that are being transferred. Each file is a binary file handle
--- with an additional [getName] method.
---@return string The event name and the list of transferred files
file_transfer = event

--- The [http_check] event is fired when a URL check finishes.
--- This event is normally handled inside [http.checkURL], but it can still be seen when using [http.checkURLAsync].
---@return string | boolean | nil The event name, the URL requested to be checked, whether the check succeeded; nil if the check failed and a reason explaining why the check failed
http_check = event

--- The [http_failure] event is fired when an HTTP request fails.
--- This event is normally handled inside [http.get] and [http.post], but it can still be seen when using [http.request].
---@return string | nil The event name, the URL of the site requested and an error describing the failure; nil: a response handle if the connection succeeded, but the server's response indicated failure
http_failure = event

--- The [http_success] event is fired when an HTTP request returns successfully.
--- This event is normally handled inside [http.get] and [http.post], but it can still be seen when using [http.request].
---@return string The event name, the URL of the site requested and the handle for the response text
http_success = event

--- This event is fired when any key is pressed while the terminal is focused. This event returns
--- a numerical "key code" (for instance, F1 is 290). This value may vary between versions and so
--- it is recommended to use the constants in the [keys] API rather than hard coding numeric values.
--- If the button pressed represented a printable character, then the [key] event will be followed
--- immediately by a [char] event. If you are consuming text input, use a [char] event instead!
---@return string | number | boolean The event name, the numerical key value of the key pressed and whether the [key] event was generated while holding the key (true), rather than pressing it the first time (false)
key = event

--- Fired whenever a key is released (or the terminal is closed while a key was being pressed).
--- This event returns a numerical "key code" (for instance, F1 is 290). This value may vary
--- between versions and so it is recommended to use the constants in the [keys] API rather than
--- hard coding numeric values.
---@return string | number The event name and the numerical key value of the key pressed
key_up = event

--- The [modem_message] event is fired when a message is received on an open channel on any modem.
---@return string | number | any The event name, the side of the modem that received the message, the channel that the message was sent on, the reply channel set by the sender, the message as sent by the sender and the distance between the sender and the receiver, in blocks
modem_message = event

--- The [monitor_resize] event is fired when an adjacent or networked monitor's size is changed.
---@return string The event name and the side or network ID of the monitor that resized
monitor_resize = event

--- The [monitor_touch] event is fired when an adjacent or networked Advanced Monitor is right-clicked.
---@return string | number The event name, the side or network ID of the monitor that was touched and the X and Y coordinates of the touch, in characters
monitor_touch = event

--- This event is fired when the terminal is clicked with a mouse. This event is only fired
--- on advanced computers (including advanced turtles and pocket computers).
---@return string | number The event name, the mouse button that was clicked and the X and Y coordinates of the click
mouse_click = event

--- This event is fired every time the mouse is moved while a mouse button is being held.
---@return string | number The event name, the mouse button that is being pressed and the X and Y coordinates of the mouse
mouse_drag = event

--- This event is fired when a mouse wheel is scrolled in the terminal.
---@return string | number  The event name, the direction of the scroll (-1 = up, 1 = down) and the X and Y coordinates of the mouse when scrolling
mouse_scroll = event

--- This event is fired when a mouse button is released or a held mouse leaves the computer's terminal.
---@return string | number The event name, the mouse button that was released and the X and Y coordinates of the mouse
mouse_up = event

--- The [paste] event is fired when text is pasted into the computer through Ctrl-V (or ⌘V on Mac).
---@return string The event name and the string that was pasted
paste = event

--- The [peripheral] event is fired when a peripheral is attached on a side or to a modem.
---@return string The event name and the side the peripheral was attached to
peripheral = event

--- The [peripheral_detach] event is fired when a peripheral is detached from a side or from a modem.
---@return string The event name and the side the peripheral was detached from
peripheral_detach = event

--- The [rednet_message] event is fired when a message is sent over Rednet. This event is usually
--- handled by [rednet.receive], but it can also be pulled manually. [rednet_message] events are sent
--- by [rednet.run] in the top-level coroutine in response to [modem_message] events. A [rednet_message]
--- event is always preceded by a [modem_message] event. They are generated inside CraftOS rather
--- than being sent by the ComputerCraft machine.
---@return string | number | any | nil The event name, the ID of the sending computer, the message sent and the protocol of the message, if provided
rednet_message = event

--- The redstone event is fired whenever any redstone inputs on the computer change.
---@return string The event name
redstone = event

--- This event is fired when the speaker with a full buffer frees up some space.
---@return string The event name and the name of the speaker which is available to play more audio
speaker_audio_empty = event

--- The [task_complete] event is fired when an asynchronous task completes. This is usually handled
--- inside the function call that queued the task; however, functions such as [commands.execAsync]
--- return immediately so the user can wait for completion.
---@return string | number | boolean The event name, the ID of the task that completed and whether the command succeeded; if the command failed, an error message explaining the failure
task_complete = event

--- The [term_resize] event is fired when the main terminal is resized. For instance:
--- when a the tab bar is shown or hidden in multishell or
--- when the terminal is redirected to a monitor via the "monitor" program and the monitor is resized.
--- When this event fires, some parts of the terminal may have been moved or deleted. Simple
--- terminal programs (those not using [term.setCursorPos]) can ignore this event, but more complex
--- GUI programs should redraw the entire screen.
term_resize = event

--- The terminate event is fired when Ctrl-T is held down. This event is normally handled by [os.pullEvent],
--- and will not be returned. However, [os.pullEventRaw] will return this event when fired.
--- [terminate] will be sent even when a filter is provided to [os.pullEventRaw]. When using
--- [os.pullEventRaw] with a filter, make sure to check that the event is not [terminate].
terminate = event

--- The [timer] event is fired when a timer started with [os.startTimer] completes.
---@return string | number The event name and the ID of the timer that finished
timer = event

--- The [turtle_inventory] event is fired when a turtle's inventory is changed.
turtle_inventory = event

--- The [websocket_closed] event is fired when an open WebSocket connection is closed.
---@return string The event name and the URL of the WebSocket that was closed
websocket_closed = event

--- The [websocket_failure] event is fired when a WebSocket connection request fails.
--- This event is normally handled inside [http.websocket], but it can still be seen when using [http.websocketAsync].
---@return string The event name, the URL of the site requested and an error describing the failure
websocket_failure = event


--- The [websocket_message] event is fired when a message is received on an open WebSocket connection.
--- This event is normally handled by [http.Websocket.receive], but it can also be pulled manually.
---@return string | boolean The event name, the URL of the WebSocket, the contents of the message and whether this is a binary message
websocket_message = event

--- The [websocket_success] event is fired when a WebSocket connection request returns successfully.
--- This event is normally handled inside [http.websocket], but it can still be seen when using [http.websocketAsync].
---@return string | Websocket The event name, the URL of the site and the handle for the WebSocket
websocket_success = event