SMODS.Joker{ --Tyler, The Joker
    key = "tylerthejoker",
    config = {
        extra = {
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Tyler, The Joker',
        ['text'] = {
            [1] = 'When boss blind is defeat create a {C:spectral}Familiar {}',
            [2] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["shit_tyler"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_familiar"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_familiar\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
    if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
        return {
            func = function()
                
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Spectral', key = 'c_familiar'})                            
                        card:juice_up(0.3, 0.5)
                        return true
                        end
                    }))
                end
                delay(0.6)
                
                if created_consumable then
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "TAMALE EH TAMALE EHH", colour = G.C.SECONDARY_SET.Spectral})
                end
                return true
                end
            }
        end
    end
}