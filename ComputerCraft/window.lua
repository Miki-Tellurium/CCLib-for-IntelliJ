---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- A terminal redirect occupying a smaller area of an existing terminal. This allows
--- for easy definition of spaces within the display that can be written/drawn to, then
--- later redrawn/repositioned/etc as need be. The API itself contains only one function,
--- [window.create], which returns the windows themselves. Windows are considered terminal
--- objects - as such, they have access to nearly all the commands in the [term] API (plus
--- a few extras of their own, listed within said API) and are valid targets to redirect to.
--- Each window has a "parent" terminal object, which can be the computer's own display, a
--- monitor, another window or even other, user-defined terminal objects. Whenever a window
--- is rendered to, the actual screen-writing is performed via that parent (or, if that has
--- one too, then that parent, and so forth). Bear in mind that the cursor of a window's parent
--- will hence be moved around etc when writing a given child window. Windows retain a memory
--- of everything rendered "through" them (hence acting as display buffers), and if the parent's
--- display is wiped, the window's content can be easily redrawn later. A window may also be
--- flagged as invisible, preventing any changes to it from being rendered until it's flagged
--- as visible once more. A parent terminal object may have multiple children assigned to it,
--- and windows may overlap. For example, the [multishell] system functions by assigning each
--- tab a window covering the screen, each using the starting terminal display as its parent,
--- and only one of which is visible at a time.
---@class window
window = {}

--- Returns a terminal object that is a space within the specified parent terminal object. This
--- can then be used (or even redirected to) in the same manner as eg. a wrapped monitor. Refer
--- to the [term] API for a list of functions available to it. [term] itself may not be passed as
--- the parent, though [term.native] is acceptable. Generally, [term.current] or a wrapped monitor
--- will be most suitable, though windows may even have other windows assigned as their parents.
---@param parent term The parent terminal redirect to draw to
---@param nX number The x coordinate this window is drawn at in the parent terminal
---@param nY number The y coordinate this window is drawn at in the parent terminal
---@param nWidth number The width of this window
---@param nHeight number The height of this window
---@param bStartVisible boolean | nil Whether this window is visible by default, defaults to true
---@return Window The constructed window
function window.create(parent, nX, nY, nWidth, nHeight, bStartVisible) end

--- The window object. Refer to the module's documentation for a full description.
---@class Window
local Window = {}

--- Write text at the current cursor position, moving the cursor to the end of the text.
--- Unlike functions like [write] and [print], this does not wrap the text - it simply copies the text to the current terminal line.
---@param sText any The text to write
function Window.write(sText) end

--- Writes text to the terminal with the specific foreground and background characters.
--- As with [write], the text will be written at the current cursor location, with the
--- cursor moving to the end of the text. textColor and backgroundColor must both be
--- strings the same length as text. All characters represent a single hexadecimal digit,
--- which is converted to one of CC's colors. For instance, "a" corresponds to purple.
--- Throws if the three inputs are not the same length.
---@param sText string The text to write
---@param sTextColor string The corresponding text colors
---@param sBackgroundColor string The corresponding background colors
function Window.blit(sText, sTextColor, sBackgroundColor) end

--- Clears the terminal, filling it with the current background colour.
function Window.clear() end

--- Clears the line the cursor is currently on, filling it with the current background colour.
function Window.clearLine() end

--- Get the position of the cursor.
---@return number The x and y position of the cursor
function Window.getCursorPos() end

--- Set the position of the cursor. Terminal writes will begin from this position.
---@param x number The new x position of the cursor
---@param y number The new y position of the cursor
function Window.setCursorPos(x, y) end

--- Sets whether the cursor should be visible (and blinking) at the current cursor position.
---@param blink boolean Whether the cursor should blink
function Window.setCursorBlink(blink) end

--- Checks if the cursor is currently blinking.
---@return boolean If the cursor is blinking
function Window.getCursorBlink() end

--- Determine if this terminal supports color. Terminals which do not support color will still
--- allow writing colored text/backgrounds, but it will be displayed in greyscale.
---@return boolean Whether this terminal supports color
function Window.isColor() end

--- Determine if this terminal supports colour. Terminals which do not support colour will still
--- allow writing coloured text/backgrounds, but it will be displayed in greyscale.
---@return boolean Whether this terminal supports colour
function Window.isColour() end

--- Set the color that new text will be written as.
---@param color number The new text color
function Window.setTextColor(color) end

--- Set the colour that new text will be written as.
---@param colour number The new text colour
function Window.setTextColour(color) end

--- Set the palette for a specific color. ComputerCraft's palette system allows
--- you to change how a specific color should be displayed. For instance, you can
--- make [colors.red] more red by setting its palette to #FF0000. This does now allow
--- you to draw more colors - you are still limited to 16 on the screen at one time
--- but you can change which colors are used.
---@param index number The color whose palette should be changed
---@param color number A 24-bit integer representing the RGB value of the color
---or
---@param r number The intensity of the red channel, between 0 and 1
---@param g number The intensity of the green channel, between 0 and 1
---@param b number The intensity of the blue channel, between 0 and 1
function Window.setPaletteColor(...) end

--- Set the palette for a specific colour. ComputerCraft's palette system allows
--- you to change how a specific colour should be displayed. For instance, you can
--- make [colours.red] more red by setting its palette to #FF0000. This does now allow
--- you to draw more colours - you are still limited to 16 on the screen at one time
--- but you can change which colours are used.
---@param index number The colour whose palette should be changed
---@param colour number A 24-bit integer representing the RGB value of the colour
---or
---@param r number The intensity of the red channel, between 0 and 1
---@param g number The intensity of the green channel, between 0 and 1
---@param b number The intensity of the blue channel, between 0 and 1
function Window.setPaletteColour(...) end

--- Get the current palette for a specific color.
---@param color number The color whose palette should be fetched
---@return number | number | number The red, green and blue channels, will be between 0 and 1
function Window.getPaletteColor(color) end

--- Get the current palette for a specific colour.
---@param colour number The colour whose palette should be fetched
---@return number | number | number The red, green and blue channels, will be between 0 and 1
function Window.getPaletteColour(colour) end

--- Set the current background color. This is used when writing text and clearing the terminal.
---@param color number The new background color
function Window.setBackgroundColor(color) end

--- Set the current background colour. This is used when writing text and clearing the terminal.
---@param colour number The new background colour
function Window.setBackgroundColour(colour) end

--- Get the size of the terminal.
---@return number The terminal's width and height
function Window.getSize() end

--- Move all positions up (or down) by y pixels. Every pixel in the terminal will be
--- replaced by the line y pixels below it. If y is negative, it will copy pixels from above instead.
---@param y number The number of lines to move up by, this may be a negative number
function Window.scroll(y) end

--- Return the color that new text will be written as.
---@return number The current text color
function Window.getTextColor() end

--- Return the colour that new text will be written as.
---@return number The current text colour
function Window.getTextColour() end

--- Return the current background color. This is used when writing text and clearing the terminal.
---@return number The current background color
function Window.getBackgroundColor() end

--- Return the current background colour. This is used when writing text and clearing the terminal.
---@return number The current background colour
function Window.getBackgroundColour() end

--- Get the buffered contents of a line in this window. Throws if y is not between 1 and this window's height.
---@param y number The y position of the line to get
---@return string The textual content of this line, the text colors of this line (suitable for use with [term.blit]) and the background colors of this line (suitable for use with [term.blit])
function Window.getLine(y) end

--- Set whether this window is visible. Invisible windows will not be drawn to the screen until
--- they are made visible again. Making an invisible window visible will immediately draw it.
---@param visible boolean Whether this window is visible
function Window.setVisible(visible) end

--- Get whether this window is visible. Invisible windows will not be drawn to the screen until
--- they are made visible again.
---@return boolean Whether this window is visible
function Window.isVisible() end

--- Draw this window. This does nothing if the window is not visible.
function Window.redraw() end

--- Set the current terminal's cursor to where this window's cursor is. This does nothing if the window is not visible.
function Window.restoreCursor() end

--- Get the position of the top left corner of this window.
---@return number The x and y position of this window
function Window.getPosition() end

--- Reposition or resize the given window. This function also accepts arguments to change
--- the size of this window. It is recommended that you fire a [term_resize] event after
--- changing a window's, to allow programs to adjust their sizing.
---@param new_x number The new x position of this window
---@param new_y number The new y position of this window
---@param new_width number | nil The new width of this window
---@param new_height number The new height of this window
---@param new_parent Redirect | nil  The new redirect object this window should draw to
function Window.reposition(new_x, new_y, new_width, new_height, new_parent) end