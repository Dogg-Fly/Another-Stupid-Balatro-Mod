SMODS.Joker{ --Jackpot
    key = "jackpot2",
    config = {
        extra = {
            odds = 7,
            Xmult = 7
        }
    },
    loc_txt = {
        ['name'] = 'Jackpot',
        ['text'] = {
            [1] = '{C:green}#1# in #2# chance{} to get {X:red,C:white}X7{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 8
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

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_shit_jackpot2') 
        return {vars = {new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_72daead8', 1, card.ability.extra.odds, 'j_shit_jackpot2', false) then
                        SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                    end
                end
            end
        end
}