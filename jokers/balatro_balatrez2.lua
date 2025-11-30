SMODS.Joker{ --Balatro Balatrez
    key = "balatro_balatrez2",
    config = {
        extra = {
            emult = 100,
            shit_balatro = 0
        }
    },
    loc_txt = {
        ['name'] = 'Balatro Balatrez',
        ['text'] = {
            [1] = '{X:edition,C:white}^100 Mult{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 2, 
        h = 95 * 2
    },
    cost = 5,
    rarity = "shit_balatro_no_es_solo_un_juego_de_cartas_es_un_estilo_de_vida_respiro_y_tomo_balatro_si_tuviera_un_hijo_lo_llamara_full_house_y_si_tuviera_dos_les_pondra_doble_y_par_para_mejorarlos_a_nivel_18_y_que_rompan_las_ligas_de_jefe_cuando_sean_adultos_brindo_por_balatro_como_por_balatro_este_me_hizo_mejor_persona_y_cuando_tengo_el_celular_descargado_cierro_mis_ojos_para_jugarlo_en_mi_mente_la_rueda_de_la_fortuna_dicta_mi_vida_siempre_tengo_un_pltano_en_mi_bolsillo_para_sumar_puntos_me_identifico_con_el_joker_misprint_porque_mi_estado_mental_es_as_de_inestable_no_puedo_subir_las_escaleras_sin_pensar_en_balatro_y_el_dia_que_mu3ra_espero_que_pongan_en_mi_tumb4_mur1_en_pleno_balatreo_el_unico_corazn_que_quiero_es_el_de_la_reina_mi_pap_cree_que_estoy_mal_pero_l_no_sabe_lo_que_es_ser_la_carta_ms_alta_de_la_familia_el_da_que_el_juego_ya_no_tenga_fans_es_porque_ya_no_estar_en_este_mundo_porque_yo_soy_el_balatro",
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
            G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("shit_balatro")
                
                return true
                end,
            }))
            return {
                e_mult = card.ability.extra.emult
            }
        end
    end
}