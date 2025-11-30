-- Mayor parte del codigo este de abajo viene de cryptid con algunos cambios por que ami no me funcionaba

local member_fallback = 600
local succ, https = pcall(require, "SMODS.https")
local last_update_time = 1
local initial = true
anotherstupidbalatromod = anotherstupidbalatromod or {}
anotherstupidbalatromod.member_count = member_fallback
if not succ then
    sendErrorMessage("HTTP module could not be loaded. " .. tostring(https), "anotherstupidbalatromod")
end

local function apply_discord_member_count(code, body, headers)
    print("apply_discord_member_count called", code, body)
    if body and code == 200 then
        local count = string.match(body, '"approximate_member_count"%s*:%s*(%d+)')
        print("Discord member count found:", count)
        if count then
            anotherstupidbalatromod.member_count = tonumber(count)
            print("Member count updated to:", anotherstupidbalatromod.member_count)
            
            if G and G.jokers and G.jokers.cards then
                for i = 1, #G.jokers.cards do
                    local card = G.jokers.cards[i]
                    if card.config and card.config.center and card.config.center.key == "j_dontforgetj" then
                        if card.ability and card.ability.extra then
                            card.ability.extra.Xmult = anotherstupidbalatromod.member_count
                            print("Updated joker Xmult to:", card.ability.extra.Xmult)
                        end
                    end
                end
            end
        end
    else
        print("Failed to get Discord data. Code:", code)
    end
end

function anotherstupidbalatromod.update_member_count()
    if https and https.asyncRequest then
        if (os.time() - last_update_time >= 60) or initial then
            initial = false
            last_update_time = os.time()
            print("Requesting Discord member count...")
            https.asyncRequest(
                "https://discord.com/api/v10/invites/ngqmdCHNUy?with_counts=true" .. "&v=" .. tostring(os.time()),
                apply_discord_member_count
            )
        end
    else
        print("HTTPS module not available")
    end
end
