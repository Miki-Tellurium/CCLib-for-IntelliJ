---
---@author Miki_Tellurium
---@Copyright (c) 2022 MIT License
---
--- This library requires EmmyLua plugin for IntelliJ IDEA to work properly

--- Read and write configuration options for CraftOS and your programs.
--- By default, the [settings] API will load its configuration from the
--- /.settings file. One can then use [settings.save] to update the file.
---@class settings
settings = {}

--- Define a new setting, optional specifying various properties about it.
--- While settings do not have to be added before being used, doing so allows you to
--- provide defaults and additional metadata.
--- The option table accepts the following fields:
--- * description: A description which may be printed when running the set program;
--- * default: A default value, which is returned by [settings.get] if the setting has not been changed;
--- * type: Require values to be of this type. Setting the value to another type will error.
---@param name string The name of this option
---@param options table | nil A table containing the options
function settings.define(name, options) end

--- Remove a definition of a setting. If a setting has been changed, this does not remove
--- its value. Use [settings.unset] for that.
---@param name string The name of this option
function settings.undefine(name) end

--- Set the value of a setting. Throws if this value cannot be serialised.
---@param name string The name of the setting to set
---@param value any The setting's value, this cannot be nil, and must be serializable by [textutils.serialize]
function settings.set(name, value) end

--- Get the value of a setting.
---@param name string The name of the setting to get
---@param default any | nil The value to use should there be pre-existing value for this setting, if not given it will use the setting's default value if given, or nil otherwise
---@return any The setting's, or the default if the setting has not been changed
function settings.get(name, default) end

--- Get details about a specific setting.
---@param name string The name of the setting to get
---@return table Information about this setting, this includes all information from [settings.define], as well as this setting's values
function settings.getDetails(name) end

--- Remove the value of a setting, setting it to the default. [settings.get] will return the
--- default value until the setting's value is set, or the computer is rebooted.
---@param name string The name of the setting to unset
function settings.unset(name) end

--- Resets the value of all settings. Equivalent to calling [settings.unset]
--- on every setting.
function settings.clear() end

--- Get the names of all currently defined settings.
---@return table An alphabetically sorted list of all currently-defined settings
function settings.getNames() end

--- Load settings from the given file. Existing settings will be merged with any
--- pre-existing ones. Conflicting entries will be overwritten, but any others will
--- be preserved.
---@param sPath string | nil The file to load from, defaulting to /.settings
---@return boolean Whether settings were successfully read from this file; reasons for failure may include the file not existing or being corrupted
function settings.load(sPath) end

--- Save settings to the given file. This will entirely overwrite the pre-existing file.
--- Settings defined in the file, but not currently loaded will be removed.
---@param sPath string | nil The path to save settings to, defaulting to /.settings
---@return boolean If the settings were successfully saved
function settings.save(sPath) end