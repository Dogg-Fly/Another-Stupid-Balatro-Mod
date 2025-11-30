SMODS.Joker{ --Wee Smiley??
    key = "weesmiley",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Wee Smiley??',
        ['text'] = {
            [1] = 'awwww hes so cute :3',
            [2] = '{C:attention}+1 Joker Slot{}',
            [3] = '{C:inactive}from flushtro now in asbm{}',
            [4] = '{C:inactive}credits to ToxicPlayer{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 16
    },
    display_size = {
        w = 71 * 0.3, 
        h = 95 * 0.3
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_shit_weesmiley" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_shit_weesmiley" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end