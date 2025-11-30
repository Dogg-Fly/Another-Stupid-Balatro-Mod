SMODS.Joker{ --Hyper Jimbo
    key = "hyperjimbo",
    config = {
        extra = {
            hypermult_n = 3,
            hypermult_arrows = 3
        }
    },
    loc_txt = {
        ['name'] = 'Hyper Jimbo',
        ['text'] = {
            [1] = '{C:red}^^^3{} Mult'
        },
        ['unlock'] = {
            [1] = '???'
        }
    },
    pos = {
        x = 2,
        y = 18
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "shit_destructive",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["shit_shit_jokers"] = true },
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
                hypermult = {
                card.ability.extra.hypermult_arrows,
                card.ability.extra.hypermult_n
            }
        }
    end
end,
  check_for_unlock = function(self,args)
    if args.type == "discard_custom" then
      local count = 0
        for i = 1, #args.cards do
    if next(evaluate_poker_hand(args.cards)["Flush Five"]) then
      count = count + 1
    end
    end
      if count == to_big(99) then
        return true
      end
  end
  return false
  end
}