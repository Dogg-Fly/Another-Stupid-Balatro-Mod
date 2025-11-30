SMODS.Joker{ --Balatron
    key = "balatron2",
    config = {
        extra = {
            emult = 15.09
        }
    },
    loc_txt = {
        ['name'] = 'Balatron',
        ['text'] = {
            [1] = '{X:edition,C:white}^0.1{} Mult for each time \"Balatro\" is said on the',
            [2] = '{C:attention}Balatro Discord Server {}',
            [3] = '{C:legendary}discord.gg/balatro{}',
            [4] = '{C:inactive}(Currently {X:edition,C:white}^15.09',
            [5] = '{} {C:inactive}Mult){}{}',
            [6] = '{C:inactive}(Updates Manualy){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 1
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
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_mult = card.ability.extra.emult
            }
        end
    end
}