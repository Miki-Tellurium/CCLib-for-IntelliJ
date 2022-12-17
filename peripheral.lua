---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

---@generic Find and control peripherals attached to this computer.
--- Peripherals are blocks (or turtle and pocket computer upgrades) which can be controlled by
--- a computer. For instance, the speaker peripheral allows a computer to play music and the
--- monitor peripheral allows you to display text in the world.
--- Computers can interact with adjacent peripherals. Each peripheral is given a name based
--- on which direction it is in. For instance, a disk drive below your computer will be called
--- "bottom" in your Lua code, one to the left called "left" , and so on for all 6 directions
--- ("bottom", "top", "left", "right", "front", "back"). It's also possible to use peripherals
--- which are further away from your computer through the use of Wired Modems. Place one modem
--- against your computer, run Networking Cable to your peripheral, and then place another modem
--- against that block. You can then right click the modem to use (or attach) the peripheral.
--- This will print a peripheral name to chat, which can then be used just like a direction name
--- to access the peripheral. You can click on the message to copy the name to your clipboard.

---@class peripheral
peripheral = {}

--- Provides a list of all peripherals available. If a device is located directly
--- next to the system, then its name will be listed as the side it is attached to.
--- If a device is attached via a Wired Modem, then it'll be reported according to
--- its name on the wired network.
---@return string A list of the names of all attached peripherals
function peripheral.getNames() end

--- Determines if a peripheral is present with the given name.
---@param name string The side or network name that you want to check
---@return boolean If a peripheral is present with the given name
function peripheral.isPresent(name) end

--- Get the types of a named or wrapped peripheral.
---@param peripheral string | table The name of the peripheral to find, or a wrapped peripheral instance
---@return string | nil The peripheral's types, or nil if it is not present
function peripheral.getType(peripheral) end

--- Check if a peripheral is of a particular type.
---@param peripheral string | table The name of the peripheral or a wrapped peripheral instance
---@param peripheral_type string The type to check
---@return boolean | nil If a peripheral has a particular type, or nil if it is not present
function peripheral.hasType(peripheral, peripheral_type) end

--- Get all available methods for the peripheral with the given name.
---@param name string The name of the peripheral to find
---@return string | nil A list of methods provided by this peripheral, or nil if it is not present
function peripheral.getMethods(name) end

--- Get the name of a peripheral wrapped with [peripheral.wrap].
---@param peripheral table The peripheral to get the name of
---@return string The name of the given peripheral
function peripheral.getName(peripheral) end

--- Call a method on the peripheral with the given name.
---@param name string The name of the peripheral to invoke the method on
---@param method string The name of the method
---@param ... any Additional arguments to pass to the method
---@return any The return values of the peripheral method
function peripheral.call(name, method, ...) end

--- Get a table containing all functions available on a peripheral. These can then be called
--- instead of using [peripheral.call] every time.
---@param name string The name of the peripheral to wrap
---@return command_peripheral | computer_peripheral | disk_peripheral | modem_peripheral | monitor_peripheral| printer_peripheral | speaker_peripheral | energy_storage_peripheral | fluid_storage_peripheral | inventory_peripheral | nil The table containing the peripheral's methods, or nil if there is no peripheral present with the given name
function peripheral.wrap(name) end

--- Find all peripherals of a specific type, and return the wrapped peripherals.
---@param type string The type of peripheral to look for
---@param filter function A filter function, which takes the peripheral's name and wrapped table and returns if it should be included in the result
---@return command_peripheral | computer_peripheral | disk_peripheral | modem_peripheral | monitor_peripheral| printer_peripheral |speaker_peripheral | energy_storage_peripheral | fluid_storage_peripheral | inventory_peripheral | nil Zero or more wrapped peripherals matching the given filters
function peripheral.find(type, filter) end


--- This peripheral allows you to interact with command blocks. Command blocks are
--- only wrapped as peripherals if the enable_command_block option is true within the config.
--- This API is not the same as the [commands] API, which is exposed on command computers.
---@class command_peripheral
command = {}

--- Get the command this command block will run.
---@return string The current command
function command.getCommand() end

--- Set the command block's command.
---@param command string The new command
function command.setCommand(command) end

--- Execute the command block once.
---@return boolean | string | nil If the command completed successfully or a failure message
function command.runCommand() end


--- A computer or turtle wrapped as a peripheral. This allows for basic interaction with
--- adjacent computers. Computers wrapped as peripherals will have the type computer while
--- turtles will be turtle.
---@class computer_peripheral
computer = {}

--- Turn the other computer on.
function computer.turnOn() end

--- Shutdown the other computer.
function computer.shutdown() end

--- Reboot or turn on the other computer.
function computer.reboot() end

--- Get the other computer's ID.
---@return number The computer's ID
function computer.getID() end

--- Determine if the other computer is on.
---@return boolean If the computer is on
function computer.isOn() end

--- Get the other computer's label.
---@return string | nil The computer's label
function computer.getLabel() end


--- Disk drives are a peripheral which allow you to read and write to floppy disks and other
--- "mountable media" (such as computers or turtles). They also allow you to play records.
--- When a disk drive attaches some mount (such as a floppy disk or computer), it attaches
--- a folder called disk, disk2, etc... to the root directory of the computer. This folder
--- can be used to interact with the files on that disk. When a disk is inserted, a [disk]
--- event is fired, with the side peripheral is on. Likewise, when the disk is detached,
--- a [disk_eject] event is fired.
---@class disk_peripheral
disk = {}

--- Returns whether a disk is currently inserted in the drive.
---@return boolean Whether a disk is currently inserted in the drive
function disk.isDiskPresent() end

--- Returns the label of the disk in the drive if available.
---@return string | nil The label of the disk, or nil if either no disk is inserted or the disk doesn't have a label
function disk.getDiskLabel() end

--- Sets or clears the label for a disk. If no label or nil is passed, the label will be cleared.
--- Throws if the disk's label can't be changed.
---@param label string | nil The new label of the disk, or nil to clear
function disk.setDiskLabel(label) end

--- Returns whether a disk with data is inserted.
---@return boolean Whether a disk with data is inserted
function disk.hasData() end

--- Returns the mount path for the inserted disk.
---@return string | nil The mount path for the disk, or nil if no data disk is inserted
function disk.getMountPath() end

--- Returns whether a disk with audio is inserted.
---@return boolean Whether a disk with audio is inserted
function disk.hasAudio() end

--- Returns the title of the inserted audio disk.
---@return string | boolean | nil The title of the audio, false if no disk is inserted, or nil if the disk has no audio
function disk.getAudioTitle() end

--- Plays the audio in the inserted disk, if available.
function disk.playAudio() end

--- Stops any audio that may be playing.
function disk.stopAudio() end

--- Ejects any disk that may be in the drive.
function disk.ejectDisk() end

--- Returns the ID of the disk inserted in the drive.
---@return number | nil The ID of the disk in the drive, or nil if no disk with an ID is inserted
function disk.getDiskID() end


--- Modems allow you to send messages between computers over long distances. Modems provide
--- a fairly basic set of methods, which makes them very flexible but often hard to work with.
---The [rednet] API is built on top of modems, and provides a more user-friendly interface.
---@class modem_peripheral
modem = {}

--- Open a channel on a modem. A channel must be open in order to receive messages. Modems
--- can have up to 128 channels open at one time. Throws if the channel is out of range or
--- if there are too many open channels.
---@param channel number The channel to open, this must be a number between 0 and 65535
function modem.open(channel) end

--- Check if a channel is open. Throws if the channel is out of range.
---@param channel number The channel to check
---@return boolean Whether the channel is open
function modem.isOpen(channel) end

--- Close an open channel, meaning it will no longer receive messages. Throws if the channel is out of range.
---@param channel number The channel to close
function modem.close(channel) end

--- Close all open channels.
function modem.closeAll() end

--- Sends a modem message on a certain channel. Modems listening on the channel will queue
--- a [modem_message] event on adjacent computers. The channel does not need be open to send a message.
--- Throws if the channel is out of range.
---@param channel number The channel to send messages on
---@param replyChannel number The channel that responses to this message should be sent on, this can be the same as channel or entirely different, the channel must have been opened on the sending computer in order to receive the replies
---@param payload any The object to send, this can be any primitive type (boolean, number, string) as well as tables; other types (like functions), as well as metatables, will not be transmitted
function modem.transmit(channel, replyChannel, payload) end

--- Determine if this is a wired or wireless modem. Some methods (namely those dealing
--- with wired networks and remote peripherals) are only available on wired modems.
---@return boolean If this is a wireless modem
function modem.isWireless() end

--- List all remote peripherals on the wired network. If this computer is attached to
--- the network, it will not be included in this list. This function only appears on
--- wired modems. Check [modem.isWireless] before calling it.
---@return string Remote peripheral names on the network
function modem.getNamesRemote() end

--- Determine if a peripheral is available on this wired network.
--- This function only appears on wired modems. Check [modem.isWireless] before calling it.
---@param name string The peripheral's name
---@return boolean If a peripheral is present with the given name
function modem.isPresentRemote(name) end

--- Get the type of a peripheral that is available on this wired network.
--- This function only appears on wired modems. Check [modem.isWireless] before calling it.
---@param name string The peripheral's name
---@return string | nil The peripheral's type, or nil if it is not present
function modem.getTypeRemote(name) end

--- Check a peripheral is of a particular type.
--- This function only appears on wired modems. Check [modem.isWireless] before calling it.
---@param name string The peripheral's name
---@param type string The type to check
---@return boolean | nil If a peripheral has a particular type, or nil if it is not present
function modem.hasTypeRemote(name, type) end

--- Get all available methods for the remote peripheral with the given name.
--- This function only appears on wired modems. Check [modem.isWireless] before calling it.
---@param name string The peripheral's name
---@return string | nil A list of methods provided by this peripheral, or nil if it is not present
function modem.getMethodsRemote(name) end

--- Call a method on a peripheral on this wired network.
--- This function only appears on wired modems. Check [modem.isWireless] before calling it.
---@param remoteName string The name of the peripheral to invoke the method on
---@param method string The name of the method
---@param ... any Additional arguments to pass to the method
---@return string The return values of the peripheral method
function modem.callRemote(remoteName, method, ...) end

--- Returns the network name of the current computer, if the modem is on. This may be used
--- by other computers on the network to wrap this computer as a peripheral.
--- This function only appears on wired modems. Check [modem.isWireless] before calling it.
---@return string | nil The current computer's name on the wired network
function modem.getNameLocal() end

--- Monitors are a block which act as a terminal, displaying information on one side. This
--- allows them to be read and interacted with in-world without opening a GUI.
--- Monitors act as terminal redirects and so expose the same methods, as well as
--- several additional ones, which are documented below. Like computers, monitors
--- come in both normal (no color) and advanced (color) varieties.
---@class monitor_peripheral
monitor = {}

---Set the scale of this monitor. A larger scale will result in the monitor having a
---lower resolution, but display text much larger. Throws if the scale is out of range.
---@param scale number The monitor's scale, this must be a multiple of 0.5 between 0.5 and 5
function monitor.setTextScale(scale) end

--- Get the monitor's current text scale. Throws if the monitor cannot be found.
---@return number The monitor's current scale
function monitor.getTextScale() end

--- Write text at the current cursor position, moving the cursor to the end of the text.
--- Unlike functions like write and print, this does not wrap the text - it simply copies the text to the current terminal line.
---@param text any The text to write
function monitor.write(text) end

--- Move all positions up (or down) by y pixels. Every pixel in the terminal will be
--- replaced by the line y pixels below it. If y is negative, it will copy pixels from above instead.
---@param y number The number of lines to move up by, this may be a negative number
function monitor.scroll(y) end

--- Get the position of the cursor.
---@return number The x and y position of the cursor
function monitor.getCursorPos() end

--- Set the position of the cursor. terminal writes will begin from this position.
---@param x number The new x position of the cursor
---@param y number The new y position of the cursor
function monitor.setCursorPos(x, y) end

--- Checks if the cursor is currently blinking.
---@return boolean If the cursor is blinking
function monitor.getCursorBlink() end

--- Sets whether the cursor should be visible (and blinking) at the current cursor position.
---@param blink boolean Whether the cursor should blink
function monitor.setCursorBlink(blink) end

--- Get the size of the terminal.
---@return number The terminal's width and height
function monitor.getSize() end

--- Clears the terminal, filling it with the current background colour.
function monitor.clear() end

--- Clears the line the cursor is currently on, filling it with the current background colour.
function monitor.clearLine() end

--- Return the color that new text will be written as.
---@return number The current text color
function monitor.getTextColor() end

--- Return the colour that new text will be written as.
---@return number The current text colour
function monitor.getTextColour() end

--- Set the color that new text will be written as.
---@param color number The new text color
function monitor.setTextColor(color) end

--- Set the colour that new text will be written as.
---@param colour number The new text colour
function monitor.setTextColour(colour) end

--- Return the current background color. This is used when writing text and clearing the terminal.
---@return number The current background color
function monitor.getBackgroundColor() end

--- Return the current background colour. This is used when writing text and clearing the terminal.
---@return number The current background colour
function monitor.getBackgroundColour() end

--- Set the current background color. This is used when writing text and clearing the terminal.
---@param color number The new background color
function monitor.setBackgroundColor(color) end

--- Set the current background colour. This is used when writing text and clearing the terminal.
---@param color number The new background colour
function monitor.setBackgroundColour(colour) end

--- Determine if this terminal supports color. Terminals which do not support color will still
--- allow writing colored text/backgrounds, but it will be displayed in greyscale.
---@return boolean Whether this terminal supports color
function monitor.isColor() end

--- Determine if this terminal supports colour. Terminals which do not support colour will still
--- allow writing coloured text/backgrounds, but it will be displayed in greyscale.
---@return boolean Whether this terminal supports colour
function monitor.isColour() end

--I'm loving these british duplicate methods

--- Writes text to the terminal with the specific foreground and background characters.
--- As with [write], the text will be written at the current cursor location, with the
--- cursor moving to the end of the text. textColour and backgroundColour must both be
--- strings the same length as text. All characters represent a single hexadecimal digit,
--- which is converted to one of CC's colors. For instance, "a" corresponds to purple.
--- Throws if the three inputs are not the same length.
---@param text string The text to write
---@param textColour string The corresponding text colors
---@param backgroundColour string The corresponding background colors
function monitor.blit(text, textColour, backgroundColour) end

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
function monitor.setPaletteColor(...) end

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
function monitor.setPaletteColour(...) end

--- Get the current palette for a specific color.
---@param color number The color whose palette should be fetched
---@return number | number | number The red, green and blue channels, will be between 0 and 1
function monitor.getPaletteColor(color) end

--- Get the current palette for a specific colour.
---@param colour number The colour whose palette should be fetched
---@return number | number | number The red, green and blue channels, will be between 0 and 1
function monitor.getPaletteColor(colour) end


--- The printer peripheral allows pages and books to be printed.
---@class printer_peripheral
printer = {}

--- Writes text to the current page. Throws if any values couldn't be converted
--- to a string, or if no page is started.
---@param ... any The values to write to the page.
function printer.write(...) end

--- Returns the current position of the cursor on the page. Throws if a page isn't being printed.
---@return number The x and Y position of the cursor
function printer.getCursorPos() end

--- Sets the position of the cursor on the page. Throws if a page isn't being printed.
---@param x number The X coordinate to set the cursor at
---@param y number The Y coordinate to set the cursor at
function printer.setCursorPos(x, y) end

--- Returns the size of the current page. Throws if a page isn't being printed.
---@return number The width and height of the page
function printer.getPageSize() end

--- Starts printing a new page.
---@return boolean Whether a new page could be started
function printer.newPage() end

--- Finalizes printing of the current page and outputs it to the tray. Throws if a page isn't being printed.
---@return boolean Whether the page could be successfully finished
function printer.endPage() end

--- Sets the title of the current page. Throws if a page isn't being printed.
---@param title string | nil The title to set for the page
function printer.setPageTitle(title) end

--- Returns the amount of ink left in the printer.
---@return number The amount of ink available to print with
function printer.getInkLevel() end

--- Returns the amount of paper left in the printer.
---@return number The amount of paper available to print with
function printer.getPaperLevel() end


--- The speaker peripheral allows your computer to play notes and other sounds.
--- The speaker can play three kinds of sound, in increasing orders of complexity:
--- - [speaker.playNote] allows you to play noteblock note;
--- - [speaker.playSound] plays any built-in Minecraft sound, such as block sounds or mob noises;
--- - [speaker.playAudio] can play arbitrary audio.
---@class speaker_peripheral
speaker = {}

--- Plays a noteblock note through the speaker. This takes the name of a note to play, as well
--- as optionally the volume and pitch to play the note at. The pitch argument uses semitones as
--- the unit. This directly maps to the number of clicks on a note block. For reference, 0, 12,
--- and 24 map to F#, and 6 and 18 map to C. A maximum of 8 notes can be played in a single tick.
--- If this limit is hit, this function will return false.
--- The speaker supports all of Minecraft's noteblock instruments. These are:
--- "harp", "basedrum", "snare", "hat", "bass", @code "flute", "bell", "guitar", "chime",
--- "xylophone", "iron_xylophone", "cow_bell", "didgeridoo", "bit", "banjo" and "pling".
--- Throws if the instrument doesn't exist.
---@param instrument string The instrument to use to play this note
---@param volume number | nil The volume to play the note at, from 0.0 to 3.0; defaults to 1.0
---@param pitch number | nil The pitch to play the note at in semitones, from 0 to 24; defaults to 12
---@return boolean Whether the note could be played as the limit was reached
function speaker.playNote(instrument, volume, pitch) end

--- Plays a Minecraft sound through the speaker. This takes the name of a Minecraft sound, such as
--- "minecraft:block.note_block.harp", as well as an optional volume and pitch. Only one sound can
--- be played at once. This function will return false if another sound was started this tick, or
--- if some audio is still playing. Throws if the sound name was invalid.
---@param name string The name of the sound to play
---@param volume number | nil The volume to play the sound at, from 0.0 to 3.0; defaults to 1.0
---@param pitch number | nil The speed to play the sound at, from 0.5 to 2.0; defaults to 1.0
---@return boolean Whether the sound could be played
function speaker.playSound(name, volume, pitch) end

--- Attempt to stream some audio data to the speaker. This accepts a list of audio samples as amplitudes
--- between -128 and 127. These are stored in an internal buffer and played back at 48kHz. If this buffer
--- is full, this function will return false. You should wait for a [speaker_audio_empty] event before trying
--- again. Throws if the audio data is malformed.
---@param audio number A list of amplitudes
---@param volume number | nil The volume to play this audio at, if not given defaults to the previous volume given to [speaker.playAudio]
---@return boolean If there was room to accept this audio data
function speaker.playAudio(audio, volume) end

--- Stop all audio being played by this speaker. This clears any audio that [speaker.playAudio] had queued
--- and stops the latest sound played by [speaker.playSound].
function speaker.stop() end


--- Methods for interacting with blocks using Forge's energy storage system.
--- This works with energy storage blocks, as well as generators and machines which consume energy.
--- 🛈 NOTE
--- Due to limitations with Forge's energy API, it is not possible to measure throughput (i.e. RF used/generated per tick).
---@class energy_storage_peripheral
energy_storage = {}

--- Get the energy of this block.
---@return number The energy stored in this block, in FE
function energy_storage.getEnergy() end

--- Get the maximum amount of energy this block can store.
---@return number The energy capacity of this block
function energy_storage.getEnergyCapacity() end


--- Methods for interacting with tanks and other fluid storage blocks.
---@class fluid_storage_peripheral
fluid_storage = {}

--- Get all "tanks" in this fluid storage. Each tank either contains some amount of
--- fluid or is empty. Tanks with fluids inside will return some basic information
--- about the fluid, including its name and amount. The returned table is sparse,
--- and so empty tanks will be nil - it is recommended to loop over using pairs
--- rather than ipairs.
---@return table | nil All tanks in this fluid storage
function fluid_storage.tanks() end

--- Move a fluid from one fluid container to another connected one. This allows you to
--- push fluid in the current fluid container to another container on the same wired
--- network. Both containers must be attached to wired modems which are connected via a
--- cable. Throws if the peripheral to transfer to doesn't exist or isn't an fluid container.
---@param toName string The name of the peripheral/container to push to, this is the string given to [peripheral.wrap], and displayed by the wired modem
---@param limit number The maximum amount of fluid to move
---@param fluidName string The fluid to move, if not given an arbitrary fluid will be chosen
---@return number The amount of moved fluid
function fluid_storage.pushFluid(toName, limit, fluidName) end

--- Move a fluid from one fluid container to another connected one. This allows you to
--- pull fluid from the current fluid container to another container on the same wired
--- network. Both containers must be attached to wired modems which are connected via a
--- cable. Throws if the peripheral to transfer to doesn't exist or isn't an fluid container.
---@param toName string The name of the peripheral/container to pull from, this is the string given to [peripheral.wrap], and displayed by the wired modem
---@param limit number The maximum amount of fluid to move
---@param fluidName string The fluid to move, if not given an arbitrary fluid will be chosen
---@return number The amount of moved fluid
function fluid_storage.pullFluid(fromName, limit, fluidName) end


---Methods for interacting with inventories.
---@class inventory_peripheral
inventory = {}

--- Get the size of this inventory.
---@return number The number of slots in this inventory
function inventory.size() end

--- List all items in this inventory. This returns a table, with an entry for each slot.
--- Each item in the inventory is represented by a table containing some basic information,
--- much like [turtle.getItemDetail] includes. More information can be fetched with [inventory.getItemDetail].
--- The table contains the item name, the count and an a (potentially nil) hash of the item's
--- nbt. This NBT data doesn't contain anything useful, but allows you to distinguish identical
--- items. The returned table is sparse, and so empty slots will be nil - it is recommended to
--- loop over using pairs rather than ipairs.
---@return table | nil All items in this inventory
function inventory.list() end

--- Get detailed information about an item. The returned information contains the same information as
--- each item in [inventory.list], as well as additional details like the display name (displayName), item groups
--- (itemGroups), which are the creative tabs an item will appear under, and item and item durability
--- (damage, maxDamage, durability). Some items include more information (such as enchantments) - it
--- is recommended to print it out using [textutils.serialize] or in the Lua REPL, to explore what is available.
--- Throws if the slot is out of range.
---@param slot number The slot to get information about
---@return table Information about the item in this slot, or nil if not present
function inventory.getItemDetail(slot) end

--- Get the maximum number of items which can be stored in this slot. Typically this will be limited to 64
--- items. However, some inventories (such as barrels or caches) can store hundreds or thousands of items
--- in one slot. Throws if the slot is out of range.
---@param slot number The slot to get information about
---@return number The maximum number of items in this slot
function inventory.getItemLimit(slot) end

--- Push items from one inventory to another connected one. This allows you to push an item in an inventory
--- to another inventory on the same wired network. Both inventories must attached to wired modems which are
--- connected via a cable. Throws if the peripheral to transfer to doesn't exist or isn't an inventory or if
--- either source or destination slot is out of range.
---@param toName string The name of the peripheral/inventory to push to, this is the string given to [peripheral.wrap] and displayed by the wired modem
---@param fromSlot number The slot in the current inventory to move items to
---@param limit number | nil The maximum number of items to move, defaults to the current stack limit
---@param toSlot number | nil The slot in the target inventory to move to, if not given the item will be inserted into any slot
---@return number The number of transferred items
function inventory.pushItems(toName, fromSlot, limit, toSlot) end

--- Pull items from a connected inventory into this one. This allows you to transfer item between inventories
--- on the same wired network. Both inventories must attached to wired modems which are connected via a cable.
--- Throws if the peripheral to transfer from doesn't exist or isn't an inventory or if either source or
--- destination slot is out of range.
---@param toName string The name of the peripheral/inventory to pull from, this is the string given to [peripheral.wrap] and displayed by the wired modem
---@param fromSlot number The slot in the current inventory to move items from
---@param limit number | nil The maximum number of items to move, defaults to the current stack limit
---@param toSlot number | nil The slot in the target inventory to move to, if not given the item will be inserted into any slot
---@return number The number of transferred items
function inventory.pullItems(fromName, fromSlot, limit , toSlot) end