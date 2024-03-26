local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    local TeleportUpZone = CircleZone:Create(vector3(930.251, 34.324, 81.089), 1.5, {
        name = "下にテレポート",
        heading = 328.0,
        debugPoly = false,
        useZ = true,
    })
    TeleportUpZone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            -- exports['qb-core']:DrawText('<b>The Diamond Casino & Resort</p>Elevators</b>')
            QBCore.Functions.TriggerCallback('doj:server:HasCasinoMembership', function(HasItem)
                if HasItem then
                    TriggerEvent("doj:casinoTeleportUp")
                else
                    exports['qb-core']:DrawText('<b>The Diamond Casino & Resort</p>会員ではありません</p></b>フロントデスクまでお越しください</b>')
                end
            end)
        else
            exports['qb-menu']:closeMenu()
            exports["qb-core"]:HideText()
        end
    end)
end)

CreateThread(function()
    local TeleportDownZone = CircleZone:Create(vector3(964.737, 58.743, 112.553), 1.5, {
        name = "下にテレポート",
        heading = 328.0,
        debugPoly = false,
        useZ = true,
    })
    TeleportDownZone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            TriggerEvent("doj:casinoTeleportDown")
        else
            exports['qb-menu']:closeMenu()
        end
    end)
end)

RegisterNetEvent('doj:casinoTeleports', function(args)
    local args = tonumber(args)
    local ped = PlayerPedId()
    if args == 1 then
        SetEntityCoords(ped, 965.0619, 58.51287, 112.553, false, false, false, true)
    else
        SetEntityCoords(ped, 930.0716, 33.86854, 81.09772, false, false, false, true)
    end
end)

RegisterNetEvent('doj:casinoTeleportUp', function()
    exports['qb-menu']:showHeader({
        {
            header = "The Diamond Casino & Resort エレベーター",
            isMenuHeader = true,
        },
        {
            header = "上に行く",
            txt = "屋上",
            params = {
                event = "doj:casinoTeleports",
                args = 1,
            }
        },
        {
            header = "戻る",
            txt = "",
            params = {
                event = "doj:casinoTeleportUp"
            }
        },
    })
end)

RegisterNetEvent('doj:casinoTeleportDown', function()
    exports['qb-menu']:showHeader({
        {
            header = "The Diamond Casino & Resort エレベーター",
            isMenuHeader = true,
        },
        {
            header = "下に行く",
            txt = "メインロビー",
            params = {
                event = "doj:casinoTeleports",
                args = 2,
            }
        },
        {
            header = "戻る",
            txt = "",
            params = {
                event = "doj:casinoTeleportDown"
            }
        },
    })
end)
