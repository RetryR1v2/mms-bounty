local VORPcore = exports.vorp_core:GetCore()
local BccUtils = exports['bcc-utils'].initiate()
local FeatherMenu =  exports['feather-menu'].initiate()

local getbounty = 0
local MissionActive = false
local dist = nil
local CreatedOutlaws = {}
---------------------------------------------------------------------------------

Citizen.CreateThread(function()
local BountyBoardPrompt = BccUtils.Prompts:SetupPromptGroup()
    local traderprompt = BountyBoardPrompt:RegisterPrompt(Config.PromptName, 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = 'MEDIUM_TIMED_EVENT'})
    if Config.BoardBlips then
        for h,v in pairs(Config.BountyBoards) do
        local blip = BccUtils.Blips:SetBlip(Config.BoardblipName, 'blip_ambient_bounty_hunter', 0.2, v.coords.x,v.coords.y,v.coords.z)
        end
    end
    
    while true do
        Wait(1)
        for h,v in pairs(Config.BountyBoards) do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local dist = #(playerCoords - v.coords)
        if dist < 2 then
            BountyBoardPrompt:ShowGroup(Config.PromptName)

            --BccUtils.Misc.DrawText3D(plantcoords.x, plantcoords.y, plantcoords.z, _U('WaterCropPrompt'))
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


Citizen.CreateThread(function()  --- RegisterFeather Menu
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
        value = Config.BoardHeader,
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
        label = Config.GetBountyList,
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
    BountyBoardPage1:RegisterElement('button', {
        label =  Config.LabelAbort,
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        TriggerEvent('mms-bounty:client:abortbounty')
    end)
    BountyBoardPage1:RegisterElement('button', {
        label =  Config.CloseBoard,
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
        value = Config.BoardHeader,
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


end)

RegisterNetEvent('mms-bounty:client:getbountyfromdb')
AddEventHandler('mms-bounty:client:getbountyfromdb',function()
    getbounty = 1
    TriggerServerEvent('mms-bounty:server:getbountyfromdb')
end)


RegisterNetEvent('mms-bounty:client:nobounty')
AddEventHandler('mms-bounty:client:nobounty',function()
    getbounty = 0
    --TriggerServerEvent('mms-bounty:server:getbountyfromdb')
end)


RegisterNetEvent('mms-bounty:client:bountylist')
AddEventHandler('mms-bounty:client:bountylist',function(eintraege)
    
    BountyBoardPage2 = BountyBoard:RegisterPage('seite2')
    BountyBoardPage2:RegisterElement('header', {
        value = Config.BoardHeader,
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
        local buttonLabel = Config.Kill .. bounty.name .. Config.LabelDiff .. bounty.difficulty .. Config.LabelReward .. bounty.reward .. '$'
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
        label =  Config.BackBounty,
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        BountyBoardPage1:RouteTo()
    end)
    BountyBoardPage2:RegisterElement('button', {
        label =  Config.CloseBoard,
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
        value = Config.BoardHeader,
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

RegisterNetEvent('mms-bounty:client:abortbounty')
AddEventHandler('mms-bounty:client:abortbounty',function()
    BountyBoard:Close({})
    if MissionActive == true then
    Reset()
    TriggerServerEvent('mms-bounty:server:addbountyonabort')
    VORPcore.NotifyTip(Config.ActiveMissionAborted, 5000)
    else
        VORPcore.NotifyTip(Config.NoActiveBounty, 5000)
    end
end)


RegisterNetEvent('mms-bounty:client:startbounty')
AddEventHandler('mms-bounty:client:startbounty',function(id,difficulty,name,reward)
    BountyBoard:Close({})
    if MissionActive == false then
        TriggerServerEvent('mms-bounty:server:deletebounty',id)
        VORPcore.NotifyTip(Config.MissionStartet, 5000)
        MissionActive = true
        if difficulty == Config.Easy then
            local randomeasy = math.random(1,#Config.EasyMissions)
            local selected = Config.EasyMissions[randomeasy]
            CheckDistance(selected,reward)
        elseif difficulty == Config.Middle then
            local randommiddle = math.random(1,#Config.MiddleMissions)
            local selected = Config.EasyMissions[randommiddle]
            CheckDistance(selected,reward)
        elseif difficulty == Config.Hard then
            local randomhard = math.random(1,#Config.HardMissions)
            local selected = Config.HardMissions[randomhard]
            CheckDistance(selected,reward)
        end
    

    else
        VORPcore.NotifyTip(Config.AlreadyHasMission, 5000)
    end
end)


function CheckDistance(selected,reward)--blip:Remove()
    AreaBlip = BccUtils.Blips:SetBlip(Config.MissionBlip, 'blip_ambient_bounty_hunter', 0.2, selected[1].x,selected[1].y,selected[1].z)
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
	if DoesEntityExist(bountyped) then
		SetPedRelationshipGroupHash(bountyped, `bandits`)
		SetRelationshipBetweenGroups(5, `PLAYER`, `bandits`)
		SetRelationshipBetweenGroups(5, `bandits`, `PLAYER`)
		Citizen.InvokeNative(0x283978A15512B2FE, bountyped, true)
		Citizen.InvokeNative(0x23f74c2fda6e7c61,305281166, bountyped)
		TaskCombatPed(bountyped, PlayerPedAttack)
		SetEntityAsMissionEntity(bountyped, true, true)
		Citizen.InvokeNative(0x740CB4F3F602C9F4, bountyped, true)
		CreatedOutlaws[#CreatedOutlaws + 1] = bountyped
		
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
        
        VORPcore.NotifyTip(Config.EnemyRemain .. numberOfAlivePeds, 5000)
        if IsEntityDead(player) then
            VORPcore.NotifyTip(Config.MissionFailed, 5000)
            chekifdead = 0
            Reset()
        elseif numberOfAlivePeds == 0 then
            VORPcore.NotifyTip(Config.MissionSuccess, 5000)
            VORPcore.NotifyTip(Config.KiledEnemys .. numberofDeadPeds , 5000)
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
		if DoesEntityExist(peds) then
				DeletePed(peds)
				DeleteEntity(peds)
			SetEntityAsMissionEntity(ped, false, false)
			SetEntityAsNoLongerNeeded(ped)
		end
	end
    AreaBlip:Remove()
	CreatedOutlaws = {}
    MissionActive = false
end