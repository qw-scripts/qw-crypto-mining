function generateViewRigMenu(data)
    local rigUpgradeData = json.decode(data.rigdata)
    local currentTotalHashRate = 0
    local currentTotalPowerUsage = 0

    for k, v in pairs(rigUpgradeData) do
        currentTotalHashRate = currentTotalHashRate + Config.CryptoUpgrades[k][v].hashRate
        currentTotalPowerUsage = currentTotalPowerUsage + Config.CryptoUpgrades[k][v].powerUsage
    end

    local qbMenu = {
        {
            header = 'Current Hash Rate',
            txt = 'Hash Rate: ' .. currentTotalHashRate * Config.HashRateMultiplier,
            icon = 'fa-solid fa-gear',
            disabled = true
        },
        {
            header = 'Current Power Usage',
            txt = 'Power Usage: ' .. currentTotalPowerUsage * Config.PowerUsageMultiplier,
            icon = 'fa-solid fa-gear',
            disabled = true
        },
    }
    local oxMenu = {
        {
            title = 'Current Hash Rate',
            description = 'Hash Rate: ' .. currentTotalHashRate * Config.HashRateMultiplier,
            icon = 'fa-solid fa-gear',
        },
        {
            title = 'Current Power Usage',
            description = 'Power Usage: ' .. currentTotalPowerUsage * Config.PowerUsageMultiplier,
            icon = 'fa-solid fa-gear',
        },
    }

    for k, v in pairs(rigUpgradeData) do
        if not Config.UsingOxLib then
            qbMenu[#qbMenu + 1] = {
                header = k..': '..Config.CryptoUpgrades[k][v].name,
                txt = 'Hash Rate: ' .. Config.CryptoUpgrades[k][v].hashRate .. ' | Power Usage: ' .. Config.CryptoUpgrades[k][v].powerUsage,
                disabled = true
            }
        else
            oxMenu[#oxMenu + 1] = {
                title = k..': '..Config.CryptoUpgrades[k][v].name,
                description = 'Hash Rate: ' .. Config.CryptoUpgrades[k][v].hashRate .. ' | Power Usage: ' .. Config.CryptoUpgrades[k][v].powerUsage,
            }
        end
    end

    if not Config.UsingOxLib then
        return qbMenu
    else
        return oxMenu
    end
end

function generateUpgradeMenu(data)
    local rigUpgradeData = json.decode(data.rigdata)

    local menu = {}

    for k, v in pairs(rigUpgradeData) do
        if not Config.UsingOxLib then
            menu[#menu + 1] = {
                header = 'Upgrade '..k,
                txt = 'You currently have '..Config.CryptoUpgrades[k][v].name,
                params = {
                    event = 'qw-crypto-mining:client:openUpgradeMenuForComponent', -- event name
                    args = {
                        upgradeName = k,
                        current = v
                    }
                }
            }
        else
            menu[#menu + 1] = {
                title = 'Upgrade '..k,
                description = 'You currently have '..Config.CryptoUpgrades[k][v].name,
                onSelect = function()
                    lib.hideContext()
                    TriggerEvent('qw-crypto-mining:client:openUpgradeMenuForComponent', k, v)
                end,
                arrow = true,
            }
        end
    end

    return menu
end

function generateComponentUpgradeMenu(component, currentUpgrade)
    local componentToUpgrade = Config.CryptoUpgrades[component]
    local menu = {}

    for k, v in pairs(componentToUpgrade) do
        if k == 1 then goto continue end
        if not Config.UsingOxLib then
            menu[#menu + 1] = {
                header = v.name,
                txt = 'Hash Rate: ' .. v.hashRate .. ' | Power Usage: ' .. v.powerUsage,
                disabled = k == currentUpgrade,
                params = {
                    isServer = true,
                    event = 'qw-crypto-mining:server:upgradeComponent', -- event name
                    args = {
                        choosenComponent = component,
                        choosenIndex = k
                    }
                }
            }
        else
            menu[#menu + 1] = {
                title = v.name,
                description = 'Hash Rate: ' .. v.hashRate .. ' | Power Usage: ' .. v.powerUsage,
                disabled = k == currentUpgrade,
                onSelect = function()
                    lib.hideContext()
                    TriggerServerEvent('qw-crypto-mining:server:upgradeComponent', component, k)
                end,
            }
        end ::continue::
    end

    return menu
end
