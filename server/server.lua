local VORPcore = exports.vorp_core:GetCore()

local diff = nil
local reward = nil
local bountycount = nil
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
--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()