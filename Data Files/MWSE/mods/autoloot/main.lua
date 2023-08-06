--[[
	TODO:
		Hotkey to Exclude Containers and NPCs by plaey target
		Update MCM settings without restart (timer)
		i18n support
		Logging with severity levels
		Only enchanted items (armor, weapon, cloth)
		Harvesting/Mining containers? visual bug with "graphicHerbalism"
]]--

local config = require("autoloot.config")
-- local config
local loot = include("autoloot.loot")


-- local ghConfig = mwse.loadConfig("graphicHerbalism")
-- if ghConfig and ghConfig.whitelist then
	-- mwse.log("[Autoloot] Graphic Herbalism mod detected")
	-- config.containers.useBlacklist = true;
	-- for key, item in pairs(ghConfig.whitelist) do
		-- mwse.log('[Autoloot] added container to blacklist: "%s" "%s"', key, ghConfig.whitelist[key])
		-- if ghConfig.whitelist[key] == true then
			-- config.containers.blacklist[key] = true;
		-- end
	-- end
-- end

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
	mwse.log('[Autoloot] timer: "%s" "%s"', config.timer, ms)
end

event.register(tes3.event.initialized, function()
	if config.enableMod then
		-- enableMod()
		if config.enableTimer then
			event.register(tes3.event.loaded, startTimer)
			mwse.log("[Autoloot] Timer started")
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