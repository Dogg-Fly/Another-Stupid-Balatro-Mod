SMODS.Joker{ --Aro-Ace
    key = "aroace2",
    config = {
        extra = {
            mult = 1000
        }
    },
    loc_txt = {
        ['name'] = 'Aro-Ace',
        ['text'] = {
            [1] = '{C:red}+1000{} Mult if{C:purple} played hand{} contain {C:purple}Ace{} and NO {C:purple}pair{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 0
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

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (not (next(context.poker_hands["Pair"])) and (function()
                local rankCount = 0
                for i, c in ipairs(context.full_hand) do
                    if c:get_id() == 14 then
                        rankCount = rankCount + 1
                    end
                end
                
                return rankCount <= 1 and rankCount > 0
                end)()) then
                    return {
                        mult = card.ability.extra.mult
                    }
                end
            end
        end
}