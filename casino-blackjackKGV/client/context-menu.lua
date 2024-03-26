RegisterNetEvent('casino:context:hit&stand', function()
    exports['qb-menu']:openMenu({
        {
            header = "Diamond Casino Blackjack",
            isMenuHeader = true,
        },
        {
            header = "ヒット",
            txt = "もう1枚カードを引く",
            params = {
                event = "doj:client:blackjackMenu",
                args = 1
            }
        },
        {
            header = "スタンド",
            txt = "確定する",
            params = {
                event = "doj:client:blackjackMenu",
                args = 2
            }
        },
    })
end)

RegisterNetEvent('casino:context:hit&doubledown', function()
    exports['qb-menu']:openMenu({
        {
            header = "Diamond Casino Blackjack",
            isMenuHeader = true,
        },
        {
            header = "ヒット",
            txt = "もう1枚カードを引く",
            params = {
                event = "doj:client:blackjackMenu",
                args = 1
            }
        },
        {
            header = "スタンド",
            txt = "確定する",
            params = {
                event = "doj:client:blackjackMenu",
                args = 2
            }
        },
        {
            header = "ダブルダウン",
            txt = "初回のベットを倍にする",
            params = {
                event = "doj:client:blackjackMenu",
                args = 3
            }
        },
    })
end)

RegisterNetEvent('casino:context:hit&split', function()
    exports['qb-menu']:openMenu({
        {
            header = "Diamond Casino Blackjack",
            isMenuHeader = true,
        },
        {
            header = "ヒット",
            txt = "もう1枚カードを引く",
            params = {
                event = "doj:client:blackjackMenu",
                args = 1
            }
        },
        {
            header = "スタンド",
            txt = "確定する",
            params = {
                event = "doj:client:blackjackMenu",
                args = 2
            }
        },
        {
            header = "スプリット",
            txt = "分割する",
            params = {
                event = "doj:client:blackjackMenu",
                args = 4
            }
        },
    })
end)
