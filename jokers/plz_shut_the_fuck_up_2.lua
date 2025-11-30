SMODS.Joker{ --Plz shut the fuck up ]:/
    key = "plz_shut_the_fuck_up_2",
    config = {
        extra = {
            More = 2
        }
    },
    loc_txt = {
        ['name'] = 'Plz shut the fuck up ]:/',
        ['text'] = {
            [1] = 'more shop slots'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 12
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
        if context.setting_blind  then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.More).." Voucher Slots", colour = G.C.DARK_EDITION})
                    SMODS.change_voucher_limit(card.ability.extra.More)
                    return true
                    end,
                    extra = {
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.More).." Booster Slots", colour = G.C.DARK_EDITION})
                        SMODS.change_booster_limit(card.ability.extra.More)
                        return true
                        end,
                        colour = G.C.ORANGE,
                        extra = {
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.More).." Shop Slots", colour = G.C.YELLOW})
                            change_shop_size(card.ability.extra.More)
                            return true
                            end,
                            colour = G.C.ORANGE
                        }
                    }
                }
            end
            if context.cardarea == G.jokers and context.joker_main  then
                card.ability.extra.More = (card.ability.extra.More) * 2
            end
        end
}