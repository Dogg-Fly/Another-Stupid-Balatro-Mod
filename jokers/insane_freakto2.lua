SMODS.Joker{ --Insane Freakto
    key = "insane_freakto2",
    config = {
        extra = {
            play_size = 5,
            play_size2 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Insane Freakto',
        ['text'] = {
            [1] = '{C:attention}+5{} Play size'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "shit_shitpost",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.play_size).." Play Size", colour = G.C.BLUE})
                    SMODS.change_play_limit(card.ability.extra.play_size)
                    return true
                    end
                }
            end
            if context.selling_self  then
                return {
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.play_size2).." Play Size", colour = G.C.RED})
                        SMODS.change_play_limit(-card.ability.extra.play_size2)
                        return true
                        end
                    }
                end
            end
}