local config = require("autoloot.config")
local logger = require("logging.logger")
local log = logger.new{
    name = "Autoloot",
    logLevel = config.logLevel or "INFO",
    logToConsole = true,
    includeTimestamp = true,
}
local loot = include("autoloot.loot")

--[[
	TODO:
		register/unregister on mod on/off 
]]--
local function checkIsManualLootActivated(e)
	if config.enableMod == true then
		return
	end
	if e.keyCode ~= config.hotkey.keyCode then
		return
	end
    if config.hotkey.isControlDown and not e.isControlDown then
		return
    end
	if config.hotkey.isShiftDown and not e.isShiftDown then
		return
    end
	if config.hotkey.isAltDown and not e.isAltDown then
		return
    end
	loot.run()
	return false
end

event.register("keyDown", checkIsManualLootActivated)

-- local function onLoaded(e)
	-- mobilePlayer = tes3.getMobilePlayer()
	-- playerRef = tes3.getPlayerRef()
-- end

-- local function enableMod()
	-- event.register(tes3.event.loaded, onLoaded)
-- end

-- local function disableMod()
	-- event.unregister(tes3.event.loaded, onLoaded)
-- end

local function timerCallback()
    loot.run()
end

local function startTimer()
	local ms = config.timer / 1000;
	timer.start({ type = timer.real, iterations = -1, duration = ms, callback = timerCallback })
	log:info(tostring('timer started: "%s" ms "%s" s'):format(config.timer, ms))
end

event.register(tes3.event.initialized, function()
	if config.enableMod then
		-- enableMod()
		if config.enableTimer then
			event.register(tes3.event.loaded, startTimer)
		end
	end
end)


event.register("modConfigReady", function()
    require("autoloot.mcm")
	config = require("autoloot.config")
end)



-- local modConfig = require("Autoloot.mcm")
-- modConfig.config = config
-- local function registerModConfig()
	-- mwse.registerModConfig("Autoloot", modConfig)
-- end
-- event.register("modConfigReady", registerModConfig)




-- local function registerModConfig()
    -- local mcmData = require("Autoloot.mcm")
    -- local modData = mwse.mcm.registerModData(mcmData)
    -- mwse.registerModConfig(mcmData.name, modData)
-- end
-- event.register("modConfigReady", registerModConfig)