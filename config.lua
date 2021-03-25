FXCore = nil 
Config = {

AlwaysDisplayRadar = true, -- Radar will be turned off when not in a vehicle

--Forth Pill function
DisplayId = true, -- Forth pill displays users id
DisplayStress = false, -- Forth pill displays users stress (You need to get the stress value yourself in the script)
DisplayVoice = true, -- Forth pill will display voice range and when speaking (TokoVOIP or Mumble)


StatusUpdateInterval = 1000, -- Time it takes for status to update (lowering this value adds ms)
VitalsUpdateInterval = 500, -- Time it takes for vitals to update (lowering this value adds ms)

MapZoom = 0.24, -- The zoom of the map (Lower the value more zoomed out it will be)

-- Choose icons from FontAwsome (https://fontawesome.com/) 
HealthIcon = "fa-heartbeat",
ArmorIcon = "fa-shield-alt",
FoodIcon = "fa-hamburger",
ThirstIcon = "fa-tint",
FourthIcon = "", -- Left blank because default function is displaying id (if you use stress or voice add any icon you like)


}
Citizen.CreateThread(function()
while not FXCore do 
TriggerEvent("FXCore:GetObject",function(obj) FXCore = obj  end)
end
end)

-- Return your hunger, thirst, stress. This uses esx_status and stress is left at 0 because it isn't used by default
function GetStatus(cb)
--local player = FXCore.Functions.GetPlayerData()
FXCore.Functions.GetPlayerData(function(PlayerData)
    if PlayerData then
        local hunger = PlayerData.metadata["hunger"]
        local thirst = PlayerData.metadata["thirst"]
        local stress = PlayerData.metadata["stress"]
        cb({hunger, thirst, stress})
    end
end)
                           
                      --  end)
               -- end)

end

