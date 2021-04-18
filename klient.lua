-- vRP Proxy 
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_scoreboard")


RegisterNetEvent('getPlayers:done')
AddEventHandler('getPlayers:done', function(playerCount)
    print(playerCount)
    SendNUIMessage({action = "setPlayerId", id = vRP.getUserId(player)})
    SendNUIMessage({action = "setPlayerCount", count = playerCount})
end)


Citizen.CreateThread(function()
    while true do
        SendNUIMessage({action = "setPlayerCount", count = #GetActivePlayers()}) 
    Wait(600)
    end
end)
Citizen.CreateThread(function()
    while true do
        SendNUIMessage({action = "setPlayerId", id = vRP.getUserId(player)}) 
    Wait(6000)
    end
end)