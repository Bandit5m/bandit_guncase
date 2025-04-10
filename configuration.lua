Config = {
    Debug = false,

    Locations = {
        points = {
            {
                blip = { enabled = true, label = 'Ammu-Nation Accessories', sprite = 313, colour = 0, scale = 1.0 },
    
                interact = {
                    coords = vec3(20.2, -1110.17, 29.8),
                    heading = 340
                },
    
                items = {
                    { label = 'Black Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/blackguncase.png', item = 'blackguncase', price = 27 },
                    { label = 'Tan Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/tanguncase.png', item = 'tanguncase', price = 30 },
                }
            },
            {
                blip = { enabled = true, label = 'Ammu-Nation Accessories', sprite = 313, colour = 0, scale = 1.0 },
    
                interact = {
                    coords = vec3(-662.86, -938.88, 21.83),
                    heading = 0
                },
    
                items = {
                    { label = 'Black Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/blackguncase.png', item = 'blackguncase', price = 27 },
                    { label = 'Tan Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/tanguncase.png', item = 'tanguncase', price = 30 },
                }
            },
            {
                blip = { enabled = true, label = 'Ammu-Nation Accessories', sprite = 313, colour = 0, scale = 1.0 },
    
                interact = {
                    coords = vec3(843.06, -1030.09, 28.19),
                    heading = 0
                },
    
                items = {
                    { label = 'Black Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/blackguncase.png', item = 'blackguncase', price = 27 },
                    { label = 'Tan Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/tanguncase.png', item = 'tanguncase', price = 30 },
                }
            },
            {
                blip = { enabled = true, label = 'Ammu-Nation Accessories', sprite = 313, colour = 0, scale = 1.0 },
    
                interact = {
                    coords = vec3(810.8, -2153.78, 29.62),
                    heading = 0
                },
    
                items = {
                    { label = 'Black Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/blackguncase.png', item = 'blackguncase', price = 27 },
                    { label = 'Tan Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/tanguncase.png', item = 'tanguncase', price = 30 },
                }
            },
            {
                blip = { enabled = true, label = 'Ammu-Nation Accessories', sprite = 313, colour = 0, scale = 1.0 },
    
                interact = {
                    coords = vec3(249.05, -48.19, 69.94),
                    heading = 250
                },
    
                items = {
                    { label = 'Black Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/blackguncase.png', item = 'blackguncase', price = 27 },
                    { label = 'Tan Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/tanguncase.png', item = 'tanguncase', price = 30 },
                }
            },
            {
                blip = { enabled = true, label = 'Ammu-Nation Accessories', sprite = 313, colour = 0, scale = 1.0 },
    
                interact = {
                    coords = vec3(-1309.12, -392.77, 36.7),
                    heading = 255
                },
    
                items = {
                    { label = 'Black Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/blackguncase.png', item = 'blackguncase', price = 27 },
                    { label = 'Tan Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/tanguncase.png', item = 'tanguncase', price = 30 },
                }
            },
            {
                blip = { enabled = true, label = 'Ammu-Nation Accessories', sprite = 313, colour = 0, scale = 1.0 },
    
                interact = {
                    coords = vec3(-1115.89, 2695.4, 18.55),
                    heading = 40
                },
    
                items = {
                    { label = 'Black Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/blackguncase.png', item = 'blackguncase', price = 27 },
                    { label = 'Tan Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/tanguncase.png', item = 'tanguncase', price = 30 },
                }
            },
            {
                blip = { enabled = true, label = 'Ammu-Nation Accessories', sprite = 313, colour = 0, scale = 1.0 },
    
                interact = {
                    coords = vec3(1695.78, 3756.96, 34.71),
                    heading = 225
                },
    
                items = {
                    { label = 'Black Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/blackguncase.png', item = 'blackguncase', price = 27 },
                    { label = 'Tan Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/tanguncase.png', item = 'tanguncase', price = 30 },
                }
            },
            {
                blip = { enabled = true, label = 'Ammu-Nation Accessories', sprite = 313, colour = 0, scale = 1.0 },
    
                interact = {
                    coords = vec3(-328.34, 6080.87, 31.45),
                    heading = 227
                },
    
                items = {
                    { label = 'Black Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/blackguncase.png', item = 'blackguncase', price = 27 },
                    { label = 'Tan Gun Case', description = 'Used for storing your gun.', image = 'nui://ox_inventory/web/images/tanguncase.png', item = 'tanguncase', price = 30 },
                }
            }
        }
    },

    Cases = {
        blackguncase = {
            animation = { dict = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@', clip = 'plant_floor' },
            prop = { hash = `prop_box_guncase_01a` },
            stash = { label = 'Black Gun Case', slots = 1, weight = 10000 },
        },
        tanguncase = {
            animation = { dict = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@', clip = 'plant_floor' },
            prop = { hash = `prop_box_guncase_01a` },
            stash = { label = 'Tan Gun Case', slots = 1, weight = 10000 },
        },
    },

    Timers = {
        placing = 1000,
        picking = 1000
    },

    Notify = function(message, type)
        lib.notify({
            title = 'Gun Case',
            description = message,
            type = type or 'inform',
        })
    end,
}