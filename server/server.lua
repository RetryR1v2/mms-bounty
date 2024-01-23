local VORPcore = exports.vorp_core:GetCore()

local diff = nil
local reward = nil
local bountycount = nil
local sheriffbountycount = nil
-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/RetryR1v2/mms-bounty/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

      
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('Current Version: %s'):format(currentVersion))
            versionCheckPrint('success', ('Latest Version: %s'):format(text))
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end

Citizen.CreateThread(function()
    while true do
    local count = MySQL.query.await('SELECT COUNT(*) FROM mms_bounty;')[1]
    for _,v in pairs(count) do
        bountycount = v
    end
    if bountycount < Config.MaxBountys then
    local difficulty = math.random(1,3)
    if difficulty == 1 then
        diff = Config.Easy
        reward = math.random(Config.MinEasyReward,Config.MaxEasyReward)
    elseif difficulty == 2 then
        diff = Config.Middle
        reward = math.random(Config.MinMiddleReward,Config.MaxMiddleReward)
    elseif difficulty == 3 then
        diff = Config.Hard
        reward = math.random(Config.MinHardReward,Config.MaxHardReward)
    end
    local rn = math.random(1,#Config.Names)
    local getrandomname = Config.Names[rn]
    local randomname = getrandomname.name
        MySQL.insert('INSERT INTO `mms_bounty` (difficulty, reward, name) VALUES (?, ?, ?)', {diff,reward,randomname}, function()end)
        print(bountycount)
        Citizen.Wait(Config.CreateBountyTime*60000)
else
    Citizen.Wait(Config.CreateBountyTime*60000)
    print('Max Bounty Amount Cant Create More Bountys Bounty Count: '..bountycount)
end
end
end)


RegisterServerEvent('mms-bounty:server:addbountyonabort',function()
    local count = MySQL.query.await('SELECT COUNT(*) FROM mms_bounty;')[1]
    for _,v in pairs(count) do
        bountycount = v
    end
    if bountycount < Config.MaxBountys then
    local difficulty = math.random(1,3)
    if difficulty == 1 then
        diff = Config.Easy
        reward = math.random(Config.MinEasyReward,Config.MaxEasyReward)
    elseif difficulty == 2 then
        diff = Config.Middle
        reward = math.random(Config.MinMiddleReward,Config.MaxMiddleReward)
    elseif difficulty == 3 then
        diff = Config.Hard
        reward = math.random(Config.MinHardReward,Config.MaxHardReward)
    end
    local rn = math.random(1,#Config.Names)
    local getrandomname = Config.Names[rn]
    local randomname = getrandomname.name
        MySQL.insert('INSERT INTO `mms_bounty` (difficulty, reward, name) VALUES (?, ?, ?)', {diff,reward,randomname}, function()end)
        print(bountycount)
        Citizen.Wait(Config.CreateBountyTime*60000)
else
    Citizen.Wait(Config.CreateBountyTime*60000)
    print('Max Bounty Amount Cant Create More Bountys Bounty Count: '..bountycount)
end
end)

RegisterServerEvent('mms-bounty:server:getbountyfromdb',function()
    local src = source
    local count = MySQL.query.await('SELECT COUNT(*) FROM mms_bounty;')[1]
    for _,v in pairs(count) do
        bountycount = v
    end
    MySQL.query('SELECT `id`, `difficulty`, `reward`, `name` FROM `mms_bounty`', {}, function(result)
        
        if result and #result ~= nil and bountycount > 0 then
            local eintraege = {}
            for _, bounty in ipairs(result) do
                table.insert(eintraege, bounty)
            end
                TriggerClientEvent('mms-bounty:client:bountylist', src, eintraege)
        elseif bountycount == 0 then
            VORPcore.NotifyTip(src, Config.NoBountys, 5000)
            TriggerClientEvent('mms-bounty:client:nobounty', src)
        end
    end)
end)

RegisterServerEvent('mms-bounty:server:deletebounty',function(id)
    local src = source
    MySQL.query('SELECT * FROM mms_bounty WHERE id = ?', {id}, function(result)
        if result ~= nil then
            MySQL.execute('DELETE FROM mms_bounty WHERE id = ?', { id }, function()
            end)
        
        else
            VORPcore.NotifyTip(src, 'Error This Id not in Database ( Database Error Contact Support)!',  5000)
        end
    end)
end)


RegisterServerEvent('mms-bounty:server:reward',function(reward)
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    Character.addCurrency(0, reward)
    VORPcore.NotifyTip(src, Config.RewardGet .. reward .. '$',  5000)
end)


RegisterServerEvent('mms-bounty:server:checklockpick',function(Cops)
    local src = source
    local itemCount = exports.vorp_inventory:getItemCount(src, nil, Config.LockpickItem,nil)
        if itemCount > 0 then
            exports.vorp_inventory:subItem(src, Config.LockpickItem, 1)
            TriggerClientEvent('mms-bounty:client:haslockpick',src,Cops)
        else
            VORPcore.NotifyTip(src, Config.MissingLockpick,  5000)
        end
end)

RegisterServerEvent('mms-bounty:server:heistreward',function()
    local heistreward = math.random(Config.HeistRewardMin,Config.HeistRewardMax)
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    Character.addCurrency(0, heistreward)
    VORPcore.NotifyTip(src, Config.HeistRewardGet .. heistreward .. '$',  5000)
    Citizen.Wait(3000)
    if Config.LuckyItemsActive == true then
        local randomitemtable = math.random(1,#Config.LuckyItems)
        local getrandomitem = Config.LuckyItems[randomitemtable]
        local randomitemname = getrandomitem.LuckyItem
        local chance = math.random(1,10)
        local amount = math.random(1,3)
        if chance > 8 then
            exports.vorp_inventory:addItem(src, randomitemname,amount, nil,nil)
            VORPcore.NotifyTip(src, Config.HeistRewardGetItem .. randomitemname,  5000)
        end
    end
end)

-------------------------------- SHERIFF BountyAdd ------------------------------------

RegisterServerEvent('mms-bounty:server:getplayerjob',function()
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    local job = Character.job
    TriggerClientEvent('mms-bounty:client:getplayerjob',src,job)
end)

RegisterServerEvent('mms-bounty:server:addsheriffbounty',function(inputFirstname,inputLastname,inputReason,inputReward)
    local src = source
    MySQL.insert('INSERT INTO `mms_sheriffbounty` (firstname, lastname, reason, reward) VALUES (?, ?, ?, ?)', {inputFirstname,inputLastname,inputReason,inputReward}, function()end)
    VORPcore.NotifyTip(src, Config.SheriffBountySet,  5000)
end)

RegisterServerEvent('mms-bounty:server:getsheriffbountyfromdb',function()
    local src = source
    local count = MySQL.query.await('SELECT COUNT(*) FROM mms_sheriffbounty;')[1]
    for _,v in pairs(count) do
        bountycount = v
    end
    MySQL.query('SELECT `id`,`firstname`, `lastname`, `reason`, `reward` FROM `mms_sheriffbounty`', {}, function(result)
        
        if result and #result ~= nil and bountycount > 0 then
            local sheriffeintraege = {}
            for _, sheriff in ipairs(result) do
                table.insert(sheriffeintraege, sheriff)
            end
                TriggerClientEvent('mms-bounty:client:sheriffbountylist', src, sheriffeintraege)
        elseif bountycount == 0 then
            VORPcore.NotifyTip(src, Config.NoBountys, 5000)
            TriggerClientEvent('mms-bounty:client:nobounty', src)
        end
    end)
end)

RegisterServerEvent('mms-bounty:server:deletesheriffbountyfromdb',function(id)
    local src = source
    MySQL.query('SELECT * FROM mms_sheriffbounty WHERE id = ?', {id}, function(result)
        if result ~= nil then
            MySQL.execute('DELETE FROM mms_sheriffbounty WHERE id = ?', { id }, function()
            end)
            VORPcore.NotifyTip(src, Config.SheriffBountyDelted,  5000)
        else
            VORPcore.NotifyTip(src, 'Error This Id not in Database ( Database Error Contact Support)!',  5000)
        end
    end)
end)

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()