---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Utilities for drawing more complex graphics, such as pixels, lines and images.
---@class paintutils
paintutils = {}

--- Parses an image from a multi-line string.
---@param image string The string containing the raw-image data
---@return table The parsed image data, suitable for use with [paintutils.drawImage]
function paintutils.parseImage(image) end

--- Loads an image from a file. You can create a file suitable for being loaded using the paint program.
---@param path string The file to load
---@return table | nil The parsed image data, suitable for use with [paintutils.drawImage], or nil if the file does not exist
function paintutils.loadImage(path) end

--- Draws a single pixel to the current terminal at the specified position. Be warned, this may change
--- the position of the cursor and the current background color. You should not expect either to be preserved.
---@param xPos number The x position to draw at, where 1 is the far left
---@param yPos number The y position to draw at, where 1 is the very top
---@param colour number | nil The color of this pixel, this will be the current background color if not specified
function paintutils.drawPixel(xPos, yPos, color) end

--- Draws a straight line from the start to end position. Be warned, this may change the position of
--- the cursor and the current background color. You should not expect either to be preserved.
---@param startX number The starting x position of the line
---@param startY number The starting y position of the line
---@param endX number The end x position of the line
---@param endY number The end y position of the line
---@param colour number | nil The color of this line, this will be the current background colour if not specified
function paintutils.drawLine(startX, startY, endX, endY, colour) end

--- Draws the outline of a box on the current terminal from the specified start position to the specified end position.
--- Be warned, this may change the position of the cursor and the current background color. You should not expect
--- either to be preserved.
---@param startX number The starting x position of the bow
---@param startY number The starting y position of the bow
---@param endX number The end x position of the bow
---@param endY number The end y position of the bow
---@param colour number | nil The color of this bow, this will be the current background colour if not specified
function paintutils.drawBox(startX, startY, endX, endY, colour) end

--- Draws a filled box on the current term from the specified start position to the specified end position.
--- Be warned, this may change the position of the cursor and the current background color. You should not
--- expect either to be preserved.
---@param startX number The starting x position of the box
---@param startY number The starting y position of the box
---@param endX number The end x position of the box
---@param endY number The end y position of the box
---@param colour number | nil The color of this box, this will be the current background color if not specified
function paintutils.drawFilledBox(startX, startY, endX, endY, colour) end

--- Draw an image loaded by [paintutils.parseImage] or [paintutils.loadImage].
---@param image table The parsed image data
---@param xPos number The x position to start drawing at
---@param yPos number The y position to start drawing at
function paintutils.drawImage(image, xPos, yPos) end
