--
-- Created by IntelliJ IDEA.
-- User: Sling
-- Date: 19-02-2019
-- Time: 03:49
-- Made for CiviliansNetwork
--

AddEventHandler('onResourceStart', function(name)
    if name:lower() == GetCurrentResourceName():lower() then
        local server = GetConvar("servernumber", 0)
        if server == "1" or server == "2" or server == "3" or server == "4" then
          sendToDiscord("Server meddelelse","**Server "..server.." er hermed oppe!**\nDirekte: `connect 54.36.127.174:"..(30119+tonumber(server)).."`\n@here","https://autisthook.com/api/webhooks/599338815013912577/q4nW6pO2UP7NqdirhdMyi3ohDh6Ajz2yY-NBfQNLbUuCYsCkYxQtaPnjeH2yq7l5ljqa")
        end
    end
end)
function sendToDiscord(name, message, discord)
    if message == nil or message == '' or message:sub(1, 1) == '/' then return FALSE end
    PerformHttpRequest(discord, function(err, text, headers) end, 'POST', json.encode({avatar_url = "https://i.imgur.com/HUgauWf.png",username = name,content = message}), { ['Content-Type'] = 'application/json' })
end
