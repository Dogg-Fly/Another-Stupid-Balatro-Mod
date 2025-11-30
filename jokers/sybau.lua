SMODS.Joker{ --Sybau
    key = "sybau",
    config = {
        extra = {
            negative = -100,
            repetitions = 100,
            explode = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sybau',
        ['text'] = {
            [1] = 'Sybau'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = "shit_destructive",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  then
        if true then
            return {
                func = function()
                    card:explode()
                    return true
                    end,
                    message = "sybau"
                    ,
                    func = function()
                        for i = 1, card.ability.extra.repetitions do
                                SMODS.calculate_effect({func = function()
                                    local destructable_jokers = {}
                                    for i, joker in ipairs(G.jokers.cards) do
                                        if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                            table.insert(destructable_jokers, joker)
                                        end
                                    end
                                    local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                                    
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
                                    return true
                                    end}, card)
                                end
                                return true
                                end
                            }
                        end
                    end
                end
}