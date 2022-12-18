---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Emulates Lua's standard io library.
---@class io
io ={}

--- A file handle representing the "standard input". Reading from this file will prompt the user for input.
---@type Handle
io.stdin = {}

--- A file handle representing the "standard output". Writing to this file will display the written text to the screen.
---@type Handle
io.stdout = {}

--- A file handle representing the "standard error" stream.
--- One may use this to display error messages, writing to it will display them on the terminal.
---@type Handle
io.stderr = {}

--- Closes the provided file handle.
---@param file Handle The file handle to close, defaults to the current output file
function io.close(file)end

--- Flushes the current output file.
function io.flush() end

--- Get or set the current input file. Throws if the provided filename cannot be opened for reading.
---@param file Handle | string The new input file, either as a file path or pre-existing handle
---@return Handle The current input file
function io.input(file) end


--- Opens the given file name in read mode and returns an iterator that, each time it is called,
--- returns a new line from the file. This can be used in a for loop to iterate over all lines
--- of a file. Once the end of the file has been reached, nil will be returned. The file is
--- automatically closed. If no file name is given, the current input will be used instead.
--- In this case, the handle is not used. Throws if the file cannot be opened for reading.
---@param filename string | nil The name of the file to extract lines from
---@param ... any The argument to pass to [Handle:read] for each line
---@return function | nil The line iterator
function io.lines(filename,...) end

--- Open a file with the given mode, either returning a new file handle or nil, plus an error message.
--- The mode string can be any of the following:
--- "r": Read mode;
--- "w": Write mode;
--- "a": Append mode;
--- The mode may also have a b at the end, which opens the file in "binary mode". This allows you to
--- read binary files, as well as seek within a file.
---@param filename string The name of the file to open
---@param mode string | nil The mode to open the file with, this defaults to rb
---@return Handle | string | nil The opened file or nil in case of an error and the reason the file could not be opened
function io.open(filename, mode) end

--- Get or set the current output file. Throws if the provided filename cannot be opened for writing.
---@param file Handle | string | nil The new output file, either as a file path or pre-existing handle
---@return Handle The current output file
function io.output(file) end

--- Read from the currently opened input file. This is equivalent to [io.input():read(...)].
--- See the documentation there for full details.
---@param ... string The formats to read, defaulting to a whole line
---@return string | nil The data read, or nil if nothing can be read
function io.read(...) end

--- Checks whether handle is a given file handle, and determine if it is open or not.
---@param obj Handle The value to check
---@return string | nil "file" if this is an open file, "closed file" if it is a closed file handle, or nil if not a file handle
function io.type(obj) end

--- Write to the currently opened output file. This is equivalent to [io.output():write(...)].
--- See the documentation there for full details.
---@param ... string The strings to write
function io.write(...) end


--- A file handle which can be read or written to.
---@class Handle
local Handle = {}

--- Close this file handle, freeing any resources it uses. Throws if this handle was already closed.
---@return boolean | nil | string Return true if this handle was successfully closed or nil if this file handle could not be closed  and the reason it could not be closed
function Handle.close() end

--- Flush any buffered output, forcing it to be written to the file. Throws if the handle has been closed.
function Handle.flush() end

--- Returns an iterator that, each time it is called, returns a new line from the file. This can be used in
--- a for loop to iterate over all lines of a file. Once the end of the file has been reached, nil will be
--- returned. The file is not automatically closed. Throws if the file cannot be opened for reading.
---@param ... any The argument to pass to [Handle:read] for each line
---@return string | nil The line iterator
function Handle.lines(...) end

--- Reads data from the file, using the specified formats. For each format provided, the function returns
--- either the data read, or nil if no data could be read. The following formats are available:
--- l: Returns the next line (without a newline on the end);
--- L: Returns the next line (with a newline on the end);
--- a: Returns the entire rest of the file;
--- ~~n: Returns a number~~ (not implemented in CC).
--- These formats can be preceded by a * to make it compatible with Lua 5.1.
--- If no format is provided, l is assumed.
---@param ... string The formats to use
---@return string | nil The data read from the file
function Handle.read(...) end

--- Seeks the file cursor to the specified position, and returns the new position.
--- whence controls where the seek operation starts, and is a string that may be one of these three values:
--- set: base position is 0 (beginning of the file);
--- cur: base is current position;
--- end: base is end of file;
--- The default value of whence is cur, and the default value of offset is 0. This means that [Handle:seek()]
--- without arguments returns the current position without moving.
---@param whence string | nil The place to set the cursor from
---@param offset number | nil The offset from the start to move to
---@return number The new location of the file cursor
function Handle.seek(whence, offset) end

---@deprecated
--- Sets the buffering mode for an output file.
--- This has no effect under ComputerCraft, and exists with compatility with base Lua.
---@param mode string The buffering mode
---@param size number | nil The size of the buffer
function Handle.setvbuf(mode, size) end

--- Write one or more values to the file.
---@param ... string | number The values to write
---@return Handle The current file, allowing chained calls or nil if the file could not be written to and the error message which occurred while writing
function Handle.write(...) end
