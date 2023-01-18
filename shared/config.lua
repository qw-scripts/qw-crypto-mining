Config = {}
 
-- DEBUG -- 
Config.Debug = false

Config.MenuLocation = vec3(1268.59, -1710.46, 54.77) -- Where the menu will be located

-- IF USING QB TARGET --
Config.MenuHeading = 109.93 -- The heading of the zone the menu will be located in
Config.MenuMinZ = 53.77 -- The minimum Z value of the zone the menu will be located in
Config.MenuMaxZ = 55.77 -- The maximum Z value of the zone the menu will be located in

-- IF USING OX TARGET --
Config.OxBoxSize =  vec3(2, 2, 2)
Config.OxBoxRotation = 45

Config.UsingOxLib = false -- If you are using ox_lib, set this to true
Config.UsingOxTarget = false -- If you are using ox_target, set this to true

Config.CryptoUpgrades = { -- Add any upgrades you want here, always make sure to have the first upgrade be None
    ['CPU'] = {
        [1] = {
            name = 'None',
            price = 0,
            hashRate = 0,
            powerUsage = 0,
            sellPrice = 0,
        },
        [2] = {
            name = 'Intel Core i5-12400',
            price = 150,
            hashRate = 0.2,
            powerUsage = 0.2,
            sellPrice = 70,
        },
        [3] = {
            name = 'Intel Core i5-12600K',
            price = 175,
            hashRate = 0.3,
            powerUsage = 0.5,
            sellPrice = 95,
        },
        [4] = {
            name = 'Intel Core i7-12700K',
            price = 235,
            hashRate = 0.5,
            powerUsage = 0.8,
            sellPrice = 125,
        },
        [5] = {
            name = 'Intel Core i9-12900K',
            price = 300,
            hashRate = 0.8,
            powerUsage = 1.3,
            sellPrice = 150,
        },
    },
    ['GPU'] = {
        [1] = {
            name = 'None',
            price = 0,
            hashRate = 0,
            powerUsage = 0,
            sellPrice = 0,
        },
        [2] = {
            name = 'Nvidia GTX 1060',
            price = 200,
            hashRate = 0.3,
            powerUsage = 0.4,
            sellPrice = 70,
        },
        [3] = {
            name = 'Nvidia GTX 1070',
            price = 300,
            hashRate = 0.6,
            powerUsage = 0.8,
            sellPrice = 95,
        },
        [4] = {
            name = 'Nvidia GTX 2080',
            price = 400,
            hashRate = 0.8,
            powerUsage = 1.2,
            sellPrice = 125,
        },
        [5] = {
            name = 'Nvidia GTX 3090',
            price = 500,
            hashRate = 1,
            powerUsage = 1.5,
            sellPrice = 150,
        },
    },
    ['RAM'] = {
        [1] = {
            name = 'None',
            price = 0,
            hashRate = 0,
            powerUsage = 0,
            sellPrice = 0,
        },
        [2] = {
            name = '8GB DDR4',
            price = 100,
            hashRate = 0.1,
            powerUsage = 0.2,
            sellPrice = 70,
        },
        [3] = {
            name = '16GB DDR4',
            price = 150,
            hashRate = 0.2,
            powerUsage = 0.3,
            sellPrice = 95,
        },
        [4] = {
            name = '32GB DDR4',
            price = 200,
            hashRate = 0.3,
            powerUsage = 0.4,
            sellPrice = 125,
        },
        [5] = {
            name = '64GB DDR4',
            price = 250,
            hashRate = 0.4,
            powerUsage = 0.5,
            sellPrice = 150,
        },
    }
}

Config.MiningInterval = 15 -- How often the system will run a mining cycle (in seconds)
Config.PowerUsageInterval = 60 -- How often the system will run a power usage cycle (in seconds)

Config.HashRateMultiplier = 1 -- How much the hash rate will be multiplied by
Config.PowerUsageMultiplier = 1 -- How much the power usage will be multiplied by

Config.PowerUsageBasePrice = 100 -- How much it costs to use 1 power unit

Config.BuyPrice = 10000 -- How much it costs to rent a mining rig
