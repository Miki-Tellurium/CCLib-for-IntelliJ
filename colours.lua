---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

---@generic An alternative version of colors for lovers of British spelling.

---@class colours
colours = {}

colours.white = {
    Dec = 1,
    Hex = 0x1,
    Blit = 0
}

colours.orange = {
    Dec = 2,
    Hex = 0x2,
    Blit = 1
}

colours.magenta = {
    Dec = 4,
    Hex = 0x4,
    Blit = 2
}

colours.lightBlue = {
    Dec = 8,
    Hex = 0x8,
    Blit = 3
}

colours.yellow = {
    Dec = 16,
    Hex = 0x10,
    Blit = 4
}

colours.lime = {
    Dec = 32,
    Hex = 0x20,
    Blit = 5
}

colours.pink = {
    Dec = 64,
    Hex = 0x40,
    Blit = 6
}

colours.grey = {
    Dec = 128,
    Hex = 0x80,
    Blit = 7
}

colours.lightGrey = {
    Dec = 256,
    Hex = 0x100,
    Blit = 8
}

colours.cyan = {
    Dec = 512,
    Hex = 0x200,
    Blit = 9
}

colours.purple = {
    Dec = 1024,
    Hex = 0x400,
    Blit = a
}

colours.blue = {
    Dec = 2048,
    Hex = 0x800,
    Blit = b
}

colours.brown = {
    Dec = 4096,
    Hex = 0x1000,
    Blit = c
}

colours.green = {
    Dec = 8192,
    Hex = 0x2000,
    Blit = d
}

colours.red = {
    Dec = 16384,
    Hex = 0x4000,
    Blit = e
}

colours.black = {
    Dec = 32768,
    Hex = 0x8000,
    Blit = f
}

--- Combines a set of colors (or sets of colors) into a larger set. Useful for Bundled Cables.
---@param ... number The colors to combine
---@return number The union of the color sets given
function colours.combine(...) end

--- Removes one or more colors (or sets of colors) from an initial set. Useful for Bundled Cables.
--- Each parameter beyond the first may be a single color or may be a set of colors (in the latter
--- case, all colors in the set are removed from the original set).
---@param color number The color from which to subtract
---@param ... number The colors to subtract
---@return number The resulting color
function colours.subtract(color, ...) end

--- Tests whether color is contained within colors. Useful for Bundled Cables.
---@param colors number A color, or color set
---@param color number A color or set of colors that colors should contain
---@return boolean If colors contains all colors within color
function colours.test(colors, color) end

--- Combine a three-colour RGB value into one hexadecimal representation.
---@param r number The red channel, should be between 0 and 1
---@param g number The green channel, should be between 0 and 1
---@param b number The blue channel, should be between 0 and 1
---@return number The combined hexadecimal colour
function colours.packRGB(r, g, b) end

--- Separate a hexadecimal RGB colour into its three constituent channels.
---@param rgb number The combined hexadecimal colour
---@return number, number, number  The red, green and blue channel, each will be between 0 and 1
function colours.unpackRGB(rgb) end

---@deprecated
---Either calls [colors.packRGB] or [colors.unpackRGB], depending on how many arguments it receives.
---@param r number The red channel, as an argument to [colors.packRGB]
---@param g number The green channel, as an argument to [colors.packRGB]
---@param b number The blue channel, as an argument to [colors.packRGB]
---@param rgb number The combined hexadecimal color, as an argument to [colors.unpackRGB]
---@return number | number, number, number The combined hexadecimal colour, as returned by [colors.packRGB] or the red, green and blue channel as returned by [colors.unpackRGB]
function colours.rgb8(...) end

--- Converts the given color to a paint/blit hex character (0-9a-f).
--- This is equivalent to converting floor(log_2(color)) to hexadecimal.
---@param color number The color to convert
---@return string The blit hex code of the color
function colours.toBlit(color) end