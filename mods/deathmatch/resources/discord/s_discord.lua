-- The below function will handle if the resource is restarted while players are on the server... let's sort out a few things...
local appKey = get("application_id")

function startUp()
    for _, player in ipairs(getElementsByType("player")) do 
       triggerClientEvent(player, "discord:connectRPC", player, appKey)
    end
end

-- we add a delay here so that the client resource loads in.
function delayStartup() 
    setTimer(startUp, 2000, 1)
end
addEventHandler("onResourceStart", root, delayStartup)

-- sends the application key to the player on join.
function playerJoin()
    triggerClientEvent(source, "discord:connectRPC", source, appKey)
end
addEventHandler("onPlayerJoin", root, playerJoin)