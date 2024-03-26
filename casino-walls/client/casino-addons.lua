local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-casino:client:openCasinoShop', function()
    local ShopItems = {}
    ShopItems.label = "The Diamond Casino & Resort ショップ"
    ShopItems.items = Config.CasinoShop
    ShopItems.slots = #Config.CasinoShop 
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_", ShopItems)
end)

RegisterNetEvent('doj:casinoChipMenu', function()
    TriggerEvent('drawtextui:HideUI')
    exports['qb-menu']:openMenu({
        {
            header = "The Diamond Casino & Resort チップ換金",
            isMenuHeader = true,
        },
        {
            header = "カジノチップを全て売る", 
            txt = "相場: チップあたり$"..Config.casinoChipPrice.."",
            params = {
                
                event = "qb-casino:server:GoldSell",
                isServer = true,
            }
        },
        {
            header = "< 戻る",
			txt = "",
			params = {
                event = "doj:casinoMainMenu"
            }
        },
    })
end)

CreateThread(function()
    local CasinoShop = CircleZone:Create(vector3(948.591, 34.207, 71.839), 2.0, {
        name="カジノショップ",
        heading=160,
        debugPoly=false,
        useZ=true,
    })
    CasinoShop:onPlayerInOut(function(isPointInside)
        if isPointInside then
            text = '<b>The Diamond Casino & Resort</b></p>レジ'
            exports['qb-core']:DrawText(text)
            exports['qb-target']:AddTargetModel(`U_F_M_CasinoCash_01`, {
                options = {
                    { 
                        event = "doj:casinoMainMenu",
                        icon = "fab fa-speakap",
                        label = "カジノ従業員と話す", 
                    },
                },
                distance = 3.0 
            })
        else
            exports['qb-menu']:closeMenu()
            exports["qb-core"]:HideText()
        end
    end)
end)


CreateThread(function()
    local CasinoMembership = CircleZone:Create(vector3(920.726, 45.883, 71.073), 5.0, {
        name="カジノメンバーシップ",
        heading=160,
        debugPoly=false,
        useZ=true,
    })
    CasinoMembership:onPlayerInOut(function(isPointInside)
        if isPointInside then
            text = '<b>The Diamond Casino & Resort</b></p>フロントカウンター'
            exports['qb-core']:DrawText(text)
            exports['qb-target']:AddTargetModel(`u_f_m_casinoshop_01`, {
                options = {
                    { 
                        event = "doj:casinoMembershipMenu",
                        icon = "fab fa-speakap",
                        label = "カジノ従業員と話す", 
                    },
                },
                distance = 3.0 
            })
        else
            exports['qb-menu']:closeMenu()
            exports["qb-core"]:HideText()
        end
    end)
end)



RegisterNetEvent('doj:casinoMainMenu', function()
    QBCore.Functions.TriggerCallback('doj:server:HasCasinoMembership', function(HasItem)
        if HasItem then  
            -- exports["qb-core"]:HideText()
            exports['qb-menu']:openMenu({
                {
                    header = "The Diamond Casino & Resort", 
                    isMenuHeader = true,
                },
                {
                    header = "チップ換金", 
                    txt = "現在の価格を見る",
                    params = {
                        event = "doj:casinoChipMenu",
                    }
                },
                {
                    header = "ショップを見る", 
                    txt = "商品を見る",
                    params = {
                        event = "qb-casino:client:openCasinoShop",
                    }
                },
                {
                    header = "キャンセル",
                    txt = "",
                    params = {
                        event = ""
                    }
                },
            })
        else
            text = '<b>The Diamond Casino & Resort</p>フロントデスクまでお越しください</b>'
            exports['qb-core']:DrawText(text)
        end
    end)
end)


RegisterNetEvent('doj:casinoMembershipMenu', function()
    -- exports["qb-core"]:HideText() 
    exports['qb-menu']:openMenu({
        {
            header = "The Diamond Casino & Resort", 
            isMenuHeader = true,
        },
        {
            header = "Casino Membershipを購入する", 
            txt = "価格: $"..Config.casinoMemberPrice,
            params = {
                isServer = true,
                event = "doj:server:purchaseMembership",
            }
        },
        {
            header = "V.I.P Membershipを購入する", 
            txt = "価格: $"..Config.casinoVIPPrice,
            params = {
                isServer = true,
                event = "doj:server:purchaseVIPMembership",
            }
        },
        {
            header = "キャンセル",
            txt = "",
            params = {
                event = ""
            }
        },
    })
end) 
