SMODS.Joker{ --Purple Card
    key = "purple_card2",
    config = {
        extra = {
            multvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'Purple Card',
        ['text'] = {
            [1] = 'This Joker gains {X:legendary,C:white}^0.1{} Mult when any {C:orange}Booster Pack{} is skipped',
            [2] = '{C:inactive}(Currently {X:legendary,C:white}^#1#{} {C:inactive}Mult){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multvar}}
    end,

    
    calculate = function(self, card, context)
        if context.skipping_booster  then
            return {
                func = function()
                    card.ability.extra.multvar = (card.ability.extra.multvar) + 4
                    return true
                    end
                }
            end
            if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.multvar
                }
            end
        end
}