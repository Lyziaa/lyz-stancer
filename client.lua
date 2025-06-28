local durum = false

if Config.iscommand then 
    RegisterCommand(Config.Command, function()
        lowerSusp()
    end)
end

RegisterNetEvent('lyz-stancer:SetAirSusp', function()
    lowerSusp()
end)

function lowerSusp()
    local ped = PlayerPedId()
    local playerCoords = GetEntityCoords(ped)
    local veh = GetVehiclePedIsIn(ped) 
    local useclosest = Config.CloseWork
    if useclosest and veh == 0 then
        if durum == false then
            SetReduceDriftVehicleSuspension(lib.getClosestVehicle(playerCoords, 2.5), true)
            durum = true
        else
            SetReduceDriftVehicleSuspension(lib.getClosestVehicle(playerCoords, 2.5), false)
            durum = false
        end
    else
        if  durum == false then
            SetReduceDriftVehicleSuspension(veh, true)
            durum = true
        else
            SetReduceDriftVehicleSuspension(veh, false)
            durum = false
        end
    end
end
