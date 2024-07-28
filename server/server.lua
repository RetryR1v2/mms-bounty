local VORPcore = exports.vorp_core:GetCore()

local diff = nil
local reward = nil
local bountycount = nil
local sheriffbountycount = nil
local userjob = nil
local heistactive = false
local heistcooldown = Config.HeistCooldown * 60

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
        print(diff)
        reward = math.random(Config.MinMiddleReward,Config.MaxMiddleReward)
    elseif difficulty == 3 then
        diff = Config.Hard
        print(diff)
        reward = math.random(Config.MinHardReward,Config.MaxHardReward)
    end
    local rn = math.random(1,#Config.Names)
    local getrandomname = Config.Names[rn]
    local randomname = getrandomname.name
        MySQL.insert('INSERT INTO `mms_bounty` (difficulty, reward, name) VALUES (?, ?, ?)', {diff,reward,randomname}, function()end)
        if Config.ServerConsolePrints == true then
        print(bountycount)
        end
        Citizen.Wait(Config.CreateBountyTime*60000)
else
    Citizen.Wait(Config.CreateBountyTime*60000)
    if Config.ServerConsolePrints == true then
    print('Max Bounty Amount Cant Create More Bountys Bounty Count: '..bountycount)
    end
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
            VORPcore.NotifyTip(src, _U('NoBountys'), 5000)
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
    VORPcore.NotifyTip(src, _U('RewardGet') .. reward .. '$',  5000)
    local firstname = Character.firstname
    local lastname = Character.lastname
    if Config.WebHook then
        VORPcore.AddWebhook(Config.WHTitle, Config.WHLink, firstname .. ' ' .. lastname .. ' Got A Reward from Bounty $ ' .. reward, Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
    end
end)

RegisterServerEvent('mms-bounty:server:rewardsheriffmission',function(reward,playerjob)
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    if Config.UseSheriffLedger then
        local Database = Config.Database
        local BalanceColumn = Config.BalanceColumn
        local JobColumn = Config.JobColumn
        local Job = playerjob
        local result = MySQL.query.await("SELECT "..BalanceColumn.." FROM ".. Database .. " WHERE "..JobColumn.."=?", {Job})
        local newbalance = result[1][Config.BalanceColumn] + reward
        MySQL.update("UPDATE ".. Database .. " SET "..BalanceColumn.." = ? WHERE "..JobColumn.." = ?",{newbalance, Job})
        VORPcore.NotifyTip(src, _U('RewardGetSheriffMission') .. reward .. '$',  5000)
        local firstname = Character.firstname
        local lastname = Character.lastname
        if Config.WebHook then
            VORPcore.AddWebhook(Config.WHTitle, Config.WHLink, firstname .. ' ' .. lastname .. ' Got A Reward from Sheriff Mission To Ledger $ ' .. reward, Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
        end
    else
        Character.addCurrency(0, reward)
        VORPcore.NotifyTip(src, _U('RewardGet') .. reward .. '$',  5000)
        local firstname = Character.firstname
        local lastname = Character.lastname
        if Config.WebHook then
            VORPcore.AddWebhook(Config.WHTitle, Config.WHLink, firstname .. ' ' .. lastname .. ' Got A Reward from SheriffMission $ ' .. reward, Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
        end
    end
end)


RegisterServerEvent('mms-bounty:server:checklockpick',function(Cops)
    local src = source
    local itemCount = exports.vorp_inventory:getItemCount(src, nil, Config.LockpickItem,nil)
        if itemCount > 0 then
            exports.vorp_inventory:subItem(src, Config.LockpickItem, 1)
            TriggerClientEvent('mms-bounty:client:haslockpick',src,Cops)
        else
            VORPcore.NotifyTip(src, _U('MissingLockpick'),  5000)
        end
end)

RegisterServerEvent('mms-bounty:server:heistreward',function()
    local heistreward = math.random(Config.HeistRewardMin,Config.HeistRewardMax)
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    local firstname = Character.firstname
    local lastname = Character.lastname
    if Config.WebHook then
        VORPcore.AddWebhook(Config.WHTitle, Config.WHLink, firstname .. ' ' .. lastname .. ' Got A Reward from heist $ ' .. heistreward, Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
    end
    Character.addCurrency(0, heistreward)
    VORPcore.NotifyTip(src, _U('HeistRewardGet') .. heistreward .. '$',  5000)
    Citizen.Wait(3000)
    if Config.LuckyItemsActive == true then
        local randomitemtable = math.random(1,#Config.LuckyItems)
        local getrandomitem = Config.LuckyItems[randomitemtable]
        local randomitemname = getrandomitem.LuckyItem
        local chance = math.random(1,10)
        local amount = math.random(1,3)
        if chance > 8 then
            exports.vorp_inventory:addItem(src, randomitemname,amount, nil,nil)
            VORPcore.NotifyTip(src, _U('HeistRewardGetItem') .. randomitemname,  5000)
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
    VORPcore.NotifyTip(src, _U('SheriffBountySet'),  5000)
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
            VORPcore.NotifyTip(src, _U('NoBountys'), 5000)
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
            VORPcore.NotifyTip(src, _U('SheriffBountyDelted'),  5000)
        else
            VORPcore.NotifyTip(src, 'Error This Id not in Database ( Database Error Contact Support)!',  5000)
        end
    end)
end)

-------------------------------- Alert Active Cops ------------------------------------

RegisterServerEvent('mms-bounty:server:alertpolice',function(Tresor)
for _, player in ipairs(GetPlayers()) do
    local Character = VORPcore.getUser(player).getUsedCharacter
        userjob = Character.job
        for y, e in pairs(Config.Jobs) do
            if userjob == e.JobName then
                TriggerClientEvent('mms-bounty:client:alertpolice',player,Tresor)
                VORPcore.NotifyTip(player, _U('HeistActive'), 10000)
            end
        end
end
end)

RegisterServerEvent('mms-bounty:server:removeblip',function()
    for _, player in ipairs(GetPlayers()) do
        local Character = VORPcore.getUser(player).getUsedCharacter
            userjob = Character.job
            for y, e in pairs(Config.Jobs) do
                if userjob == e.JobName then
                    TriggerClientEvent('mms-bounty:client:removeblip',player)
                end
            end
    end

end)

----- HEIST COOLDOWN ----

RegisterServerEvent('mms-bounty:server:CheckifheistActive',function()
    local src = source
    if not heistactive then
        heistactive = true
        TriggerClientEvent('mms-bounty:client:startheist2',src)
    else
        VORPcore.NotifyTip(src, _U('HeistInCooldown'), 5000)
    end
end)


Citizen.CreateThread(function ()
    while true do
        Wait(1000)
        if heistactive then
            local cooldown = 0
            while cooldown <= heistcooldown do
                Wait(1000)
                cooldown = cooldown + 1
            end
            heistactive = false
        end
    end
end)


-------WEBHOOK-----
RegisterServerEvent('mms-bounty:server:startheistwebhook',function ()
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    local Firstname = Character.firstname
    local Lastname = Character.lastname
    if Config.WebHook then
        VORPcore.AddWebhook(Config.WHTitle, Config.WHLink, Firstname .. ' ' .. Lastname .. ' Startet a Heist', Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
    end
end)

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()