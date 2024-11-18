-- Update function.
function updateRPC()
    if isDiscordRichPresenceConnected() then 
        local name = getPlayerName(localPlayer)
        
        local currentPlayers = getElementsByType("player")
        local maxPlayers = getElementData(root, "server:Slots") or 1024

        if getElementData(localPlayer, "loggedin") == 0 then
            setDiscordRichPresenceDetails("Logging into OwlGaming...")
        else
            setDiscordRichPresenceDetails("Playing as: "..name:gsub("_", " "))
        end

        setDiscordRichPresenceState("Currently " .. #currentPlayers .. "/" .. maxPlayers  .. " playing!")
    end
end
addEvent("discord:updateRPC", true)
addEventHandler("discord:updateRPC", root, updateRPC)

function connectRPC(appId)
    -- reset
    resetDiscordRichPresenceData()

    -- set discord ApplicationID
    setDiscordApplicationID(appId)

    -- force an update.
    updateRPC()
end
addEvent("discord:connectRPC", true)
addEventHandler("discord:connectRPC", root, connectRPC)

-- prevents the rich presence bugging.
addEventHandler("onClientResourceStop", resourceRoot, function()
    resetDiscordRichPresenceData()
end)