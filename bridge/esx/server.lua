if GetResourceState('es_extended') ~= 'started' then return end

ESX = exports.es_extended:getSharedObject()

function GetPlayer(source)
    return ESX.GetPlayerFromId(source)
end

function GetJobCount(source, job)
    return ESX.GetExtendedPlayers('job', job)
end

function RegisterCallback(name, cb)
    ESX.RegisterServerCallback(name, cb)
end

--
-- Job Functions
--
function DoesJobExist(source, job, grade)
    return ESX.DoesJobExist(job, grade)
end

function SetJob(source, name, grade)
    local Player = GetPlayer(source)

    return Player.setJob(name, grade)
end

--
-- Item Functions
--
function RegisterUsableItem(...)
    ESX.RegisterUsableItem(...)
end

function GetInventoryItem(source, item)
    local Player = GetPlayer(source)

    return Player.getInventoryItem(item)
end

function AddInventoryItem(source, item, amount) 
    local Player = GetPlayer(source)

    return Player.addInventoryItem(item, amount) 
end

function RemoveInventoryItem(source, item, amount)
    local Player = GetPlayer(source)

    return Player.removeInventoryItem(item, amount)
end

function CanCarryItem(source, item, count)
    local Player = GetPlayer(source)

    return Player.canCarryItem(item, count)
end

--
-- Money Functions
--
function GetAccount(source, account)
    local Player = GetPlayer(source)

    return Player.getAccount(account)
end

function AddAccountMoney(source, account, money)
    local Player = GetPlayer(source)

    return Player.addAccountMoney(account, money)
end

function RemoveAccountMoney(source, account, money)
    local Player = GetPlayer(source)

    return Player.removeAccountMoney(account, money)
end