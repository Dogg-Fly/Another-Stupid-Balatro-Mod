SMODS.Joker{ --Shigeo Jokerama
    key = "shigeo_jokerama2",
    config = {
        extra = {
            xmultvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'Shigeo Jokerama',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X1{} Mult',
            [2] = 'when destroy a random {C:tarot}Tarot{} card',
            [3] = '{C:inactive}(Currently {X:red,C:white}X#1#{} {C:inactive}Mult){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmultvar}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmultvar
            }
        end
        if context.after and context.cardarea == G.jokers  then
            if (function()
                local count = 0
                for _, consumable_card in pairs(G.consumeables.cards or {}) do
                    if consumable_card.ability.set == 'Tarot' then
                        count = count + 1
                    end
                end
                return count >= 1
                end)() then
                    return {
                        func = function()
                            local target_cards = {}
                            for i, consumable in ipairs(G.consumeables.cards) do
                                if consumable.ability.set == "Tarot" then
                                    table.insert(target_cards, consumable)
                                end
                            end
                            if #target_cards > 0 then
                                local card_to_destroy = pseudorandom_element(target_cards, pseudoseed('destroy_consumable'))
                                G.E_MANAGER:add_event(Event({
                                func = function()
                                    card_to_destroy:start_dissolve()
                                    return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed Consumable!", colour = G.C.RED})
                            end
                            return true
                            end,
                            extra = {
                            func = function()
                                card.ability.extra.xmultvar = (card.ability.extra.xmultvar) + 1
                                return true
                                end,
                                colour = G.C.GREEN
                            }
                        }
                    end
                end
            end
}