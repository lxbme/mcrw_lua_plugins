local wrapper = Server:get_context(...)
wrapper:log("Basic Commands Plugin Loaded!")

local utils = require(... .. "utils")

local config = wrapper:load_config({
    color = "green",
    enable_hello = true
})

if config.enable_hello then
    wrapper:register(
        "\\[.*\\]: <(.*?)> !hello",
        function(line, player)
            wrapper:log("Received hello command from " .. player)
            
            local msg = utils.get_welcome_msg(player)
            
            return {
                "tellraw " .. player .. " {\"text\":\"" .. msg .. "\",\"color\":\"" .. config.color ..  "\"}",
                "playsound entity.experience_orb.pickup master " .. player
            }
        end
    )
end