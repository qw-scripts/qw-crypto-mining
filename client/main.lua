local QBCore = exports['qb-core']:GetCoreObject()


function createMenuZone()
    local menuZoneName = 'crypto_mining_menu_zone'
    
    if not Config.UsingOxTarget then
        exports['qb-target']:AddBoxZone(menuZoneName, Config.MenuLocation, 1.0, 1.0, {
            name = menuZoneName,
            debugPoly = Config.Debug,
            heading = Config.MenuHeading,
            minZ = Config.MenuMinZ,
            maxZ = Config.MenuMaxZ
        }, {
            options = {
                {
                    type = "client",
                    event = 'qw-crypto-mining:client:openMenu',
                    icon = "fas fa-server",
                    label = "Crypto Mining"
                }
            },
            distance = 2.0
        })
    else
        exports.ox_target:addBoxZone({
            coords = Config.MenuLocation,
            size = Config.OxBoxSize,
            rotation = Config.OxBoxRotation,
            debug = Config.Debug,
            options = {
                {
                    name = 'crypto_mining_menu_zone',
                    event = 'qw-crypto-mining:client:openMenu',
                    icon = 'fa-solid fa-server',
                    label = 'Crypto Mining',
                    canInteract = function(entity, distance, coords, name)
                        return true
                    end
                }
            }
        })
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    createMenuZone()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        createMenuZone()
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if Config.UsingOxTarget then
            exports.ox_target:removeZone('crypto_mining_menu_zone')
        else
            exports['qb-target']:RemoveZone('crypto_mining_menu_zone')
        end
    end
end)