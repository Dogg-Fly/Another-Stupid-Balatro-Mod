SMODS.Tag({
    key = "mega_ultrarot",
    atlas = "CustomTag",
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    loc_txt = {
        name = "Mega Ultrarot Tag",
        text = {
            "Gives a free",
            "{C:tarot}Mega Ultrarot Pack"
        }
    },
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = { set = "Other", key = "p_shit_mega_ultrarot_pack", specific_vars = { 2, 7 } }
        return { vars = {} }
    end,
    apply = function(self, tag, context)
        if context.type == "new_blind_choice" then
            tag:yep("+", G.C.SECONDARY_SET.Spectral, function()
                local key = "p_shit_mega_ultrarot_pack"
                local card = Card(
                    G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
                    G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
                    G.CARD_W * 1.27,
                    G.CARD_H * 1.27,
                    G.P_CARDS.empty,
                    G.P_CENTERS[key],
                    { bypass_discovery_center = true, bypass_discovery_ui = true }
                )
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = card } })
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
        end
    end,
})

SMODS.Tag({
    key = "spot_pack",
    atlas = "CustomTag",
    pos = { x = 1, y = 0 },
    unlocked = true,
    discovered = true,
    loc_txt = {
        name = "Spot Pack Tag",
        text = {
            "Gives a free",
            "{C:tarot}Spot Pack"
        }
    },
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = { set = "Other", key = "p_shit_spot_pack", specific_vars = { 1, 3 } }
        return { vars = {} }
    end,
    apply = function(self, tag, context)
        if context.type == "new_blind_choice" then
            tag:yep("+", G.C.SECONDARY_SET.Tarot, function()
                local key = "p_shit_spot_pack"
                local card = Card(
                    G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
                    G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
                    G.CARD_W * 1.27,
                    G.CARD_H * 1.27,
                    G.P_CARDS.empty,
                    G.P_CENTERS[key],
                    { bypass_discovery_center = true, bypass_discovery_ui = true }
                )
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = card } })
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
        end
    end,
})

SMODS.Tag({
    key = "destructive_joker",
    atlas = "CustomTag",
    pos = { x = 2, y = 0 },
    unlocked = true,
    discovered = true,
    loc_txt = {
        name = "Destructive Tag",
        text = {
            "Next shop has a",
            "{C:legendary}Destructive Joker{}"
        }
    },
    loc_vars = function(self, info_queue)
        return { vars = {} }
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_create' then
            local card = SMODS.create_card {
                set = "Joker",
                rarity = "shit_destructive",
                area = context.area,
                key_append = "shit_"
            }
            create_shop_card_ui(card, 'Joker', context.area)
            card.states.visible = false
            tag:yep('+', G.C.LEGENDARY, function()
                card:start_materialize()
                card.ability.couponed = true
                card:set_cost()
                return true
            end)
            tag.triggered = true
            return card
        end
    end,
})