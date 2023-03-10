---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Interact with the computer's files and filesystem, allowing you to manipulate files, directories and paths.
--- This includes:
--- * Reading and writing files: call open to obtain a file "handle", which can be used to read from or write to a file.
--- * Path manipulation: manipulating file paths, joining them together or extracting components.
--- * Querying paths: for instance, checking if a file exists, or whether it's a directory.
--- * File and directory manipulation: moving or copying files.
---@class fs
fs = {}

--- Provides completion for a file or directory name, suitable for use with [_G.read].
--- When a directory is a possible candidate for completion, two entries are included - one with a trailing
--- slash (indicating that entries within this directory exist) and one without it (meaning this entry is an
--- immediate completion candidate). include_dirs can be set to false to only include those with a trailing slash.
---@param path string The path to complete
---@param location string The location where paths are resolved from
---@param include_files boolean When false, only directories will be included in the returned list
---@param include_dirs boolean When false, "raw" directories will not be included in the returned list
---@return string A list of possible completion candidates
function fs.complete(...) end

--- Returns true if a path is mounted to the parent filesystem. The root filesystem "/" is considered
--- a mount, along with disk folders and the rom folder. Other programs (such as network shares) can
--- extend this to make other mount types by correctly assigning their return value for [fs.getDrive].
--- Throws if the path does not exist.
---@param path string The path to check
---@return boolean If the path is mounted, rather than a normal file/folder
function fs.isDriveRoot(path) end

--- Returns a list of files in a directory. Throws if the path doesn't exist.
---@param path string The path to list
---@return string A table with a list of files in the directory
function fs.list(path) end

--- Combines several parts of a path into one full path, adding separators as needed.
---@param path string The first part of the path. For example, a parent directory path
---@param ... string Additional parts of the path to combine
---@return string The new path, with separators added between parts as needed
function fs.combine(path, ...) end

--- Returns the file name portion of a path.
---@param path string The path to get the name from
---@return string The final part of the path (the file name)
function fs.getName(path) end

--- Returns the parent directory portion of a path.
---@param path string The path to get the directory from
---@return string The path with the final part removed (the parent directory)
function fs.getDir(path) end

--- Returns the size of the specified file. Throws if the path doesn't exist.
---@param path string The file to get the file size of
---@return number The size of the file, in bytes
function fs.getSize(path) end

--- Returns whether the specified path exists.
---@param path string The path to check the existence of
---@return boolean Whether the path exists
function fs.exists(path) end

--- Returns whether the specified path is a directory.
---@param path string The path to check
---@return boolean Whether the path is a directory
function fs.isDir(path) end

--- Returns whether a path is read-only.
---@param path string The path to check
---@return boolean Whether the path cannot be written to
function fs.isReadOnly(path) end

--- Creates a directory, and any missing parents, at the specified path. Throws if the directory couldn't be created.
---@param path string The path to the directory to create
function fs.makeDir(path) end

--- Moves a file or directory from one path to another. Any parent directories are created as needed.
--- Throws if the file or directory couldn't be moved.
---@param path string The current file or directory to move from
---@param dest string The destination path for the file or directory
function fs.move(path, dest) end

--- Copies a file or directory to a new path. Any parent directories are created as needed.
--- Throws if the file or directory couldn't be copied.
---@param path string The file or directory to copy
---@param dest string The path to the destination file or directory
function fs.copy(path, dest) end

--- Deletes a file or directory. If the path points to a directory, all of the enclosed files and
--- subdirectories are also deleted. Throws if the file or directory couldn't be deleted.
---@param path string The path to the file or directory to delete.
function fs.delete(path) end

--- Opens a file for reading or writing at a path. The mode string can be any of the following:
--- "r": Read mode;
--- "w": Write mode;
--- "a": Append mode;
--- The mode may also have a "b" at the end, which opens the file in "binary mode". This allows you to read binary files, as well as seek within a file.
--- Throws if an invalid mode was specified.
---@param path string The path to the file to open
---@param mode string The mode to open the file with
---@return ReadHandle | BinaryReadHandle | WriteHandle | BinaryWriteHandle| nil A file handle object for the file or nil if the file does not exist, or cannot be opened
function fs.open(path, mode) end

--- Returns the name of the mount that the specified path is located on.
--- Throws if the path doesn't exist.
---@param path string The path to get the drive of
---@return string | nil The name of the drive that the file is on; e.g. hdd for local files, or rom for ROM files
function fs.getDrive(path) end

--- Returns the amount of free space available on the drive the path is located on.
--- Throws if the path doesn't exist.
---@param path string The path to check the free space for
---@return number | string The amount of free space available, in bytes, or "unlimited"
function fs.getFreeSpace(path) end

--- Searches for files matching a string with wildcards. This string is formatted like a normal
--- path string, but can include any number of wildcards (*) to look for files matching anything.
--- For example, rom/*/command* will look for any path starting with command inside any subdirectory
--- of /rom. Throws if the path doesn't exist.
---@param path string The wildcard-qualified path to search for
---@return string A list of paths that match the search string
function fs.find(path) end

--- Returns the capacity of the drive the path is located on.
--- Throws if the capacity cannot be determined.
---@param path string The path of the drive to get
---@return number | nil This drive's capacity. This will be nil for "read-only" drives, such as the ROM or treasure disks
function fs.getCapacity(path) end

--- Get attributes about a specific file or folder. The returned attributes table contains information
--- about the size of the file, whether it is a directory, when it was created and last modified, and
--- whether it is read only. The creation and modification times are given as the number of milliseconds
--- since the UNIX epoch. This may be given to [os.date] in order to convert it to more usable form.
--- Throws if the path does not exist.
---@param path string The path to get attributes for
---@return table The resulting attributes
function fs.attributes(path) end


--- A file handle opened with [fs.open] with the "rb" mode.
---@class BinaryReadHandle
local BinaryReadHandle = {}

--- Read a number of bytes from this file. Throws when trying to read a negative number of bytes or if the
--- file has been closed.
---@param count number | nil The number of bytes to read; when absent, a single byte will be read as a number (this may be 0 to determine we are at the end of the file)
---@return nil | number | string Returns nil if we are at the end of the file or the value of the byte read (this is returned when the count is absent)or the bytes read as a string
function BinaryReadHandle.read(count) end

--- Read the remainder of the file. Throws if the file has been closed.
---@return string | nil The remaining contents of the file, or nil if we are at the end
function BinaryReadHandle.readAll() end

--- Read a line from the file. Throws if file has been closed.
---@param withTrailing boolean | nil Whether to include the newline characters with the returned string, defaults to false
---@return string | nil The read line or nil if at the end of the file
function BinaryReadHandle.readLine(withTrailing) end

--- Seek to a new position within the file, changing where bytes are written to. The new position is an offset
--- given by offset, relative to a start position determined by whence:
--- "set": offset is relative to the beginning of the file;
--- "cur": Relative to the current position. This is the default;
--- "end": Relative to the end of the file;
--- In case of success, seek returns the new file position from the beginning of the file. Throws if the file has been closed.
---@param whence string | nil Where the offset is relative to
---@param offset number | nil The offset to seek to
---@return number | nil | string The new position or nil if seeking failed and the reason seeking failed
function BinaryReadHandle.seek(whence, offset) end

--- Close this file, freeing any resources it uses. Once a file is closed it may no longer be read or written to.
--- Throws if the file has already been closed.
function BinaryReadHandle.close() end


--- A file handle opened with [fs.open] with the "r" mode.
---@class ReadHandle
local ReadHandle = {}

--- Read a line from the file. Throws if the file has been closed.
---@param withTrailing boolean | nil Whether to include the newline characters with the returned string, defaults to false
---@return string | nil The read line or nil if at the end of the file
function ReadHandle.readLine(withTrailing) end

--- Read the remainder of the file. Throws if the file has been closed.
---@return nil | string The remaining contents of the file, or nil if we are at the end
function ReadHandle.readAll() end

--- Read a number of characters from this file. Throws when trying to read a negative number of characters
--- or if the file has been closed.
---@param count number | nil The number of characters to read, defaulting to 1
---@return string | nil The read characters, or nil if at the of the file
function ReadHandle.read(count) end

--- Close this file, freeing any resources it uses. Throws if the file has already been closed.
--- Once a file is closed it may no longer be read or written to.
function ReadHandle.close() end


--- A file handle opened by [fs.open] using the "w" or "a" modes.
---@class WriteHandle
local WriteHandle = {}

--- Write a string of characters to the file. Throws if the file has been closed.
---@param value any The value to write to the file
function WriteHandle.write(value) end

--- Write a string of characters to the file, follwing them with a new line character. Throws if the file has been closed.
---@param value any The value to write to the file
function WriteHandle.writeLine(value) end

--- Save the current file without closing it. Throws if the file has been closed.
function WriteHandle.flush() end

--- Close this file, freeing any resources it uses. Once a file is closed it may no longer be read or written to.
--- Throws if the file has already been closed.
function WriteHandle.close() end


--- A file handle opened by [fs.open] using the "wb" or "ab" modes.
---@class BinaryWriteHandle
local BinaryWriteHandle = {}

--- Write a string or byte to the file. Throws if the file has been closed.
---@param ... number | string byte to write or the string to write
function BinaryWriteHandle.write(...) end

--- Save the current file without closing it. Throws if the file has been closed.
function BinaryWriteHandle.flush() end

--- Close this file, freeing any resources it uses. Once a file is closed it may no longer be read or written to.
--- Throws if the file has already been closed.
function BinaryWriteHandle.close() end

--- Seek to a new position within the file, changing where bytes are written to. The new position is an offset
--- given by offset, relative to a start position determined by whence:
--- "set": offset is relative to the beginning of the file;
--- "cur": Relative to the current position. This is the default;
--- "end": Relative to the end of the file;
--- In case of success, seek returns the new file position from the beginning of the file. Throws if the file has been closed.
---@param whence string | nil Where the offset is relative to
---@param offset number | nil The offset to seek to
---@return number | nil | string The new position or nil if seeking failed and the reason seeking failed
function BinaryWriteHandle.seek(whence, offset) end