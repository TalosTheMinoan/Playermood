-- Define a table to store player moods and cooldowns
local playerMoods = {}
local moodCooldowns = {}
local COOLDOWN_TIME = 60 -- Cooldown time in seconds

-- Function to set player mood
function setPlayerMood(playerId, mood)
    playerMoods[playerId] = mood
    -- Trigger an event to update the player's mood in the game
    TriggerClientEvent('playermood:updateMood', playerId, mood)
end

-- Command to set mood
RegisterCommand('setmood', function(source, args, rawCommand)
    local mood = args[1]
    local currentTime = os.time()

    if mood and (mood == "happy" or mood == "sad" or mood == "disappointed" or mood == "neutral" or mood == "hide") then
        if not moodCooldowns[source] or (currentTime - moodCooldowns[source]) >= COOLDOWN_TIME then
            setPlayerMood(source, mood)
            moodCooldowns[source] = currentTime
            print("Player " .. source .. " mood set to " .. mood)
        else
            local remainingTime = COOLDOWN_TIME - (currentTime - moodCooldowns[source])
            print("You must wait " .. remainingTime .. " seconds before changing your mood again.")
            TriggerClientEvent('playermood:cooldownNotification', source, remainingTime)
        end
    else
        print("Usage: /setmood [happy/sad/disappointed/neutral/hide]")
    end
end, false)

-- Event to get player mood
RegisterNetEvent('playermood:getMood')
AddEventHandler('playermood:getMood', function()
    local playerId = source
    local mood = playerMoods[playerId] or "neutral"
    TriggerClientEvent('playermood:receiveMood', playerId, mood)
end)