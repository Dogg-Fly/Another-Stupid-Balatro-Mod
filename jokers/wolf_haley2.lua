SMODS.Joker{ --Wolf Haley
    key = "wolf_haley2",
    config = {
        extra = {
            Xmult = 2,
            levels = 1,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Wolf Haley',
        ['text'] = {
            [1] = '{X:red,C:white}X2{} Mult, if played hand contain {C:attention}2{} Level up {C:attention}Pair{} 2 levels'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 16
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["shit_tyler"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_shit_samisdead" then
                        return true
                        end
                    end
                    return false
                    end)() then
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_shit_samisdead" and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                    else
                        return {
                            Xmult = card.ability.extra.Xmult
                        }
                    end
                end
                if context.individual and context.cardarea == G.play  then
                    if (function()
                        local rankCount = 0
                        for i, c in ipairs(context.full_hand) do
                            if c:get_id() == 2 then
                                rankCount = rankCount + 1
                            end
                        end
                        
                        return rankCount >= 1
                        end)() then
                            local target_hand = "Pair"
                            return {
                                level_up = card.ability.extra.levels,
                                level_up_hand = target_hand,
                                message = localize('k_level_up_ex')
                            }
                        end
                    end
                end
}