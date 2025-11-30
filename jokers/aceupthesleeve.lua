SMODS.Joker{ --Ace up the Sleeve
    key = "aceupthesleeve",
    config = {
        extra = {
            Xmult = 2,
            isfirst = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ace up the Sleeve',
        ['text'] = {
            [1] = 'First played {C:orange}Ace{} gives {X:red,C:white}X2{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14 and (card.ability.extra.isfirst or 0) == 1) then
                card.ability.extra.isfirst = 0
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.isfirst = 1
        end
    end
}