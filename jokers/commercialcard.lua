SMODS.Joker{ --Commercial Card
    key = "commercialcard",
    config = {
        extra = {
            odds = 2,
            dollars = 3
        }
    },
    loc_txt = {
        ['name'] = 'Commercial Card',
        ['text'] = {
            [1] = 'Played {C:orange}Ace{} have a {C:green}#1# in #2#{} chance to give {C:money}$3{} when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 3
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

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_shit_commercialcard') 
        return {vars = {new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 14 then
                if SMODS.pseudorandom_probability(card, 'group_0_cf55415d', 1, card.ability.extra.odds, 'j_shit_commercialcard', false) then
                        SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                    end
                end
            end
        end
}