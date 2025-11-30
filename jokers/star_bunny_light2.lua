SMODS.Joker{ --Star Bunny Light
    key = "star_bunny_light2",
    config = {
        extra = {
            Increment = 2,
            perma_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Star Bunny Light',
        ['text'] = {
            [1] = 'if the card played is of the suit {C:hearts}hearts{}, add {C:red}+2{} Permanent Mult,',
            [2] = 'this will be increased every time a blind ends'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 14
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

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (function()
                local suitFound = false
                for i, c in ipairs(context.scoring_hand) do
                    if c:is_suit("Hearts") then
                        suitFound = true
                        break
                    end
                end
                
                return suitFound
                end)() then
                    context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                    context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.Increment
                    return {
                        extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                    }
                end
            end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.Increment = (card.ability.extra.Increment) + 2
                    return true
                    end
                }
            end
        end
}