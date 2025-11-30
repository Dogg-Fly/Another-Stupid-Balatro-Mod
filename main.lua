local https_lib = assert(SMODS.load_file("lib/https.lua"))()
anotherstupidbalatromod_config = { HTTPS = true }

local config = SMODS.current_mod.config

-- Atlases
SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas{
    key = "death", 
    path = "CustomBlind.png", 
    frames = 21,
    px = 34,
    py = 34, 
    atlas_table = "ANIMATION_ATLAS"
}

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "modicon",
    path = "ModIcon.png",
    px = 32,
    py = 32,
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomStake", 
    path = "CustomStake.png", 
    px = 29,
    py = 29, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomTag", 
    path = "CustomTag.png", 
    px = 34,
    py = 34, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomSticker", 
    path = "CustomSticker.png", 
    px = 71,
    py = 71, 
    atlas_table = "ASSET_ATLAS"
}):register()

-- Sounds
SMODS.Sound({
    key = "shitpost_music", 
    path = "shitpost_music.ogg",
    pitch = 0.7,
    sync = true,
    select_music_track = function()
        return (G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and 
                G.pack_cards.cards[1].ability.set == "Joker" and
                G.pack_cards.cards[1].config and G.pack_cards.cards[1].config.center and
                G.pack_cards.cards[1].config.center.rarity == "shit_shitpost") and 10 or false
    end
})

SMODS.Sound({
    key = "generic_music", 
    path = "generic_music.ogg",
    pitch = 0.7,
    sync = true,
    select_music_track = function()
        return (G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and 
                G.pack_cards.cards[1].ability.set == "generic") and 10 or false
    end
})

SMODS.Sound({
    key = "ultrarot_music", 
    path = "ultrarot_music.ogg",
    pitch = 0.7,
    sync = true,
    select_music_track = function()
        return (G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and 
                G.pack_cards.cards[1].ability.set == "ultrarot") and 10 or false
    end
})

SMODS.Sound {
    key = 'music_menutest',
    path = 'menutest.ogg', 
    volume = 0.6,
    pitch = 1.0,
    select_music_track = function(self)
        if config.enable_menu_music and (G.STATE == G.STATES.MENU or G.STATE == 11) then
            return 100  
        end
        return nil  
    end
}

SMODS.current_mod.extra_tabs = function()
    return {
        {
            label = 'Credits',
            tab_definition_function = function()
                return {
                    n = G.UIT.ROOT, 
                    config = {align = "cm", padding = 0.2, colour = G.C.BLACK, r = 0.1, minw = 10, minh = 8}, 
                    nodes = {
                        {n = G.UIT.C, config = {align = "cm", padding = 0.1}, nodes = {
                            {n = G.UIT.R, config = {align = "cm", padding = 0.15}, nodes = {
                                {n = G.UIT.T, config = {text = "CREDITS", colour = G.C.UI.TEXT_LIGHT, scale = 0.7}}
                            }},
                            {n = G.UIT.R, config = {align = "cm", padding = 0.1}, nodes = {}},
                            {n = G.UIT.R, config = {align = "cm", padding = 0.05}, nodes = {
                                {n = G.UIT.T, config = {text = "Doggfly", colour = G.C.YELLOW, scale = 0.55}}
                            }},
                            {n = G.UIT.R, config = {align = "cm", padding = 0.02}, nodes = {
                                {n = G.UIT.T, config = {text = "(Creator of this crap)", colour = G.C.UI.TEXT_LIGHT, scale = 0.4}}
                            }},
                            {n = G.UIT.R, config = {align = "cm", padding = 0.02}, nodes = {
                                {n = G.UIT.T, config = {text = "(I wrote some code to do this)", colour = G.C.UI.TEXT_INACTIVE, scale = 0.35}}
                            }},
                            {n = G.UIT.R, config = {align = "cm", padding = 0.1}, nodes = {}},
                            {n = G.UIT.R, config = {align = "cm", padding = 0.05}, nodes = {
                                {n = G.UIT.T, config = {text = "Mateoe", colour = G.C.BLUE, scale = 0.55}}
                            }},
                            {n = G.UIT.R, config = {align = "cm", padding = 0.02}, nodes = {
                                {n = G.UIT.T, config = {text = "(Music from the Booster Packs and Main Menu)", colour = G.C.UI.TEXT_LIGHT, scale = 0.4}}
                            }},
                            {n = G.UIT.R, config = {align = "cm", padding = 0.15}, nodes = {}},
                            {n = G.UIT.R, config = {align = "cm", padding = 0.05}, nodes = {
                                {n = G.UIT.T, config = {text = "And a huge thank you to", colour = G.C.UI.TEXT_LIGHT, scale = 0.45}}
                            }},
                            {n = G.UIT.R, config = {align = "cm", padding = 0.05}, nodes = {
                                {n = G.UIT.T, config = {text = "Joker Forge", colour = G.C.GREEN, scale = 0.5}}
                            }},
                            {n = G.UIT.R, config = {align = "cm", padding = 0.02}, nodes = {
                                {n = G.UIT.T, config = {text = "jokers, consumables, seals and enchantment made in joker forge", colour = G.C.UI.TEXT_LIGHT, scale = 0.4}}
                            }}
                        }}
                    }
                }
            end,
        }
    }
end

SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT, 
        config = {align = "cm", padding = 0.1, colour = G.C.BLACK, r = 0.1, minw = 8, minh = 6}, 
        nodes = {
            {n = G.UIT.C, config = {align = "cm", padding = 0.1}, nodes = {
                {n = G.UIT.R, config = {align = "cm", padding = 0.1}, nodes = {
                    {n = G.UIT.T, config = {text = "Settings", colour = G.C.UI.TEXT_LIGHT, scale = 0.6}}
                }},
                {n = G.UIT.R, config = {align = "cm", padding = 0.05}, nodes = {}},
                {n = G.UIT.R, config = {align = "cm", padding = 0.1}, nodes = {
                    {n = G.UIT.C, config = {align = "cm", minw = 3}, nodes = {
                        {n = G.UIT.T, config = {text = "Toggle menu music:", colour = G.C.UI.TEXT_LIGHT, scale = 0.45}}
                    }},
                    {n = G.UIT.C, config = {align = "cm", minw = 2, id = "toggle_menu_music_btn", button = "toggle_menu_music", colour = config.enable_menu_music and G.C.GREEN or G.C.RED, r = 0.1, padding = 0.1, hover = true, shadow = true}, nodes = {
                        {n = G.UIT.T, config = {id = "toggle_menu_music_text", text = config.enable_menu_music and "ON" or "OFF", colour = G.C.UI.TEXT_LIGHT, scale = 0.4}}
                    }}
                }},
                {n = G.UIT.R, config = {align = "cm", padding = 0.1}, nodes = {
                    {n = G.UIT.C, config = {align = "cm", minw = 3}, nodes = {
                        {n = G.UIT.T, config = {text = "Custom title screen:", colour = G.C.UI.TEXT_LIGHT, scale = 0.45}}
                    }},
                    {n = G.UIT.C, config = {align = "cm", minw = 2, id = "toggle_custom_title_btn", button = "toggle_custom_title", colour = config.enable_custom_title and G.C.GREEN or G.C.RED, r = 0.1, padding = 0.1, hover = true, shadow = true}, nodes = {
                        {n = G.UIT.T, config = {id = "toggle_custom_title_text", text = config.enable_custom_title and "ON" or "OFF", colour = G.C.UI.TEXT_LIGHT, scale = 0.4}}
                    }}
                }}
            }}
        }
    }
end

G.FUNCS.toggle_menu_music = function(e)
    config.enable_menu_music = not config.enable_menu_music
    SMODS.save_mod_config(SMODS.current_mod)
    
    local btn = e.UIBox:get_UIE_by_ID("toggle_menu_music_btn")
    local txt = e.UIBox:get_UIE_by_ID("toggle_menu_music_text")
    if btn then
        btn.config.colour = config.enable_menu_music and G.C.GREEN or G.C.RED
    end
    if txt then
        txt.config.text = config.enable_menu_music and "ON" or "OFF"
        txt:juice_up()
    end
    
    play_sound('button')
end

G.FUNCS.toggle_custom_title = function(e)
    config.enable_custom_title = not config.enable_custom_title
    SMODS.save_mod_config(SMODS.current_mod)
    
    local btn = e.UIBox:get_UIE_by_ID("toggle_custom_title_btn")
    local txt = e.UIBox:get_UIE_by_ID("toggle_custom_title_text")
    if btn then
        btn.config.colour = config.enable_custom_title and G.C.GREEN or G.C.RED
    end
    if txt then
        txt.config.text = config.enable_custom_title and "ON" or "OFF"
        txt:juice_up()
    end
    
    play_sound('button')
end

if not anotherstupidbalatromod then
    anotherstupidbalatromod = {}
end
anotherstupidbalatromod.current_card_index = anotherstupidbalatromod.current_card_index or 1

local TITLE_CARDS = {
    'j_shit_zzz', 'j_shit_abbie', 'j_shit_dontforgetj', 'j_shit_tylerthejoker',
    'j_shit_balatro_balatrez2', 'j_shit_blob2', 'j_shit_kasane_pearto2', 'j_shit_mikupear',
    'j_shit_pandora2', 'j_shit_perkegod', 'j_shit_sybau', 'j_shit_void_calderon2',
    'j_shit_iris2', 'j_shit_donisha2'
}

local function get_next_title_card()
    local selected = TITLE_CARDS[anotherstupidbalatromod.current_card_index]
    anotherstupidbalatromod.current_card_index = anotherstupidbalatromod.current_card_index + 1
    if anotherstupidbalatromod.current_card_index > #TITLE_CARDS then
        anotherstupidbalatromod.current_card_index = 1
    end
    return selected
end

local function setup_title_background()
    if not G or not G.SPLASH_BACK then
        return
    end
    
    G.C.title_primary = HEX(config.title_primary_color or "8A2BE2")
    G.C.title_secondary = HEX(config.title_secondary_color or "000080")
    G.SPLASH_BACK:define_draw_steps({{
        shader = "splash",
        send = {
            {name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER"},
            {name = "vort_speed", val = config.title_vortex_speed or 1},
            {name = "colour_1", ref_table = G.C, ref_value = 'title_primary'},
            {name = "colour_2", ref_table = G.C, ref_value = 'title_secondary'},
        },
    }})
end

local original_title_state = {
    width = nil,
    x = nil,
    cards_added = false
}

local game_main_menu_ref = Game.main_menu
function Game:main_menu(change_context)
    local ret = game_main_menu_ref(self, change_context)
    
    if anotherstupidbalatromod and anotherstupidbalatromod.in_spanish_run then
        restore_original_localization()
        anotherstupidbalatromod.in_spanish_run = false
    end
    
    if config and config.enable_custom_title then
        if G and G.SPLASH_BACK then
            setup_title_background()
        end
        
        if G and G.title_top and not original_title_state.cards_added then
            if original_title_state.width == nil then
                original_title_state.width = G.title_top.T.w
                original_title_state.x = G.title_top.T.x
            end
            
            G.title_top.T.w = original_title_state.width * 1.7675
            G.title_top.T.x = original_title_state.x - 0.8
            
            local selected_card = get_next_title_card()
            if G.P_CENTERS and G.P_CENTERS[selected_card] then
                local success, newcard = pcall(SMODS.create_card, {key = selected_card, area = G.title_top})
                if success and newcard then
                    G.title_top:emplace(newcard)
                    newcard:start_materialize()
                    newcard.no_ui = true
                    original_title_state.cards_added = true
                end
            end
        end
    else
        if G and G.title_top and original_title_state.width then
            G.title_top.T.w = original_title_state.width
            G.title_top.T.x = original_title_state.x
            
            if G.title_top.cards then
                for i = #G.title_top.cards, 1, -1 do
                    local card = G.title_top.cards[i]
                    if card and card.config and card.config.center then
                        local key = card.config.center.key
                        for _, title_key in ipairs(TITLE_CARDS) do
                            if key == title_key then
                                card:remove()
                                break
                            end
                        end
                    end
                end
            end
            original_title_state.cards_added = false
        end
    end
    
    return ret
end

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local function load_jokers_folder()
    local files = NFS.getDirectoryItemsInfo(SMODS.current_mod.path .. "/jokers")
    for i = 1, #files do
        if files[i].name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. files[i].name))()
        end
    end
end

local function load_editions_folder()
    local files = NFS.getDirectoryItemsInfo(SMODS.current_mod.path .. "/editions")
    for i = 1, #files do
        if files[i].name:sub(-4) == ".lua" then
            assert(SMODS.load_file("editions/" .. files[i].name))()
        end
    end
end

local function load_vouchers_folder()
    local files = NFS.getDirectoryItemsInfo(SMODS.current_mod.path .. "/vouchers")
    for i = 1, #files do
        if files[i].name:sub(-4) == ".lua" then
            assert(SMODS.load_file("vouchers/" .. files[i].name))()
        end
    end
end

local function load_consumables_folder()
    local files = NFS.getDirectoryItemsInfo(SMODS.current_mod.path .. "/consumables")
    for i = 1, #files do
        if files[i].name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. files[i].name))()
        end
    end
end

local function load_enhancements_folder()
    local files = NFS.getDirectoryItemsInfo(SMODS.current_mod.path .. "/enhancements")
    for i = 1, #files do
        if files[i].name:sub(-4) == ".lua" then
            assert(SMODS.load_file("enhancements/" .. files[i].name))()
        end
    end
end

local function load_seals_folder()
    local files = NFS.getDirectoryItemsInfo(SMODS.current_mod.path .. "/seals")
    for i = 1, #files do
        if files[i].name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. files[i].name))()
        end
    end
end

local deckIndexList = {5,1,4,2,3}

local function load_decks_folder()
    local files = NFS.getDirectoryItemsInfo(SMODS.current_mod.path .. "/decks")
    for i = 1, #deckIndexList do
        if files[deckIndexList[i]].name:sub(-4) == ".lua" then
            assert(SMODS.load_file("decks/" .. files[deckIndexList[i]].name))()
        end
    end
end

assert(SMODS.load_file("rarities.lua"))()
assert(SMODS.load_file("items/boosters.lua"))()
assert(SMODS.load_file("sounds.lua"))()
assert(SMODS.load_file("items/stake.lua"))()
load_vouchers_folder()
assert(SMODS.load_file("items/challenge.lua"))()
assert(SMODS.load_file("items/tag.lua"))()
load_jokers_folder()
load_consumables_folder()
load_decks_folder()
load_enhancements_folder()
load_seals_folder()
assert(SMODS.load_file("items/blinds.lua"))()
assert(SMODS.load_file("items/pokerhand.lua"))()
load_editions_folder()

SMODS.ObjectType({
    key = "shit_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true,
        ["j_shit_chocolate"] = true,
        ["j_shit_fideoscontuco"] = true
    },
})

SMODS.ObjectType({
    key = "shit_tyler",
    cards = {
        ["j_shit_acethejoker"] = true,
        ["j_shit_bigpoe"] = true,
        ["j_shit_churbum"] = true,
        ["j_shit_dctc"] = true,
        ["j_shit_flower_boy2"] = true,
        ["j_shit_igor2"] = true,
        ["j_shit_samisdead"] = true,
        ["j_shit_sirtylerbaudelaire"] = true,
        ["j_shit_st_chroma2"] = true,
        ["j_shit_troncat"] = true,
        ["j_shit_tylerthejoker"] = true,
        ["j_shit_wolf_haley2"] = true
    },
})

SMODS.ObjectType({
    key = "shit_shit_jokers",
    cards = {
        ["j_shit_hyperjimbo"] = true
    },
})

if G and G.GAME then
    G.E_MANAGER:add_event(Event({
        func = function()
            anotherstupidbalatromod.update_member_count()
            return true
        end,
        delay = 5 
    }))
end

anotherstupidbalatromod.update_member_count()