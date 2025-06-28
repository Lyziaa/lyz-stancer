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


-- local veh = ''

-- lib.registerMenu({
--     id = 'some_menu_id',
--     title = 'Lyz-Stancer',
--     position = 'top-right',
--     onSideScroll = function(selected, scrollIndex, args)
--         local values = {'-0.55', '-0.6', '-0.65', '-0.7', '-0.75', '-0.8', '-0.85', '-0.9', '-0.95', '-1'}
--         local selectedValue = values[scrollIndex] -- Seçili değeri al
--         print("Seçilen Değer:", selectedValue)
        
--         local veh = getveh()
--         SetWheelOffsetFront(veh, 1 , selectedValue) -- Seçili değeri ön tekerlere uygula
--     end,
--     options = {
--         {label = 'Ön Tekerler Yerleştirmesi', values = {'-0.55', '-0.6', '-0.65', '-0.7', '-0.75', '-0.8', '-0.85', '-0.9', '-0.95', '-1'}, defaultIndex = 5},
--     }
-- })

-- -------------------------------------------------------------------------------------------------------------------------------------------

-- function getveh()
-- 	local v = GetVehiclePedIsIn(PlayerPedId(), false)
-- 	lastveh = GetVehiclePedIsIn(PlayerPedId(), true)
-- 	local dis = -1
-- 	if v == 0 then
-- 		if #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(lastveh)) < 5 then
-- 			v = lastveh
-- 		end
-- 		dis = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(lastveh))
-- 	end
-- 	if dis > 3 then
-- 		v = 0
-- 	end
-- 	if v == 0 then
-- 		local count = 5
-- 		v = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 5.000, 0, 70)
-- 		while #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(v)) > 5 and count >= 0 do
-- 			v = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 5.000, 0, 70)
-- 			count = count - 1
-- 			Wait(400)
-- 		end
-- 	end
-- 	return tonumber(v)
-- end

-- function SetWheelOffsetFront(vehicle, val)
-- 	SetVehicleWheelXOffset(vehicle,1,val)
-- end

-- exports('SetWheelOffsetFront', function(vehicle, val)
-- 	return SetWheelOffsetFront(vehicle, val)
-- end)
 
-- RegisterCommand('testmenu', function()
--     lib.showMenu('some_menu_id')
-- end)