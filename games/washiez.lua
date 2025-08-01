--[[
    troll.rip 1.0.0
    Type: Washiez (game)

    by: @stav
    Forever always will be free, and undetected.

    Still not out. If you have any concerns, please reach me out on discord.
    Discord: @._stav
]]

-- Interface/Utilities
local ui = isfile('troll.rip/libraries/ui.lua') == true and loadfile('troll.rip/libraries/ui.lua')()
local utils = isfile('troll.rip/libraries/ui.lua') == true and loadfile('troll.rip/libraries/utils.lua')()

local main = ui.new()
local tab = main.create_tab('Main')

tab.create_title({
	name = 'AutoParry',
	section = 'left'
})
tab.create_toggle({
	name = 'Enabled',
	flag = 'autoparry',

	section = 'left',
	enabled = false,

	callback = function(state: boolean)
		print(`{state}`)
	end
})
tab.create_dropdown({
	name = 'Direction',
	flag = 'Direction',
	section = 'left',

	option = 'Custom',
	options = {'Custom', 'High', 'Random'},

	callback = function(value: string)
		print(value)
	end
})
tab.create_title({
	name = 'Visualizer',
	section = 'right'
})
tab.create_toggle({
	name = 'Enabled',
	flag = 'visualise',

	section = 'right',
	enabled = false,

	callback = function(state: boolean)
	print(`{state}`)
	end
})
tab.create_title({
	name = 'HitSound',
	section = 'left'
})
tab.create_toggle({
	name = 'Enabled',
	flag = 'hitsound',

	section = 'left',
	enabled = false,

	callback = function(state: boolean)
		print(`{state}`)
	end
})
tab.create_dropdown({
	name = 'Sound',
	flag = 'soundpick',
	section = 'left',

	option = 'Neverlose',
	options = {'Click', 'Neverlose', 'Bonk'},

	callback = function(value: string)
		print(value)
	end
})
tab.create_title({
	name = 'AI',
	section = 'right'
})
tab.create_toggle({
	name = 'Enabled',
	flag = 'AI',

	section = 'right',
	enabled = false,

	callback = function(state: boolean)
    print(`{state}`)
	end
})
tab.create_title({
	name = 'Spin',
	section = 'right'
})
tab.create_toggle({
	name = 'Enabled',
	flag = 'spin',

	section = 'right',
	enabled = false,

	callback = function(state: boolean)
		print(`{state}`)
	end
})
tab.create_slider({
	name = 'Speed',
	flag = 'spinspeed',

	section = 'right',

	value = 25,
	minimum_value = 0,
	maximum_value = 100,

	callback = function(value: number)
		print(value)
	end
})
tab.create_title({
	name = 'Auto Open Crate',
	section = 'left'
})
tab.create_toggle({
	name = 'Enabled',
	flag = 'swordbox',

	section = 'left',
	enabled = false,

	callback = function(state: boolean)
		print(`{state}`)
	end
})
tab.create_dropdown({
	name = 'Crate',
	flag = 'selectbox',
	section = 'left',

	option = 'Sword Crate',
	options = {'Explosion Crate', 'Sword Crate'},

	callback = function(value: string)
		print(value)
	end
})
tab.create_title({
	name = 'Auto Rewards',
	section = 'right'
})
tab.create_toggle({
	name = 'Enabled',
	flag = 'rewarde',

	section = 'right',
	enabled = false,

	callback = function(state: boolean)
		print(`{state}`)
	end
})
tab.create_dropdown({
	name = 'Rewards',
	flag = 'selectrewards',
	section = 'right',

	option = 'Playtime Rewards',
	options = {'Playtime Rewards', 'Clan Rewards', 'Login Rewards', 'All'},

	callback = function(value: string)
	    print(value)
	end
})