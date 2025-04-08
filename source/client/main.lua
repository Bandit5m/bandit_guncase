local isPlacing, isPicking = false, false

CreateThread(function()
    for k, v in pairs(Config.Locations) do
        local point = lib.points.new({
            coords = v.interact.coords,
            distance = 2.5
        })

        function point:onEnter()
            CreateInteraction(k)
        end

        function point:onExit()
            DeleteInteraction(k)
        end

        if v.blip.enabled then
            CreateBlip(k)
        end
    end
end)

function CreateInteraction(index)
    local data = Config.Locations[index];
    local location = data.interact.coords;
    local heading = data.interact.heading;

    if GetResourceState('ox_target') == 'started' then
        local options = {
            {
                name = 'interact',
                icon = 'fas fa-user-secret',
                label = 'Interact',
                onSelect = function()
                    BrowseStore(index)
                end
            }
        }

        exports.ox_target:addBoxZone({
            coords = location,
            size = data.size,
            rotation = data.interact.w,
            debug = Config.Debug,
            options = options
        })
    end
end

function DeleteInteraction(index)
    if GetResourceState('ox_target') == 'started' then
        exports.ox_target:removeZone('interact')
    end
end

function CreateBlip(index)
    local data = Config.Locations[index];
    local blip = AddBlipForCoord(data.interact.coords);

    SetBlipSprite(blip, data.blip.sprite)
    SetBlipColour(blip, data.blip.colour)
    SetBlipScale(blip, data.blip.scale)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(data.blip.label)
    EndTextCommandSetBlipName(blip)

    return blip
end

function BrowseStore(index)
    local data = Config.Locations[index];
    local Options = {};

    for _, data in ipairs(data.items) do
        table.insert(Options, {
            title = data.label,
            description = data.description,
            icon = data.image,
            metadata = {
                { label = 'Price', value = '$' .. data.price }
            },
            onSelect = function()
                local input = lib.inputDialog('How many?', {
                    { type = 'number', label = 'Amount?', description = string.format('How many %s would you like to purchase?', data.label), required = true }
                })

                local success = lib.alertDialog({
                    header = string.format('Purchase %s', data.label),
                    content = string.format('Do you wish to purchase %s?', data.label),
                    centered = true,
                    cancel = false
                })
                
                amount = input[1]

                if input then
                    if success then
                        return TriggerServerEvent('bandit_guncase:server:buy', data.item, amount, data.price)
                    end
                end
            end
        })

        lib.registerContext({
            id = 'ammunation',
            title = 'Ammu-Nation Accessories',
            options = Options
        })

        lib.showContext('ammunation')
    end
end

RegisterNetEvent('bandit_guncase:client:place', function(index)
    PlaceObject(index)
end)

function PlaceObject(index)
    if isPlacing then return end

    CreateThread(function()
        local data = Config.Cases[index];
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        isPlacing = true

        while isPlacing do
            lib.playAnim(ped, data.animation.dict, data.animation.clip, 8.0, -8, -1, 49, 0.0, false, false, false)

            FreezeEntityPosition(ped, true)
            lib.progressBar({
                label = 'Placing case down...',
                duration = Config.Timers.placing
            })
            FreezeEntityPosition(ped, false)

            lib.requestModel(data.prop.hash, 3000)
            object = CreateObject(data.prop.hash, coords.x, coords.y, coords.z - 0.99, true, true, true)
            PlaceObjectOnGroundProperly(object)
            FreezeEntityPosition(object, true)
            ClearPedTasksImmediately(ped)
            TriggerServerEvent('bandit_guncase:server:remove', index)
            isPlacing = false
        end

        if GetResourceState('ox_target') == 'started' then
            local options = {
                {
                    name = 'interact',
                    icon = 'fas fa-user-secret',
                    label = 'Interact',
                    onSelect = function()
                        OpenStash(index)
                    end
                },
                {
                    name = 'pickup',
                    icon = 'fas fa-person-walking-luggage',
                    label = 'Pickup',
                    onSelect = function()
                        DeleteProp(index)
                    end
                },
            }
    
            exports.ox_target:addModel(data.prop.hash, options)
        end

        Wait(0)
    end)
end

function DeleteProp(index)
    if isPicking then return end

    CreateThread(function()
        local data = Config.Cases[index];
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        isPicking = true

        while isPicking do                        
            lib.playAnim(ped, data.animation.dict, data.animation.clip, 8.0, -8, -1, 49, 0.0, false, false, false)

            FreezeEntityPosition(ped, true)
            lib.progressBar({
                label = 'Picking up case...',
                duration = Config.Timers.picking
            })
            FreezeEntityPosition(ped, false)

            DeleteObject(object)
            ClearPedTasksImmediately(ped)
            TriggerServerEvent('bandit_guncase:server:pickup', index)
            isPicking = false
        end
    end)
end

function OpenStash(index)
    if GetResourceState('ox_inventory') == 'started' then
        return exports.ox_inventory:openInventory('stash', index)
    end
end