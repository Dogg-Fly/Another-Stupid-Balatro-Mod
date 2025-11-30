SMODS.Joker{ --Job Application
    key = "job_application2",
    config = {
        extra = {
            dolarvar = 0,
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Job Application',
        ['text'] = {
            [1] = '{C:inactive}The biggest human fear...',
            [2] = '',
            [3] = 'A JOB{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over and context.main_eval  then
        return {
            saved = true,
            message = localize('k_saved_ex')
        }
    end
if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
    if true then
        if SMODS.pseudorandom_probability(card, 'group_0_dbf7fc2c', 1, card.ability.extra.odds, 'j_shit_job_application2', false) then
                SMODS.calculate_effect({func = function()
                    card:undefined()
                    return true
                    end}, card)
                end
            end
        end
    end
}