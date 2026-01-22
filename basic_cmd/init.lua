print("Basic Commands Plugin Loaded!")

local utils = require(... .. "utils")

wrapper:register(
    "\\[.*\\]: <(.*?)> !hello",
    function(line, player)
        print("Received hello command from " .. player)
        
        local msg = utils.get_welcome_msg(player)
        
        return {
            "tellraw " .. player .. " {\"text\":\"" .. msg .. "\",\"color\":\"green\"}",
            "playsound entity.experience_orb.pickup master " .. player
        }
    end
)