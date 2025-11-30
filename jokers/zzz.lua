SMODS.Joker{ --Shitcot
    key = "zzz",
    config = {
        extra = {
            Negative = -5,
            dollars = 5
        }
    },
    loc_txt = {
        ['name'] = 'Shitcot',
        ['text'] = {
            [1] = '{C:default}Soy una mierda we{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "shit_shitpost",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 8,
        y = 13
    },

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                return {
                    message = "No sirvo nada"
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
                return {
                    dollars = -card.ability.extra.dollars,
                    message = "me prestas algo we "
                }
        end
        if context.selling_self  then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Sybau", colour = G.C.RED})
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if G.STAGE == G.STAGES.RUN then 
                          G.STATE = G.STATES.GAME_OVER
                          G.STATE_COMPLETE = false
                        end
                    end
                }))
                
                return true
            end
                }
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_shit_zzz" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

SMODS.JimboQuip({
    key = 'zzz_win',
    extra = {
        center = 'j_shit_zzz',
        particle_colours = {
		G.C.RED,
		G.C.WHITE,
		G.C.UI.TEXT_DARK        }
    },
    filter = function(self, type)
        if type == 'win' then
            self.extra.text_key = self.key..'_'..math.random(1,2)
            return true, { weight = 100 }
        end
    end
})

SMODS.JimboQuip({
    key = 'zzz_loss',
    extra = {
        center = 'j_shit_zzz',
        particle_colours = {
		G.C.RED,
		G.C.WHITE,
		G.C.UI.TEXT_DARK        }
    },
    filter = function(self, type)
        if type == 'loss' then
            self.extra.text_key = self.key..'_'..math.random(1,2)
            return true, { weight = 100 }
        end
    end
})