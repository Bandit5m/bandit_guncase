for k, v in pairs(Config.Cases) do
    RegisterUsableItem(k, function(source)
        local Player = GetPlayer(source);

        TriggerClientEvent('bandit_guncase:client:place', source, k)
        RemoveInventoryItem(source, k, 1)
    end)
end

RegisterNetEvent('bandit_guncase:server:pickup', function(item)
    local Player = GetPlayer(source);
    local inventory = exports.ox_inventory:CanCarryItem(source, item, 1)

    if inventory then
        return AddInventoryItem(source, item, 1)
    else
        return TriggerClientEvent('bandit_bridge:client:notification', source, 'You can\'t carry that much items.', 'error')
    end
end)

RegisterNetEvent('bandit_guncase:server:buy', function(item, amount, price)
    local Player = GetPlayer(source);
    local account = GetAccount(source, 'money').money
    local inventory = exports.ox_inventory:CanCarryItem(source, item, 1)

    if inventory then
        if account >= price then
            RemoveAccountMoney(source, 'money', price)
            AddInventoryItem(source, item, amount)
    
            return TriggerClientEvent('bandit_bridge:client:notification', source, string.format('You have successfully bought %sx %s for $%s', amount, item, price), 'success')
        else
            return TriggerClientEvent('bandit_bridge:client:notification', source, 'You don\'t have enough money for this item.', 'error')
        end
    else
        return TriggerClientEvent('bandit_bridge:client:notification', source, 'You can\'t carry that much items.', 'error')
    end
end)

CreateThread(function()
    for k, v in pairs(Config.Cases) do
        if GetResourceState('ox_inventory') == 'started' then
            local data = {
                id = k,
                label = v.stash.label,
                slots = v.stash.slots,
                weight = v.stash.weight
            }
    
            return exports.ox_inventory:RegisterStash(data.id, data.label, data.slots, data.weight)
        end
    end
end)