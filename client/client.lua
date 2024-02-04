local VORPcore = exports.vorp_core:GetCore()
local BccUtils = exports['bcc-utils'].initiate()
local FeatherMenu =  exports['feather-menu'].initiate()
local MiniGame = exports['bcc-minigames'].initiate()

local getbounty = 0
local MissionActive = false
local dist = nil
local CreatedOutlaws = {}



local HeistActive = false
local spawnedtresor = false
local CreatedCops = {}

local deg1 = 0
local deg2 = 0
local deg3 = 0


local playerjob = nil
local getsheriffbounty = 0
local PoliceHeistBlipCreated = false
---------------------------------------------------------------------------------
------------------------------Get Playerjob--------------------------------------
---------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while playerjob == nil do
        Citizen.Wait(1000)
        TriggerServerEvent('mms-bounty:server:getplayerjob')
    end
end)

RegisterNetEvent('mms-bounty:client:getplayerjob')
AddEventHandler('mms-bounty:client:getplayerjob',function(job)
    playerjob = job
    if playerjob == nil then
        Citizen.Wait(500)
    else
        TriggerEvent('mms-bounty:client:registermenu')
    end
end)
---------------------------------------------------------------------------------
----------------------------Minigame Settings------------------------------------
---------------------------------------------------------------------------------
local lockpicksettings = {
    focus = true, -- Should minigame take nui focus
    cursor = true, -- Should minigame have cursor  (required for lockpick)
    maxattempts = 3, -- How many fail attempts are allowed before game over
    threshold = 10, -- +- threshold to the stage degree (bigger number means easier)
    hintdelay = 500, --milliseconds delay on when the circle will shake to show lockpick is in the right position.
    stages = {
        {
            deg = deg1 -- 0-360 degrees
        },
        {
            deg = deg2 -- 0-360 degrees
        },
        {
            deg = deg3 -- 0-360 degrees
        }
    }
    
}


---------------------------------------------------------------------------------

Citizen.CreateThread(function()
local BountyBoardPrompt = BccUtils.Prompts:SetupPromptGroup()
    local traderprompt = BountyBoardPrompt:RegisterPrompt(_U('PromptName'), 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = 'MEDIUM_TIMED_EVENT'})
    if Config.BoardBlips then
        for h,v in pairs(Config.BountyBoards) do
        local blip = BccUtils.Blips:SetBlip(_U('BoardblipName'), 'blip_ambient_bounty_hunter', 0.2, v.coords.x,v.coords.y,v.coords.z)
        end
    end
    
    while true do
        Wait(1)
        for h,v in pairs(Config.BountyBoards) do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local dist = #(playerCoords - v.coords)
        if dist < 2 then
            BountyBoardPrompt:ShowGroup(_U('PromptName'))

            if traderprompt:HasCompleted() then
                TriggerEvent('mms-bounty:client:openboard') break
            end
        end
    end
    end
end)

RegisterNetEvent('mms-bounty:client:openboard')
AddEventHandler('mms-bounty:client:openboard',function()
    BountyBoard:Open({
        startupPage = BountyBoardPage1,
    })
end)


---------------------------------------------------------------------------------------------------------
--------------------------------------- SEITE 1 Hauptmenü------------------------------------------------
---------------------------------------------------------------------------------------------------------

RegisterNetEvent('mms-bounty:client:registermenu')
AddEventHandler('mms-bounty:client:registermenu',function()
    BountyBoard = FeatherMenu:RegisterMenu('feather:character:bountyboardmenu', {
        top = '50%',
        left = '50%',
        ['720width'] = '500px',
        ['1080width'] = '700px',
        ['2kwidth'] = '700px',
        ['4kwidth'] = '8000px',
        style = {
            ['border'] = '5px solid orange',
            -- ['background-image'] = 'none',
            ['background-color'] = '#FF8C00'
        },
        contentslot = {
            style = {
                ['height'] = '550px',
                ['min-height'] = '250px'
            }
        },
        draggable = true,
    })
    BountyBoardPage1 = BountyBoard:RegisterPage('seite1')
    BountyBoardPage1:RegisterElement('header', {
        value = _U('BoardHeader'),
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    BountyBoardPage1:RegisterElement('line', {
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    BountyBoardPage1:RegisterElement('button', {
        label = _U('GetBountyList'),
        style = {
            ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        if getbounty == 0 then
            TriggerEvent('mms-bounty:client:getbountyfromdb')
            Citizen.Wait(250)
        elseif getbounty == 1 then
            BountyBoardPage2:UnRegister()
            TriggerEvent('mms-bounty:client:getbountyfromdb')
        
        end
    end)
    if Config.HeistMissionsActive == true then
    BountyBoardPage1:RegisterElement('button', {
        label =  _U('StartHeist'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        TriggerEvent('mms-bounty:client:startheist')
        BountyBoard:Close({ 
        })
    end)
    end
    BountyBoardPage1:RegisterElement('button', {
        label = _U('GetSheriffBountyList'),
        style = {
            ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        if getsheriffbounty == 0 then
            TriggerEvent('mms-bounty:client:getsheriffbountyfromdb')
            Citizen.Wait(250)
        elseif getsheriffbounty == 1 then
            BountyBoardPage4:UnRegister()
            TriggerEvent('mms-bounty:client:getsheriffbountyfromdb')
        end
    end)
    for y, e in pairs(Config.Jobs) do
        if playerjob == e.JobName then
            BountyBoardPage1:RegisterElement('button', {
                label =  _U('SheriffAddMission'),
                style = {
                ['background-color'] = '#FF8C00',
                ['color'] = 'orange',
                ['border-radius'] = '6px'
                },
            }, function()
                BountyBoardPage3:RouteTo()
            end)
        end
    end
    BountyBoardPage1:RegisterElement('button', {
        label =  _U('LabelAbort'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        TriggerEvent('mms-bounty:client:abortbounty')
    end)
    if Config.HeistMissionsActive == true then
    BountyBoardPage1:RegisterElement('button', {
        label =  _U('LabelAbortHeist'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        TriggerEvent('mms-bounty:client:abortheist')
    end)
    end
    BountyBoardPage1:RegisterElement('button', {
        label =  _U('CloseBoard'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        BountyBoard:Close({ 
        })
    end)
    BountyBoardPage1:RegisterElement('subheader', {
        value = _U('BoardHeader'),
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    BountyBoardPage1:RegisterElement('line', {
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })

    ----------------------- Seite 3 Sheriff Add Bounty to DB ----
    BountyBoardPage3 = BountyBoard:RegisterPage('seite3')
    BountyBoardPage3:RegisterElement('header', {
        value = _U('BoardHeader'),
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    BountyBoardPage3:RegisterElement('line', {
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    local inputFirstname = ''
    BountyBoardPage3:RegisterElement('input', {
    label = _U('Firstname'),
    placeholder = "",
    persist = false,
    style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px',
    }
    }, function(data)
        inputFirstname = data.value
    end)
    local inputLastname = ''
    BountyBoardPage3:RegisterElement('input', {
    label = _U('LastName'),
    placeholder = "",
    persist = false,
    style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
    }
    }, function(data)
        inputLastname = data.value
    end)
    local inputReason = ''
    BountyBoardPage3:RegisterElement('input', {
    label = _U('Reason'),
    placeholder = "",
    persist = false,
    style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
    }
    }, function(data)
        inputReason = data.value
    end)
    local inputReward = ''
    BountyBoardPage3:RegisterElement('input', {
    label = _U('Reward'),
    placeholder = "$",
    persist = false,
    style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
    }
    }, function(data)
        inputReward = data.value
    end)
    BountyBoardPage3:RegisterElement('button', {
        label = _U('AddBounty'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px',
        },
    }, function()
        TriggerEvent('mms-bounty:client:addbounty',inputFirstname,inputLastname,inputReason,inputReward)
        BountyBoardPage1:RouteTo()
    end)
    BountyBoardPage3:RegisterElement('button', {
        label =  _U('BackBounty'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px',
        },
    }, function()
        BountyBoardPage1:RouteTo()
    end)
    BountyBoardPage3:RegisterElement('button', {
        label =  _U('CloseBoard'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px',
        },
    }, function()
        BountyBoard:Close({ 
        })
    end)
    BountyBoardPage3:RegisterElement('subheader', {
        value = _U('BoardHeader'),
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    BountyBoardPage3:RegisterElement('line', {
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })

end)

RegisterNetEvent('mms-bounty:client:addbounty')
AddEventHandler('mms-bounty:client:addbounty',function(inputFirstname,inputLastname,inputReason,inputReward)
    TriggerServerEvent('mms-bounty:server:addsheriffbounty',inputFirstname,inputLastname,inputReason,inputReward)
end)

RegisterNetEvent('mms-bounty:client:getbountyfromdb')
AddEventHandler('mms-bounty:client:getbountyfromdb',function()
    getbounty = 1
    TriggerServerEvent('mms-bounty:server:getbountyfromdb')
end)

RegisterNetEvent('mms-bounty:client:getsheriffbountyfromdb')
AddEventHandler('mms-bounty:client:getsheriffbountyfromdb',function()
    getsheriffbounty = 1
    TriggerServerEvent('mms-bounty:server:getsheriffbountyfromdb')
end)

RegisterNetEvent('mms-bounty:client:nobounty')
AddEventHandler('mms-bounty:client:nobounty',function()
    getbounty = 0
    getsheriffbounty = 0
    --TriggerServerEvent('mms-bounty:server:getbountyfromdb')
end)


RegisterNetEvent('mms-bounty:client:bountylist')
AddEventHandler('mms-bounty:client:bountylist',function(eintraege)
    
    BountyBoardPage2 = BountyBoard:RegisterPage('seite2')
    BountyBoardPage2:RegisterElement('header', {
        value = _U('BoardHeader'),
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    BountyBoardPage2:RegisterElement('line', {
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    for v, bounty in ipairs(eintraege) do
        local buttonLabel = _U('Kill') .. bounty.name .. _U('LabelDiff') .. bounty.difficulty .. _U('LabelReward') .. bounty.reward .. '$'
        local difficulty = bounty.difficulty
        local name = bounty.name
        local reward = bounty.reward
        local id = bounty.id
        BountyBoardPage2:RegisterElement('button', {
            label = buttonLabel,
            style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
            }
        }, function()
            TriggerEvent('mms-bounty:client:startbounty',id,difficulty,name,reward)
        end)
    end
    BountyBoardPage2:RegisterElement('button', {
        label =  _U('BackBounty'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        BountyBoardPage1:RouteTo()
    end)
    BountyBoardPage2:RegisterElement('button', {
        label =  _U('CloseBoard'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        BountyBoard:Close({ 
        })
    end)
    BountyBoardPage2:RegisterElement('subheader', {
        value = _U('BoardHeader'),
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    BountyBoardPage2:RegisterElement('line', {
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })

    BountyBoardPage2:RouteTo()
end)

RegisterNetEvent('mms-bounty:client:sheriffbountylist')
AddEventHandler('mms-bounty:client:sheriffbountylist',function(sheriffeintraege)
    
    BountyBoardPage4 = BountyBoard:RegisterPage('seite4')
    BountyBoardPage4:RegisterElement('header', {
        value = _U('BoardHeader'),
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    BountyBoardPage4:RegisterElement('line', {
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    for v, sheriff in ipairs(sheriffeintraege) do
        local firstname = sheriff.firstname
        local lastname = sheriff.lastname
        local reason = sheriff.reason
        local reward = sheriff.reward
        local id = sheriff.id
        local buttonLabel = _U('Firstname') ..' '.. firstname ..' '.. _U('Lastname') ..' '.. lastname ..' '.. _U('Reason') ..' '.. reason ..' '.. _U('Reward') ..' '.. reward .. '$'
        BountyBoardPage4:RegisterElement('button', {
            label = buttonLabel,
            style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
            }
        }, function()
            for y, e in pairs(Config.Jobs) do
                if playerjob == e.JobName then
            local alert = lib.alertDialog({
                header = _U('SheriffBountyDelete'),
                content = _U('SheriffBountyDeleteReally'),
                centered = true,
                cancel = true,
                labels = {cancel = _U('No'),confirm = _U('Yes')}
            })
            if alert == 'confirm' then
                TriggerServerEvent('mms-bounty:server:deletesheriffbountyfromdb',id)
                BountyBoardPage1:RouteTo()
            elseif alert == 'cancel' then
                BountyBoardPage1:RouteTo()
            end
        end
            end
        end)
    end
    BountyBoardPage4:RegisterElement('button', {
        label =  _U('BackBounty'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        BountyBoardPage1:RouteTo()
    end)
    BountyBoardPage4:RegisterElement('button', {
        label =  _U('CloseBoard'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        BountyBoard:Close({ 
        })
    end)
    BountyBoardPage4:RegisterElement('subheader', {
        value = _U('BoardHeader'),
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    BountyBoardPage4:RegisterElement('line', {
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })

    BountyBoardPage4:RouteTo()
end)

RegisterNetEvent('mms-bounty:client:abortbounty')
AddEventHandler('mms-bounty:client:abortbounty',function()
    BountyBoard:Close({})
    if MissionActive == true then
    Reset()
    TriggerServerEvent('mms-bounty:server:addbountyonabort')
    VORPcore.NotifyTip(_U('ActiveMissionAborted'), 5000)
    else
        VORPcore.NotifyTip(_U('NoActiveBounty'), 5000)
    end
end)


RegisterNetEvent('mms-bounty:client:startbounty')
AddEventHandler('mms-bounty:client:startbounty',function(id,difficulty,name,reward)
    BountyBoard:Close({})
    if MissionActive == false then
        TriggerServerEvent('mms-bounty:server:deletebounty',id)
        VORPcore.NotifyTip(_U('MissionStartet'), 5000)
        MissionActive = true
        if difficulty == _U('Easy') then
            local randomeasy = math.random(1,#Config.EasyMissions)
            local selected = Config.EasyMissions[randomeasy]
            CheckDistance(selected,reward)
        elseif difficulty == _U('Middle') then
            local randommiddle = math.random(1,#Config.MiddleMissions)
            local selected = Config.MiddleMissions[randommiddle]
            CheckDistance(selected,reward)
        elseif difficulty == _U('Hard') then
            local randomhard = math.random(1,#Config.HardMissions)
            local selected = Config.HardMissions[randomhard]
            CheckDistance(selected,reward)
        end
    

    else
        VORPcore.NotifyTip(_U('AlreadyHasMission'), 5000)
    end
end)


function CheckDistance(selected,reward)--blip:Remove()
    AreaBlip = BccUtils.Blips:SetBlip(_U('MissionBlip'), 'blip_ambient_hunter', 0.2, selected[1].x,selected[1].y,selected[1].z)
    local notnear = true
    while notnear == true and MissionActive == true do
        Citizen.Wait(250)
    local playerCoords = GetEntityCoords(PlayerPedId())
        dist = #(playerCoords - selected[1])
    if dist < Config.DistanceSpawnEnemys then
        notnear = false
        SpawnEnemys(selected,reward)
    end

end
end

function SpawnEnemys(selected,reward)
    local modelHash = GetHashKey(Config.Model)
	while not HasModelLoaded(modelHash) do
		RequestModel(modelHash)
		Citizen.Wait(0)
	end
    for key, v in pairs(selected) do
        
        local PlayerPedAttack = PlayerPedId()
	    local bountyped = CreatePed(modelHash, v.x,v.y,v.z, true, true, false, false)
        Citizen.Wait(200)
	if DoesEntityExist(bountyped) then
		SetPedRelationshipGroupHash(bountyped, `bandits`)
		SetRelationshipBetweenGroups(5, `PLAYER`, `bandits`)
		SetRelationshipBetweenGroups(5, `bandits`, `PLAYER`)
		Citizen.InvokeNative(0x283978A15512B2FE, bountyped, true)
		Citizen.InvokeNative(0x23f74c2fda6e7c61,953018525, bountyped)
		TaskCombatPed(bountyped, PlayerPedAttack)
        Citizen.Wait(50)
    
        Citizen.InvokeNative(0x740CB4F3F602C9F4, bountyped, true)
        SetEntityAsMissionEntity(bountyped, true, true)
		CreatedOutlaws[#CreatedOutlaws + 1] = bountyped
		if Config.RandomGuns == true then
            local rw = math.random(1,#Config.RandomGun)
            local getrandomgun = Config.RandomGun[rw]
            local randomgun = getrandomgun.weapon
            Citizen.InvokeNative(0x5E3BDDBCB83F3D84,bountyped,GetHashKey(randomgun),100,true,false,10,false,0.5,1.0,'none',true,0,0)
            Citizen.InvokeNative(0x9F7794730795E019,bountyped,54,true)
        else
            Citizen.InvokeNative(0x5E3BDDBCB83F3D84,bountyped,GetHashKey(Config.Gun),100,true,false,10,false,0.5,1.0,'none',true,0,0)
            Citizen.InvokeNative(0x9F7794730795E019,bountyped,54,true)
            
        end
	end
    end
    SetModelAsNoLongerNeeded(modelHash)
    CheckifDead(reward)
end


function CheckifDead(reward)
    
    local chekifdead = 1
    local player = PlayerPedId()
    while chekifdead == 1 do
        Citizen.Wait(250)
        local numberOfAlivePeds = GetNumberOfAlive()
        local numberofDeadPeds = GetNumberOfDead()
        
        VORPcore.NotifyTip(_U('EnemyRemain') .. numberOfAlivePeds, 5000)
        if IsEntityDead(player) then
            VORPcore.NotifyTip(_U('MissionFailed'), 5000)
            chekifdead = 0
            Reset()
        elseif numberOfAlivePeds == 0 then
            VORPcore.NotifyTip(_U('MissionSuccess'), 5000)
            VORPcore.NotifyTip(_U('KilledEnemys') .. numberofDeadPeds , 5000)
            chekifdead = 0
            Reset()
            TriggerServerEvent('mms-bounty:server:reward',reward)
        end
	end

end

function GetNumberOfAlive()
    local numberOfAlivePeds = 0
    for _, peds in ipairs(CreatedOutlaws) do
		if DoesEntityExist(peds) then
			if not IsEntityDead(peds) then
				numberOfAlivePeds = numberOfAlivePeds + 1
			end
		end
    end
    return numberOfAlivePeds
end

function GetNumberOfDead()
    local numberofDeadPeds = 0
    for _, peds in ipairs(CreatedOutlaws) do
		if DoesEntityExist(peds) then
			if IsEntityDead(peds) then
				numberofDeadPeds = numberofDeadPeds + 1
			end
		end
    end
    return numberofDeadPeds
end

function Reset()

	for _, peds in ipairs(CreatedOutlaws) do
		if  DoesEntityExist(peds) then
			DeletePed(peds)
			DeleteEntity(peds)
			SetEntityAsMissionEntity(ped, false, false)
			SetEntityAsNoLongerNeeded(ped)
            Citizen.Wait(250)
		end
	end
    AreaBlip:Remove()
	CreatedOutlaws = {}
    MissionActive = false
end

---------------------------------------------------------------------------------
----------------------------------HEIST PART-------------------------------------
---------------------------------------------------------------------------------

RegisterNetEvent('mms-bounty:client:abortheist')
AddEventHandler('mms-bounty:client:abortheist',function()
    BountyBoard:Close({})
    if HeistActive == true then
        ResetHeist()
        VORPcore.NotifyTip(_U('ActiveHeistAborted'), 5000)
    else
        VORPcore.NotifyTip(_U('NoActiveHeist'), 5000)
    end
end)

RegisterNetEvent('mms-bounty:client:startheist')
AddEventHandler('mms-bounty:client:startheist',function()
    if HeistActive == false then
        VORPcore.NotifyTip(_U('HeistStartetSuccessfully'), 5000)
        HeistActive = true
        local randomheist = math.random(1,#Config.HeistMissions)
            local selected = Config.HeistMissions[randomheist]
            CheckDistanceToHeist(selected)
            
    else
        VORPcore.NotifyTip(_U('AlreadyHeistActive'), 5000)
    end
end)

function CheckDistanceToHeist(selected)
    local Tresor = selected.Tresor
    local Cops = selected.Cops
    local TresorHeading = selected.TresorHeading
    HeistBlip = BccUtils.Blips:SetBlip(_U('HeistBlip'), 'blip_mp_job_exclusive_large', 0.2, Tresor.x,Tresor.y,Tresor.z)
    local notnear = true
    while notnear == true and HeistActive == true do
        Citizen.Wait(250)
    local playerCoords = GetEntityCoords(PlayerPedId())
        dist = #(playerCoords - Tresor)
    if dist < 30 then
        notnear = false
        if Config.HeistAlerts == true then
        TriggerServerEvent('mms-bounty:server:alertpolice',Tresor)
        end
        TriggerEvent('mms-bounty:client:heisttresor',Tresor,Cops,TresorHeading)
        --SpawnEnemys(Tresor,Cops)
    end
end
end

RegisterNetEvent('mms-bounty:client:alertpolice')
AddEventHandler('mms-bounty:client:alertpolice',function(Tresor)
    PoliceHeistBlip = BccUtils.Blips:SetBlip(_U('PoliceHeistBlip'), 'blip_special_series_1', 0.2, Tresor.x,Tresor.y,Tresor.z)
    PoliceHeistBlipCreated = true
end)

RegisterNetEvent('mms-bounty:client:heisttresor')
AddEventHandler('mms-bounty:client:heisttresor',function(Tresor,Cops,TresorHeading)
    local TresorGroupPrompt = BccUtils.Prompts:SetupPromptGroup()
    tresorprompt = TresorGroupPrompt:RegisterPrompt(_U('TresorPromptName'), 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = 'MEDIUM_TIMED_EVENT'})
    local tresormodel = GetHashKey('s_vault_med_r_val_bent02x')
    while not HasModelLoaded(tresormodel) do
        Wait(10)
        RequestModel(tresormodel)
    end
    if spawnedtresor == false then
        
            createdtresor = CreateObject(tresormodel, Tresor.x,Tresor.y,Tresor.z -1, true, false, false)
            SetEntityHeading(createdtresor,TresorHeading)
            SetEntityAsMissionEntity(createdtresor, true)
            PlaceObjectOnGroundProperly(createdtresor, true)
            FreezeEntityPosition(createdtresor, true)
            spawnedtresor = true
        
            while spawnedtresor == true do
                Wait(10)
                local playerCoords = GetEntityCoords(PlayerPedId())
                local distance = #(playerCoords - Tresor)
                if distance < 2 then
                    TresorGroupPrompt:ShowGroup(_U('TresorPromptName'))
        
                    BccUtils.Misc.DrawText3D(Tresor.x,Tresor.y,Tresor.z, _U('PickThatTresor'))
                    if tresorprompt:HasCompleted() then
                        TriggerServerEvent('mms-bounty:server:checklockpick',Cops)
                    end
                end
                
            end
    end
end)


RegisterNetEvent('mms-bounty:client:haslockpick')
AddEventHandler('mms-bounty:client:haslockpick',function(Cops)
    deg1 = math.random(1,360)
    deg2 = math.random(1,360)
    deg3 = math.random(1,360)
    MiniGame.Start('lockpick', lockpicksettings, function(result)
        if result.unlocked == true then
            VORPcore.NotifyTip(_U('LockpickingSuccess'), 5000)
            Citizen.Wait(3000)
            TriggerServerEvent('mms-bounty:server:heistreward')
            if Config.HeistNpcs == true then
                SpawnCops(Cops)
            elseif Config.HeistNpcs == false then
                ResetHeist()
            end
        else
            VORPcore.NotifyTip(_U('LockpickingFailed'), 5000)
        end
    end)
end)


function SpawnCops(Cops)
    local modelHash = GetHashKey(Config.CopModel)
	while not HasModelLoaded(modelHash) do
		RequestModel(modelHash)
		Citizen.Wait(0)
	end
    for key, v in pairs(Cops) do
        local PlayerPedAttack = PlayerPedId()
	local copped = CreatePed(modelHash, v.x,v.y,v.z, true, true, false, false)
	if DoesEntityExist(copped) then
		SetPedRelationshipGroupHash(copped, `bandits`)
		SetRelationshipBetweenGroups(5, `PLAYER`, `bandits`)
		SetRelationshipBetweenGroups(5, `bandits`, `PLAYER`)
		Citizen.InvokeNative(0x283978A15512B2FE, copped, true)
		Citizen.InvokeNative(0x23f74c2fda6e7c61,953018525, copped)
		TaskCombatPed(copped, PlayerPedAttack)
		SetEntityAsMissionEntity(copped, true, true)
		Citizen.InvokeNative(0x740CB4F3F602C9F4, copped, true)
		CreatedCops[#CreatedCops + 1] = copped
		
	end
    end
    SetModelAsNoLongerNeeded(modelHash)
    CheckifDeadOrEscaped()
end


function CheckifDeadOrEscaped()
    local startcoords = GetEntityCoords(PlayerPedId())
    
    local chekifdead = 1
    local player = PlayerPedId()
    while chekifdead == 1 do
        Citizen.Wait(250)
        local numberOfAlivePeds = GetNumberOfAliveCops()
        local numberofDeadPeds = GetNumberOfDeadCops()
        local playerCoords = GetEntityCoords(PlayerPedId())
        local escapedistance = #(playerCoords - startcoords)
        if IsEntityDead(player) then
            VORPcore.NotifyTip(_U('YouDied'), 10000)
            ResetHeist()
            chekifdead = 0
        elseif numberOfAlivePeds == 0 then
            VORPcore.NotifyTip(_U('YouKilledAllCops'), 5000)
            ResetHeist()
            chekifdead = 0
        elseif escapedistance > 300 then
            VORPcore.NotifyTip(_U('YouAreEscaped'), 5000)
            ResetHeist()
            chekifdead = 0
        end
	end

end

function GetNumberOfAliveCops()
    local numberOfAlivePeds = 0
    for _, peds in ipairs(CreatedCops) do
		if DoesEntityExist(peds) then
			if not IsEntityDead(peds) then
				numberOfAlivePeds = numberOfAlivePeds + 1
			end
		end
    end
    return numberOfAlivePeds
end

function GetNumberOfDeadCops()
    local numberofDeadPeds = 0
    for _, peds in ipairs(CreatedCops) do
		if DoesEntityExist(peds) then
			if IsEntityDead(peds) then
				numberofDeadPeds = numberofDeadPeds + 1
			end
		end
    end
    return numberofDeadPeds
end

function ResetHeist()
    if Config.HeistNpcs == true then
	for _, peds in ipairs(CreatedCops) do
		if DoesEntityExist(peds) then
				DeletePed(peds)
				DeleteEntity(peds)
			SetEntityAsMissionEntity(ped, false, false)
			SetEntityAsNoLongerNeeded(ped)
		end
	end
    end
    HeistBlip:Remove()
    if spawnedtresor == true then
    tresorprompt:DeletePrompt()
    end
    DeleteObject(createdtresor)
	CreatedCops = {}
    
        TriggerServerEvent('mms-bounty:server:removeblip')
    
    HeistActive = false
    spawnedtresor = false
end

RegisterNetEvent('mms-bounty:client:removeblip')
AddEventHandler('mms-bounty:client:removeblip',function ()
    if Config.HeistAlerts == true and PoliceHeistBlipCreated == true then
        PoliceHeistBlip:Remove()
        PoliceHeistBlipCreated = false
    end
end)