ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('dpr_Bank:Depot')
AddEventHandler('dpr_Bank:Depot', function(montant)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if xPlayer.getMoney() >= montant then 
        xPlayer.removeMoney(montant)
        xPlayer.addAccountMoney('bank', montant)
        local xPlayers = ESX.GetPlayers()        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            Citizen.Wait(500)
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Banque', 'Dépôt', "Vous venez de déposer ~g~"..montant.."$ ~s~dans votre banque.", 'CHAR_BANK_MAZE', 1)
        end
    else
        local xPlayers = ESX.GetPlayers()        
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            Citizen.Wait(500)
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Banque', 'Dépôt', "Vous n'avez pas suffisament d'argent", 'CHAR_BANK_MAZE', 1)
        end
    end
end)

RegisterNetEvent('dpr_Bank:Retrait')
AddEventHandler('dpr_Bank:Retrait', function(montant)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if xPlayer.getAccount('bank').money >= montant then 
        xPlayer.removeAccountMoney('bank', montant)
        xPlayer.addMoney(montant)
        local xPlayers = ESX.GetPlayers()        
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            Citizen.Wait(500)
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Banque', 'Retrait', "Vous venez de déposer ~g~"..montant.."$ ~s~dans votre banque.", 'CHAR_BANK_MAZE', 1)
        end
    else
        local xPlayers = ESX.GetPlayers()        
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            Citizen.Wait(500)
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Banque', 'Retrait', "Vous n'avez pas suffisament d'argent", 'CHAR_BANK_MAZE', 1)
        end
    end
end)

RegisterServerEvent("dpr_Bank:Argent") 
AddEventHandler("dpr_Bank:Argent", function(action, amount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local playerMoney = xPlayer.getMoney()

    TriggerClientEvent("dpr_Bank:RefreshArgent", source, playerMoney)
end)

RegisterServerEvent("dpr_Bank:ArgentBank") 
AddEventHandler("dpr_Bank:ArgentBank", function(action, amount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local playerMoneyBank = xPlayer.getBank()

    TriggerClientEvent("dpr_Bank:RefreshArgentBank", source, playerMoneyBank)
end)