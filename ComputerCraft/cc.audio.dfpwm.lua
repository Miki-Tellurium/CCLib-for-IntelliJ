---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Convert between streams of DFPWM audio data and a list of amplitudes. DFPWM (Dynamic Filter
--- Pulse Width Modulation) is an audio codec designed by GreaseMonkey. It's a relatively
--- compact format compared to raw PCM data, only using 1 bit per sample, but is simple enough
--- to to encode and decode in real time. Typically DFPWM audio is read from the filesystem
--- or a a web request as a string, and converted a format suitable for [speaker.playAudio].
---@class dfpwm
dfpwm = {}

--- Create a new encoder for converting PCM audio data into DFPWM. The returned
--- encoder is itself a function. This function accepts a table of amplitude
--- data between -128 and 127 and returns the encoded DFPWM data.
---@return function The encoder function
function dfpwm.make_encoder() end

--- A convenience function for encoding a complete file of audio at once. This
--- should only be used for complete pieces of audio. If you are writing
--- multiple chunks to the same place, you should use an encoder returned by
--- [make_encoder] instead.
---@param input table The table of amplitude data
---@return string The encoded DFPWM data
function dfpwm.encode(input) end

--- Create a new decoder for converting DFPWM into PCM audio data. The returned
--- decoder is itself a function. This function accepts a string and returns a
--- table of amplitudes, each value between -128 and 127.
---@return function The encoder function
function dfpwm.make_decoder() end

--- A convenience function for decoding a complete file of audio at once. This
--- should only be used for short files.  For larger files, one should read
--- the file in chunks and process it using [make_decoder].
---@param input string The DFPWM data to convert
---@return table The produced amplitude data
function dfpwm.decode(input) end