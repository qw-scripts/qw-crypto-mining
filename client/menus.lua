local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qw-crypto-mining:client:openMenu', function()
    QBCore.Functions.TriggerCallback('qw-crypto-mining:server:getPlayerCryptoMiningData', function(result)
        if not result then
            if not Config.UsingOxLib then
                exports['qb-menu']:openMenu({
                    {
                        header = 'Crypto Mining',
                        icon = 'fa-solid fa-bitcoin',
                        isMenuHeader = true, -- Set to true to make a nonclickable title
                    },
                    {
                        header = 'Buy a Mining Rig',
                        txt = 'Buy a mining rig for $' .. Config.BuyPrice,
                        icon = 'fas fa-money-bill',
                        params = {
                            isServer = true,
                            event = 'qw-crypto-mining:server:purchaseRig', -- event name
                        }
                    },
                })
            else
                lib.registerContext({
                    id = 'crypto_mining_menu',
                    title = 'Crypto Mining',
                    options = {
                        {
                            title = 'Buy a Mining Rig',
                            description = 'Buy a mining rig for $' .. Config.BuyPrice,
                            icon = 'fa-solid fa-money-bill',
                            onSelect = function() 
                                TriggerServerEvent('qw-crypto-mining:server:purchaseRig')
                            end,
                        },
                    },
                })
    
                lib.showContext('crypto_mining_menu')
            end
        else
            if not Config.UsingOxLib then
                exports['qb-menu']:openMenu({
                    {
                        header = 'Crypto Mining',
                        isMenuHeader = true, -- Set to true to make a nonclickable title
                    },
                    {
                        header = 'View Mining Rig',
                        txt = 'View your current Setup',
                        params = {
                            event = 'qw-crypto-mining:client:openViewRig', -- event name
                            args = {
                                data = result
                            }
                        }
                    },
                    {
                        header = 'Upgrade Mining Rig',
                        txt = 'Upgrade your current Setup',
                        params = {
                            event = 'qw-crypto-mining:client:openUpgradeMenu', -- event name
                            args = {
                                data = result
                            }
                        }
                    },
                    {
                        header = 'Shutdown Rig',
                        txt = 'Shutdown your current Setup',
                        params = {
                            event = 'qw-crypto-mining:server:stopRig', -- event name
                            isServer = true,
                        }
                    },
                    {
                        header = 'Sell Mining Rig',
                        txt = 'Sell your current Setup',
                        params = {
                            event = 'qw-crypto-mining:server:sellRig', -- event name
                            isServer = true,
                        }
                    },
                })
            else
                lib.registerContext({
                    id = 'crypto_mining_menu',
                    title = 'Crypto Mining',
                    options = {
                        {
                            title = 'View Mining Rig',
                            description = 'View your current Setup',
                            arrow = true,
                            onSelect = function()
                                lib.hideContext()
                                TriggerEvent('qw-crypto-mining:client:openViewRig', result)
                            end,
                        },
                        {
                            title = 'Upgrade Mining Rig',
                            description = 'Upgrade your current Setup',
                            arrow = true,
                            onSelect = function()
                                lib.hideContext()
                                TriggerEvent('qw-crypto-mining:client:openUpgradeMenu', result)
                            end,
                        },
                        {
                            title = 'Shutdown Rig',
                            description = 'Shutdown your current Setup',
                            onSelect = function()
                                lib.hideContext()
                                TriggerServerEvent('qw-crypto-mining:server:stopRig')
                            end,
                        },
                        {
                            title = 'Sell Mining Rig',
                            description = 'Sell your current Setup',
                            onSelect = function()
                                lib.hideContext()
                                TriggerServerEvent('qw-crypto-mining:server:sellRig')
                            end,
                        },
                    },
                })
    
                lib.showContext('crypto_mining_menu')
            end
        end
    end)
end)

RegisterNetEvent('qw-crypto-mining:client:openViewRig', function(rigData)
    local rigUpgradeMenu = nil
    
    if not Config.UsingOxLib then
        rigUpgradeMenu = generateViewRigMenu(rigData.data)
        exports['qb-menu']:openMenu(rigUpgradeMenu)
    else
        rigUpgradeMenu = generateViewRigMenu(rigData)
        lib.registerContext({
            id = 'view_mining_rig_menu',
            title = 'View Rig',
            options = rigUpgradeMenu
        })
        lib.showContext('view_mining_rig_menu')
    end
end)

RegisterNetEvent('qw-crypto-mining:client:openUpgradeMenu', function(rigData)
    local rigUpgradeMenu = nil
    
    if not Config.UsingOxLib then
        rigUpgradeMenu = generateUpgradeMenu(rigData.data)
        exports['qb-menu']:openMenu(rigUpgradeMenu)
    else
        rigUpgradeMenu = generateUpgradeMenu(rigData)
        lib.registerContext({
            id = 'upgrade_mining_rig_menu',
            title = 'Upgrade Rig',
            options = rigUpgradeMenu
        })
        lib.showContext('upgrade_mining_rig_menu')
    end
end)

RegisterNetEvent('qw-crypto-mining:client:openUpgradeMenuForComponent', function(component, currentUpgrade)
    local rigComponentUpgradeMenu = nil
    
    if not Config.UsingOxLib then
        rigComponentUpgradeMenu = generateComponentUpgradeMenu(component.upgradeName, component.current)
        exports['qb-menu']:openMenu(rigComponentUpgradeMenu)
    else
        rigComponentUpgradeMenu = generateComponentUpgradeMenu(component, currentUpgrade)
        lib.registerContext({
            id = 'upgrade_component_mining_rig_menu',
            title = 'Upgrade Component',
            options = rigComponentUpgradeMenu
        })
        lib.showContext('upgrade_component_mining_rig_menu')
    end
end)