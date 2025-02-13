local VorpCore = {}
TriggerEvent("getCore", function(core)
    VorpCore = core
end)

local PAIEMENT = 4 -- Montant payé toutes les 30 minutes
local INTERVALLE = 1800000 -- 30 minutes en millisecondes (30 * 60 * 1000)

local metiersEligibles = {
    "doctorblackwater",
    "doctorvalentine",
    "BWSheriff",
    "ValSheriff"
}

function table.contains(tbl, element)
    for _, value in pairs(tbl) do
        if value == element then
            return true
        end
    end
    return false
end

local function payerJoueursConnectes()
    for _, playerId in ipairs(GetPlayers()) do 
        local user = VorpCore.getUser(tonumber(playerId))
        
        if user then
            local character = user.getUsedCharacter 
            
            if character then
                local job = character.job 
                
                if job and table.contains(metiersEligibles, job) then
                    local currentMoney = character.money 
                    local newMoney = currentMoney + PAIEMENT 
                    
                    
                    character.setMoney(newMoney) 

                    -- Notification au joueur
                    TriggerClientEvent("vorp:TipBottom", playerId, string.format("Vous avez reçu %d dollars pour votre service en tant que %s.", PAIEMENT, job), 5000)
                end
            end
        end
    end
end

Citizen.CreateThread(function()
    while true do
        payerJoueursConnectes()
        Citizen.Wait(INTERVALLE)
    end
end)
