--[[
    troll.rip 1.0.0
    Type: Washiez (game)

    by: @stav
    Forever always will be free, and undetected.

    Still not out. If you have any concerns, please reach me out on discord.
    Discord: @._stav
]]

-- Interface/Utilities
local ui = loadfile('troll.rip/libraries/ui.lua')()
local utils = loadfile('troll.rip/libraries/utils.lua')()

local runService = cloneref(game:GetService('RunService'))
local connections = {
    Anticheat = ''
}

local main = ui.new()
local tab = main.create_tab('Main')

tab.create_title({
	name = 'AnticheatBypass',
	section = 'left'
})
tab.create_toggle({
	name = 'Enabled',
	flag = 'anticheat',

	section = 'left',
	enabled = false,

	callback = function(state: boolean)
        if state then
            task.spawn(function()
                utils.funcs.disableAC()
            end)

            connections.Anticheat = workspace.DescendantAdded:Connect(function(ac)
                if ac.Name == "AntiExploit" then
                    task.defer(function()
                        utils.funcs.disableAC()
                    end)
                end
            end)       
        else
            if connections.Anticheat ~= '' then
                connections.Anticheat:Disconnect()
                connections.Anticheat = ''
            end
            warn('Anticheat Bypass can not be disabled, however disabling will prevent future attempts of Car AntiExploit bypass.')
        end
    end
})

tab.create_title({
    name = 'StaffDetector',
    section = 'right'
})
tab.create_toggle({
	name = 'Enabled',
	flag = 'staffdetect',

	section = 'right',
	enabled = false,

	callback = function(state: boolean)
        print('idk vro what to do now lolz')
	    print(`{state}`)
	end
})

--[[tab.create_title({
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
})]]