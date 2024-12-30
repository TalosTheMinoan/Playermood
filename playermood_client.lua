local moodEmojis = {
    happy = "😊",
    sad = "😢",
    disappointed = "😞",
    neutral = "😐",
    hide = ""
}

local moodColors = {
    happy = {r = 0, g = 255, b = 0},
    sad = {r = 0, g = 0, b = 255},
    disappointed = {r = 255, g = 165, b = 0},
    neutral = {r = 255, g = 255, b = 255},
    hide = {r = 0, g = 0, b = 0}
}

local currentMood = "neutral"

-- Event to update player mood
RegisterNetEvent('playermood:updateMood')
AddEventHandler('playermood:updateMood', function(mood)
    currentMood = mood
end)

-- Event to notify player of cooldown
RegisterNetEvent('playermood:cooldownNotification')
AddEventHandler('playermood:cooldownNotification', function(remainingTime)
    -- Display a notification about the cooldown
    SetNotificationTextEntry("STRING")
    AddTextComponentString("You must wait " .. remainingTime .. " seconds before changing your mood again.")
    DrawNotification(false, true)
end)

-- Thread to display mood above player's head
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if currentMood ~= "hide" then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local x, y, z = table.unpack(playerCoords)
            local emoji = moodEmojis[currentMood] or ""
            local color = moodColors[currentMood] or {r = 255, g = 255, b = 255}
            local text = emoji .. " " .. currentMood

            -- Draw text above player's head
            DrawText3D(x, y, z + 1.0, text, color.r, color.g, color.b)
        end
    end
end)

-- Function to draw 3D text
function DrawText3D(x, y, z, text, r, g, b)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local scale = 0.35

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(r, g, b, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end