SMODS.Joker{ --Melted Blob
    key = "melted_blob2",
    config = {
        extra = {
            chips = 1,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Melted Blob',
        ['text'] = {
            [1] = '{C:blue}+1{} Chips',
            [2] = '{C:inactive}Blob are you okay?{}',
            [3] = ''
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "shit_blob",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    chips = card.ability.extra.chips
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_4512b075', 1, card.ability.extra.odds, 'j_shit_melted_blob2', false) then
                                SMODS.calculate_effect({func = function()
                                    card:undefined()
                                    return true
                                    end}, card)
                                end
                                return true
                                end
                            }
                        end
                    end
                end
}