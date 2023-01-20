---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Read and draw nft images. nft ("Nitrogen Fingers Text") is a file format
--- for drawing basic images. Unlike the images that [paintutils.parseImage]
--- uses, nft supports coloured text as well as simple coloured pixels.
---@class nft
nft = {}

--- Parse an nft image from a string.
---@param image string The image contents
---@return table The parsed image
function nft.parse(image) end

--- Load an nft image from a file.
---@param path string The file to load
---@return table | string | nil The parsed image or nil if the file does not exist or could not be loaded and an error message explaining why the file could not be loaded
function nft.load(path) end

--- Draw an nft image to the screen.
---@param image table An image, as returned from [nft.load] or [nft.draw]
---@param xPos number The x position to start drawing at
---@param xPos number The y position to start drawing at
---@param target Redirect The terminal redirect to draw to, defaults to the current terminal
function nft.draw(image, xPos, xPos, target) end