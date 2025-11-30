SMODS.Joker{ --Pandora
    key = "pandora2",
    config = {
        extra = {
            odds = 2,
            odds2 = 6
        }
    },
    loc_txt = {
        ['name'] = 'Pandora',
        ['text'] = {
            [1] = '{C:green}#1# in #2# chance{} to{C:attention} copy{} triggered card {C:green}#1# in #2# chance{}{C:attention} destroy{} triggered card'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 11
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
    soul_pos = {
        x = 5,
        y = 11
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_shit_pandora2')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_shit_pandora2')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,

    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_8f76f24b', 1, card.ability.extra.odds, 'j_shit_pandora2', false) then
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                    copied_card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    G.deck:emplace(copied_card)
                    table.insert(G.playing_cards, copied_card)
                    playing_card_joker_effects({true})
                    
                    G.E_MANAGER:add_event(Event({
                    func = function() 
                        copied_card:start_materialize()
                        return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied Card!", colour = G.C.GREEN})
                end
                if SMODS.pseudorandom_probability(card, 'group_1_03a2dd59', 1, card.ability.extra.odds2, 'j_shit_pandora2', false) then
                    context.other_card.should_destroy = true
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
            end
        end
    end
}