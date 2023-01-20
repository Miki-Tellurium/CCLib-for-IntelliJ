---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Helpful utilities for formatting and manipulating strings.
---@class textutils
textutils = {}

--- Slowly writes string text at current cursor position, character-by-character.
--- Like [write], this does not insert a newline at the end.
---@param text string The the text to write to the screen
---@param rate number | nil The number of characters to write each second, defaults to 20
function textutils.slowWrite(text, rate) end

--- Slowly prints string text at current cursor position, character-by-character.
--- Like [print], this inserts a newline after printing.
---@param text string The the text to write to the screen
---@param rate number | nil The number of characters to write each second, defaults to 20
function textutils.slowPrint(text, rate) end

--- Takes input time and formats it in a more readable format such as 6:30 PM.
---@param nTime number The time to format, as provided by [os.time]
---@param bTwentyFourHour boolean | nil Whether to format this as a 24-hour clock (18:30) rather than a 12-hour one (6:30 AM)
---@return string The formatted time
function textutils.formatTime(nTime, bTwentyFourHour) end

--- Prints a given string to the display. If the action can be completed without scrolling, it acts
--- much the same as [print]; otherwise, it will throw up a "Press any key to continue" prompt at the
--- bottom of the display. Each press will cause it to scroll down and write a single line more before
--- prompting again, if need be.
---@param text string The text to print to the screen
---@param free_lines number | nil The number of lines which will be automatically scrolled before the first prompt appears (meaning free_lines + 1 lines will be printed), this can be set to the cursor's y position - 2 to always try to fill the screen; defaults to 0, meaning only one line is displayed before prompting
---@return number The number of lines printed
function textutils.pagedPrint(text, free_lines) end

--- Prints tables in a structured form. This accepts multiple arguments, either a table or a number.
--- When encountering a table, this will be treated as a table row, with each column width being
--- auto-adjusted. When encountering a number, this sets the text color of the subsequent rows to it.
---@param ... table | number The rows and text colors to display
function textutils.tabulate(...) end

--- Prints tables in a structured form, stopping and prompting for input should the result not fit on the
--- terminal. This functions identically to [textutils.tabulate], but will prompt for user input should the
--- whole output not fit on the display.
---@param ... table | number The rows and text colors to display
function textutils.pagedTabulate(...) end

--- A table representing an empty JSON array, in order to distinguish it from an empty JSON object.
--- The contents of this table should not be modified.
textutils.empty_json_array = {}

--- A table representing the JSON null value. The contents of this table should not be modified.
textutils.json_null = {}

--- Convert a Lua object into a textual representation, suitable for saving in a file or pretty-printing.
--- Options for serialization:
--- * compact: Do not emit indentation and other whitespace between terms;
--- * allow_repetitions: Relax the check for recursive tables, allowing them to appear multiple times (as long as tables do not appear inside themselves).
---
--- Throws if the object contains a value which cannot be serialized. This includes functions and tables which appear multiple times.
---@param t any The object to serialize
---@param opts table The options for serialization
---@return string The serialized representation
function textutils.serialize(t, opts) end

--- Convert a Lua object into a textual representation, suitable for saving in a file or pretty-printing.
--- Options for serialisation:
--- * compact: Do not emit indentation and other whitespace between terms;
--- * allow_repetitions: Relax the check for recursive tables, allowing them to appear multiple times (as long as tables do not appear inside themselves).
---
--- Throws if the object contains a value which cannot be serialised. This includes functions and tables which appear multiple times.
---@param t any The object to serialise
---@param opts table The options for serialization
---@return string The serialised representation
function textutils.serialise(t, opts) end

--- Converts a serialized string back into a reassembled Lua object. This is mainly used together whit
--- [textutils.serialize].
---@param s string The serialized string to deserialize.
---@return table | nil The deserialized object or nil if the object could not be deserialized
function textutils.unserialize(s) end

--- Converts a serialised string back into a reassembled Lua object. This is mainly used together whit
--- [textutils.serialise].
---@param s string The serialised string to deserialise.
---@return table | nil The deserialised object or nil if the object could not be deserialised
function textutils.unserialise(s) end

--- Returns a JSON representation of the given data. This function attempts to guess whether a table is
--- a JSON array or object. However, empty tables are assumed to be empty objects - use
--- [textutils.empty_json_array] to mark an empty array. This is largely intended for interacting with
--- various functions from the [commands] API, though may also be used in making http requests.
--- Throws if the object contains a value which cannot be serialized. This includes functions and tables which appear multiple times.
---@param t table The value to serialize; like [textutils.serialize], this should not contain recursive tables or functions
---@param bNBTStyle boolean | nil Whether to produce NBT-style JSON (non-quoted keys) instead of standard JSON
---@return string The JSON representation of the input
function textutils.serializeJSON(t, bNBTStyle) end

--- Returns a JSON representation of the given data. This function attempts to guess whether a table is
--- a JSON array or object. However, empty tables are assumed to be empty objects - use
--- [textutils.empty_json_array] to mark an empty array. This is largely intended for interacting with
--- various functions from the [commands] API, though may also be used in making http requests.
--- Throws if the object contains a value which cannot be serialised. This includes functions and tables which appear multiple times.
---@param t table The value to serialise, like [textutils.serialise], this should not contain recursive tables or functions
---@param bNBTStyle boolean | nil Whether to produce NBT-style JSON (non-quoted keys) instead of standard JSON
---@return string The JSON representation of the input
function textutils.serialiseJSON(t, bNBTStyle) end

--- Converts a serialized JSON string back into a reassembled Lua object. This may be used with
--- [textutils.serializeJSON], or when communicating with command blocks or web APIs.
--- If a null value is encountered, it is converted into nil. It can be converted into
--- [textutils.json_null] with the parse_null option. If an empty array is encountered, it is converted
--- into [textutils.empty_json_array]. It can be converted into a new empty table with the
--- parse_empty_array option. Options which control how this JSON object is parsed:
--- * nbt_style: When true, this will accept stringified NBT strings, as produced by many commands;
--- * parse_null: When true, null will be parsed as json_null, rather than nil;
--- * parse_empty_array: When false, empty arrays will be parsed as a new table. By default (or when this value is true), they are parsed as empty_json_array.
---@param s string The serialized string to deserialize
---@param options table | nil Options which control how this JSON object is parsed
---@return table The deserialized object or nil if the object could not be deserialized and a message describing why the JSON string is invalid
function textutils.unserializeJSON(s, options) end

--- Converts a serialised JSON string back into a reassembled Lua object. This may be used with
--- [textutils.serialiseJSON], or when communicating with command blocks or web APIs.
--- If a null value is encountered, it is converted into nil. It can be converted into
--- [textutils.json_null] with the parse_null option. If an empty array is encountered, it is converted
--- into [textutils.empty_json_array]. It can be converted into a new empty table with the
--- parse_empty_array option. Options which control how this JSON object is parsed:
--- * nbt_style: When true, this will accept stringified NBT strings, as produced by many commands;
--- * parse_null: When true, null will be parsed as json_null, rather than nil;
--- * parse_empty_array: When false, empty arrays will be parsed as a new table. By default (or when this value is true), they are parsed as empty_json_array.
---@param s string The serialised string to deserialise
---@param options table | nil Options which control how this JSON object is parsed
---@return table The deserialised object or nil if the object could not be deserialised and a message describing why the JSON string is invalid
function textutils.unserialiseJSON(s, options) end

--- Replaces certain characters in a string to make it safe for use in URLs or POST data.
---@param str string The string to encode
---@return string The encoded string
function textutils.urlEncode(str) end

--- Provides a list of possible completions for a partial Lua expression. If the completed element is a
--- table, suggestions will have . appended to them. Similarly, functions have ( appended to them.
---@param sSearchText string The partial expression to complete, such as a variable name or table index
---@param tSearchTable table | nil The table to find variables in, defaulting to the global environment ([_G]), the function also searches the "parent" environment via the __index metatable field
---@return table The (possibly empty) list of completions
function textutils.complete(sSearchText, tSearchTable) end