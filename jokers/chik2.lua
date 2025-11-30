SMODS.Joker{ --Chik
    key = "chik2",
    config = {
        extra = {
            dollars = 5
        }
    },
    loc_txt = {
        ['name'] = 'Chik',
        ['text'] = {
            [1] = 'Disables effect of every {C:attention}Boss Blind{}, {C:red}-$5{} when boss is defeat'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 2
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
    soul_pos = {
        x = 9,
        y = 2
    },

    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            if G.GAME.blind.boss then
                return {
                    func = function()
                        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.blind:disable()
                                play_sound('timpani')
                                return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
                        end
                        return true
                        end
                    }
                end
            end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                dollars = -card.ability.extra.dollars
            }
        end
    end
}