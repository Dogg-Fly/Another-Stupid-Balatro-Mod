SMODS.Joker{ --Joker File Explorer
    key = "joker_file_explorer2",
    config = {
        extra = {
            odds = 4,
            dollars = 1
        }
    },
    loc_txt = {
        ['name'] = 'Joker File Explorer',
        ['text'] = {
            [1] = 'Each {C:orange}Ace{} held in hand has a {C:green}#1# in #2#{} chance to give {C:money}$1{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_shit_joker_file_explorer2') 
        return {vars = {new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round  then
        if context.other_card:get_id() == 14 then
            if SMODS.pseudorandom_probability(card, 'group_0_a0dff415', 1, card.ability.extra.odds, 'j_shit_joker_file_explorer2', false) then
                    SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                end
            end
        end
    end
}