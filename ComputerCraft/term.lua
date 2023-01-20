---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Interact with a computer's terminal or monitors, writing text and drawing ASCII graphics.
---@class term
term = {}

--- Get the default palette value for a color. Throws when given an invalid color.
---@param color number The color whose palette should be fetched
---@return number The red, green and blue channel of the color, they will be between 0 and 1
function term.nativePaletteColor(color) end

--- Get the default palette value for a colour. Throws when given an invalid colour.
---@param colour number The colour whose palette should be fetched
---@return number The red, green and blue channel of the colour, they will be between 0 and 1
function term.nativePaletteColour(colour) end

--- Write text at the current cursor position, moving the cursor to the end of the text.
--- Unlike functions like [write] and [print], this does not wrap the text - it simply copies the text to the current terminal line.
---@param text any The text to write
function term.write(text) end

--- Move all positions up (or down) by y pixels. Every pixel in the terminal will be
--- replaced by the line y pixels below it. If y is negative, it will copy pixels from above instead.
---@param y number The number of lines to move up by, this may be a negative number
function term.scroll(y) end

--- Get the position of the cursor.
---@return number The x and y position of the cursor
function term.getCursorPos() end

--- Set the position of the cursor. terminal writes will begin from this position.
---@param x number The new x position of the cursor
---@param y number The new y position of the cursor
function term.setCursorPos(x, y) end

--- Checks if the cursor is currently blinking.
---@return boolean If the cursor is blinking
function term.getCursorBlink() end

--- Sets whether the cursor should be visible (and blinking) at the current cursor position.
---@param blink boolean Whether the cursor should blink
function term.setCursorBlink(blink) end

--- Get the size of the terminal.
---@return number The terminal's width and height
function term.getSize() end

--- Clears the terminal, filling it with the current background colour.
function term.clear() end

--- Clears the line the cursor is currently on, filling it with the current background colour.
function term.clearLine() end

--- Return the color that new text will be written as.
---@return number The current text color
function term.getTextColor() end

--- Return the colour that new text will be written as.
---@return number The current text colour
function term.getTextColour() end

--- Set the color that new text will be written as.
---@param color number The new text color
function term.setTextColor(color) end

--- Set the colour that new text will be written as.
---@param colour number The new text colour
function term.setTextColour(colour) end

--- Return the current background color. This is used when writing text and clearing the terminal.
---@return number The current background color
function term.getBackgroundColor() end

--- Return the current background colour. This is used when writing text and clearing the terminal.
---@return number The current background colour
function term.getBackgroundColour() end

--- Set the current background color. This is used when writing text and clearing the terminal.
---@param color number The new background color
function term.setBackgroundColor(color) end

--- Set the current background colour. This is used when writing text and clearing the terminal.
---@param color number The new background colour
function term.setBackgroundColour(colour) end

--- Determine if this terminal supports color. Terminals which do not support color will still
--- allow writing colored text/backgrounds, but it will be displayed in greyscale.
---@return boolean Whether this terminal supports color
function term.isColor() end

--- Determine if this terminal supports colour. Terminals which do not support colour will still
--- allow writing coloured text/backgrounds, but it will be displayed in greyscale.
---@return boolean Whether this terminal supports colour
function term.isColour() end

--- Writes text to the terminal with the specific foreground and background characters.
--- As with [write], the text will be written at the current cursor location, with the
--- cursor moving to the end of the text. textColor and backgroundColor must both be
--- strings the same length as text. All characters represent a single hexadecimal digit,
--- which is converted to one of CC's colors. For instance, "a" corresponds to purple.
--- Throws if the three inputs are not the same length.
---@param text string The text to write
---@param textColor string The corresponding text colors
---@param backgroundColor string The corresponding background colors
function term.blit(text, textColor, backgroundColor) end

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
function term.setPaletteColor(...) end

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
function term.setPaletteColour(...) end

--- Get the current palette for a specific color.
---@param color number The color whose palette should be fetched
---@return number | number | number The red, green and blue channels, will be between 0 and 1
function term.getPaletteColor(color) end

--- Get the current palette for a specific colour.
---@param colour number The colour whose palette should be fetched
---@return number | number | number The red, green and blue channels, will be between 0 and 1
function term.getPaletteColour(colour) end

--- Redirects terminal output to a monitor, a window, or any other custom terminal object.
--- Once the redirect is performed, any calls to a [term] function - or to a function that
--- makes use of a [term] function, as [print] - will instead operate with the new terminal object.
--- A "terminal object" is simply a table that contains functions with the same names - and
--- general features - as those found in the [term] table. For example, a wrapped monitor is
--- suitable. The redirect can be undone by pointing back to the previous terminal object
--- (which this function returns whenever you switch).
---@param target Redirect The terminal redirect the term API will draw to
---@return Redirect The previous redirect object, as returned by [term.current]
function term.redirect(target) end

--- Returns the current terminal object of the computer.
---@return table The current terminal redirect
function term.current() end

--- Get the native terminal object of the current computer. It is recommended you do not
--- use this function unless you absolutely have to. In a multitasked environment,
--- [term.native] will not be the current terminal object, and so drawing may interfere
--- with other programs.
---@return table The native terminal redirect
function term.native() end


--- A base class for all objects which interact with a terminal. Namely the terminals and monitors.
---@class Redirect
local Redirect = {}

--- Write text at the current cursor position, moving the cursor to the end of the text.
--- Unlike functions like [write] and [print], this does not wrap the text - it simply copies the text to the current terminal line.
---@param text any The text to write
function Redirect.write(text) end

--- Move all positions up (or down) by y pixels. Every pixel in the terminal will be
--- replaced by the line y pixels below it. If y is negative, it will copy pixels from above instead.
---@param y number The number of lines to move up by, this may be a negative number
function Redirect.scroll(y) end

--- Get the position of the cursor.
---@return number The x and y position of the cursor
function Redirect.getCursorPos() end

--- Set the position of the cursor. Terminal writes will begin from this position.
---@param x number The new x position of the cursor
---@param y number The new y position of the cursor
function Redirect.setCursorPos(x, y) end

--- Checks if the cursor is currently blinking.
---@return boolean If the cursor is blinking
function Redirect.getCursorBlink() end

--- Sets whether the cursor should be visible (and blinking) at the current cursor position.
---@param blink boolean Whether the cursor should blink
function Redirect.setCursorBlink(blink) end

--- Get the size of the terminal.
---@return number The terminal's width and height
function Redirect.getSize() end

--- Clears the terminal, filling it with the current background colour.
function Redirect.clear() end

--- Clears the line the cursor is currently on, filling it with the current background colour.
function Redirect.clearLine() end

--- Return the color that new text will be written as.
---@return number The current text color
function Redirect.getTextColor() end

--- Return the colour that new text will be written as.
---@return number The current text colour
function Redirect.getTextColour() end

--- Set the color that new text will be written as.
---@param color number The new text color
function Redirect.setTextColor(color) end

--- Set the colour that new text will be written as.
---@param colour number The new text colour
function Redirect.setTextColour(colour) end

--- Return the current background color. This is used when writing text and clearing the terminal.
---@return number The current background color
function Redirect.getBackgroundColor() end

--- Return the current background colour. This is used when writing text and clearing the terminal.
---@return number The current background colour
function Redirect.getBackgroundColour() end

--- Set the current background color. This is used when writing text and clearing the terminal.
---@param color number The new background color
function Redirect.setBackgroundColor(color) end

--- Set the current background colour. This is used when writing text and clearing the terminal.
---@param colour number The new background colour
function Redirect.setBackgroundColour(colour) end

--- Determine if this terminal supports color. Terminals which do not support color will still
--- allow writing colored text/backgrounds, but it will be displayed in greyscale.
---@return boolean Whether this terminal supports color
function Redirect.isColor() end

--- Determine if this terminal supports colour. Terminals which do not support colour will still
--- allow writing coloured text/backgrounds, but it will be displayed in greyscale.
---@return boolean Whether this terminal supports colour
function Redirect.isColour() end

--- Writes text to the terminal with the specific foreground and background characters.
--- As with [write], the text will be written at the current cursor location, with the
--- cursor moving to the end of the text. textColor and backgroundColor must both be
--- strings the same length as text. All characters represent a single hexadecimal digit,
--- which is converted to one of CC's colors. For instance, "a" corresponds to purple.
--- Throws if the three inputs are not the same length.
---@param text string The text to write
---@param textColor string The corresponding text colors
---@param backgroundColor string The corresponding background colors
function Redirect.blit(text, textColor, backgroundColor) end

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
function Redirect.setPaletteColor(...) end

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
function Redirect.setPaletteColour(...) end

--- Get the current palette for a specific color.
---@param color number The color whose palette should be fetched
---@return number | number | number The red, green and blue channels, will be between 0 and 1
function Redirect.getPaletteColor(color) end

--- Get the current palette for a specific colour.
---@param colour number The colour whose palette should be fetched
---@return number | number | number The red, green and blue channels, will be between 0 and 1
function Redirect.getPaletteColour(colour) end