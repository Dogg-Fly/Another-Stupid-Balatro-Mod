SMODS.Joker{ --Abbie
    key = "abbie",
    config = {
        extra = {
            xchips = 3
        }
    },
    loc_txt = {
        ['name'] = 'Abbie',
        ['text'] = {
            [1] = 'If the hand played is {C:hearts}hearts{}, {X:blue,C:white}X3{} Chips'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 1
    },
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
                    return {
                        x_chips = card.ability.extra.xchips
                    }
                end
            end
        end
}