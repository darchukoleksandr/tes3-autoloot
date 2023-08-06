# tes3-autoloot
MWSE Autoloot plugin for TES 3 Morrowind

## How does it work?
When activated the current cell is scanned for nearby containers and dead bodies. Every container and item is checked by distance, weight, value and ownership (configurable) and items that mets the conditions are transfered to player inventory.  
By default everything is disabled and should be configured by your preferences.

## Features:
- Loot containers and dead bodies
- Configurable distance between player and target
- Exclude Locations and Containers (Whitelist/Blacklist): Designate areas, containers or npcs not to loot, such as your player home
- Stealing mechanic: doesn't loot things that would cause a crime OR steal thile sneaking and hidden OR steal whatsoever and 
- Weight to Value Ratio: Selects items to loot based on relative value. This means you get the good stuff and leave the junk behind
- Loot by Type: each category have "Whitelist/Blacklist" and "Weight to Value Ratio"
- Weight Limit: Can stop looting when you near maximum encumberance


## Modes:
- Timer: configurable autoloot with timer (by default every second)
- Manual: looting with a configurable hotkey

## Categories:
- Armor
- Clothing
- Weapon
- Ammunition
- Alchemy
- Book
- Ingredient
- Misc

## TODO:
- Hotkey to Exclude Containers and NPCs by player target
- Update MCM settings without restart (timer)
- i18n support
- Logging with severity levels
- Only enchanted items (armor, weapon, cloth)
- Harvesting/Mining containers? visual bug with "graphicHerbalism"

## Compatibility:
- Graphic Herbalism. There's a visual inconvenience when after herb container is autolooted it doesn't changes its visual state to harvested. Repeated manual harvest doesn't yields any resources but chages visual state to harvested but only until reload/cell reenter. 

## Known issues:
- Sometimes containers are visually disapearing after looting but they still exists and will reaper on game restart

