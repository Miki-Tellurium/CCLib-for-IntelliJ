---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- A pretty printer for rendering data structures in an aesthetically pleasing manner.
--- In order to display something using [cc.pretty], you build up a series of documents.
--- These behave a little bit like strings; you can concatenate them together and then
--- print them to the screen. However, documents also allow you to control how they
--- should be printed. There are several functions (such as nest and group) which allow
--- you to control the "layout" of the document. When you come to display the document,
--- the 'best' (most compact) layout is used.
--- The structure of this module is based on [A Prettier Printer](https://homepages.inf.ed.ac.uk/wadler/papers/prettier/prettier.pdf).
---@class pretty
pretty = {}

--- An empty document.
function pretty.empty() end

--- A document with a single space in it.
function pretty.space() end

--- A line break. When collapsed with [pretty.group], this will be replaced with [pretty.empty].
function pretty.line() end

--- A line break. When collapsed with [pretty.group], this will be replaced with [pretty.space].
function pretty.space_line() end

--- Create a new document from a string. If your string contains multiple lines,
--- [pretty.group] will flatten the string into a single line, with spaces between each line.
---@param text string The string to construct a new document with
---@param color number | nil The color this text should be printed with; if not given, we default to the current color
---@return Doc The document with the provided text
function pretty.text(text, color) end

--- Concatenate several documents together. This behaves very similar to string concatenation.
---@param ... Doc | string The documents to concatenate
---@return Doc The concatenated documents
function pretty.concat(...) end

--- Indent later lines of the given document with the given number of spaces.
---@param depth number The number of spaces with which the document should be indented
---@param doc Doc The document to indent
---@return Doc The nested document
function pretty.nest(depth, doc) end

--- Builds a document which is displayed on a single line if there is enough room, or as normal if not.
---@param doc Doc The document to group
---@return Doc The grouped document
function pretty.group(doc) end

--- Display a document on the terminal.
---@param doc Doc The document to render
---@param ribbon_frac number | nil The maximum fraction of the width that we should write in (default to 0.6)
function pretty.write(doc, ribbon_frac) end

--- Display a document on the terminal with a trailing new line.
---@param doc Doc The document to render
---@param ribbon_frac number | nil The maximum fraction of the width that we should write in (default to 0.6)
function pretty.print(doc, ribbon_frac) end

--- Render a document, converting it into a string.
---@param doc Doc The document to render
---@param width number | nil The maximum width of this document, note that long strings will not be wrapped to fit this width - it is only used for finding the best layout
---@param ribbon_frac number | nil  The maximum fraction of the width that we should write in (default to 0.6)
---@return string The rendered document as a string
function pretty.render(doc, width, ribbon_frac) end

--- Pretty-print an arbitrary object, converting it into a document.
--- This can then be rendered with write or print. Option controls how various
--- properties are displayed:
--- * function_args: Show the arguments to a function if known (false by default);
--- * function_source: Show where the function was defined, instead of function: xxxxxxxx (false by default).
---@param obj any The object to pretty-print
---@param options table | nil Controls how various properties are displayed
---@return Doc The object formatted as a document
function pretty.pretty(obj, options) end

--- A shortcut for calling pretty and print together. See [pretty.pretty] for details about
--- the options format.
---@param obj any The object to pretty-print
---@param options table | nil Controls how various properties are displayed
---@param ribbon_frac number | nil  The maximum fraction of the width that we should write in (default to 0.6)
---@return Doc The object formatted as a document
function pretty.pretty_print(obj, options , ribbon_frac) end


--- A document containing formatted text, with multiple possible layouts. Documents
--- effectively represent a sequence of strings in alternative layouts, which we will
--- try to print in the most compact form necessary.
---@class Doc
local Doc = {}