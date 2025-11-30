-- Gold Omelet Challenge
SMODS.Challenge{
    key = 'gold_omelet',
    loc_txt = {
        name = 'Gold Omelet'
    },
    rules = {
        custom = {
            {id = 'no_reward'},
            {id = 'no_extra_hand_money'},
            {id = 'no_interest'}
        }
    },
    jokers = {
        {id = 'j_shit_eggold'},
        {id = 'j_shit_eggold'},
        {id = 'j_shit_eggold'},
        {id = 'j_shit_eggold'},
        {id = 'j_shit_eggold'}
    },
    restrictions = {
        banned_cards = {
            {id = 'v_seed_money'},
            {id = 'v_money_tree'},
            {id = 'j_to_the_moon'},
            {id = 'j_rocket'},
            {id = 'j_golden'},
            {id = 'j_satellite'}
        }
    },
    button_colour = G.C.GOLD
}