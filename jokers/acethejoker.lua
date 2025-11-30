SMODS.Joker{ --Ace, The Joker
    key = "acethejoker",
    config = {
        extra = {
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ace, The Joker',
        ['text'] = {
            [1] = 'if scored card is {C:attention}Glass{} destroy them and create a {C:dark_edition}Negative{} {C:tarot}The Lovers {}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["shit_tyler"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_glass"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_glass\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["e_negative"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_negative\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["c_lovers"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_lovers\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_glass"] == true then
                context.other_card.should_destroy = true
                for i = 1, 1 do
                    G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        end
                        
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Tarot', edition = 'e_negative', key = 'c_lovers'})                            
                        card:juice_up(0.3, 0.5)
                        return true
                        end
                    }))
                end
                delay(0.6)
                return {
                    message = created_consumable and localize('k_plus_tarot') or nil,
                    extra = {
                    message = "Destroyed!",
                    colour = G.C.RED
                }
            }
        end
    end
end
}