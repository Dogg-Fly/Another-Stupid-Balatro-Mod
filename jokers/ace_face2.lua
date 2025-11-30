SMODS.Joker{ --Ace face?
    key = "ace_face2",
    config = {
        extra = {
            chips = 30
        }
    },
    loc_txt = {
        ['name'] = 'Ace face?',
        ['text'] = {
            [1] = 'Played {C:orange}Ace{} give {C:chips}+30{} Chips when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 14 then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}