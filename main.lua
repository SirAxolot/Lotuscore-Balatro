-- boooooo vscode hates me
---@diagnostic disable: undefined-global

local Lotus = SMODS.current_mod
local brainrot = math.random(1, 1000) == 69
local vanilla_jokers = {"j_joker","j_greedy_joker","j_lusty_joker","j_wrathful_joker","j_gluttenous_joker","j_zany","j_mad","j_crazy","j_droll","j_sly","j_wily","j_clever","j_devious","j_crafty","j_half","j_stencil","j_four_fingers","j_mime","j_credit_card","j_ceremonial","j_banner","j_mystic_summit","j_marble","j_loyalty_card","j_8_ball","j_misprint","j_dusk","j_raised_fist","j_chaos","j_fibonacci","j_steel_joker","j_scary_face","j_abstract","j_delayed_grat","j_hack","j_pareidolia","j_gros_michel","j_even_steven","j_odd_todd","j_scholar","j_business","j_supernova","j_ride_the_bus","j_space","j_egg","j_burglar","j_blackboard","j_runner","j_ice_cream","j_dna","j_splash","j_blue_joker","j_sixth_sense","j_constellation","j_hiker","j_faceless","j_green_joker","j_superposition","j_todo_list","j_cavendish","j_card_sharp","j_red_card","j_madness","j_square","j_seance","j_riff_raff","j_vampire","j_shortcut","j_hologram","j_vagabond","j_baron","j_cloud_9","j_rocket","j_obelisk","j_midas_mask","j_luchador","j_photograph","j_gift","j_turtle_bean","j_erosion","j_reserved_parking","j_mail","j_to_the_moon","j_hallucination","j_fortune_teller","j_juggler","j_drunkard","j_stone","j_golden","j_lucky_cat","j_baseball","j_bull","j_diet_cola","j_trading","j_flash","j_popcorn","j_trousers","j_ancient","j_ramen","j_walkie_talkie","j_selzer","j_castle","j_smiley","j_campfire","j_ticket","j_mr_bones","j_acrobat","j_sock_and_buskin","j_swashbuckler","j_troubadour","j_certificate","j_smeared","j_throwback","j_hanging_chad","j_rough_gem","j_bloodstone","j_arrowhead","j_onyx_agate","j_glass","j_ring_master","j_flower_pot","j_blueprint","j_wee","j_merry_andy","j_oops","j_idol","j_seeing_double","j_matador","j_hit_the_road","j_duo","j_trio","j_family","j_order","j_tribe","j_stuntman","j_invisible","j_brainstorm","j_satellite","j_shoot_the_moon","j_drivers_license","j_cartomancer","j_astronomer","j_burnt","j_bootstraps","j_caino","j_triboulet","j_yorick","j_chicot","j_perkeo"}

SMODS.Atlas {key = "Joker", path = "lot_basegame_jkrs.png", px = 71, py = 95, prefix_config = {key = false}}
SMODS.Atlas {key = "Booster", path = "lot_pack.png", px = 71, py = 95, prefix_config = {key = false}}
SMODS.Atlas {key = "blind_chips", path = "lot_blinds.png", px = 34, py = 34, prefix_config = {key = false}, atlas_table = "ANIMATION_ATLAS", frames = 21, raw_key = true}
SMODS.Atlas {key = "shop_sign", path = "lot_shop.png", px = 115, py = 57, prefix_config = {key = false}, atlas_table = "ANIMATION_ATLAS", frames = 4, raw_key = true}
SMODS.Atlas {key = "tags", path = "lot_tag.png", px = 34, py = 34, prefix_config = {key = false}}
SMODS.Atlas {key = "stickers", path = "lot_stick.png", px = 71, py = 95, prefix_config = {key = false}}
SMODS.Atlas {key = "Tarot", path = "lot_consumable.png", px = 71, py = 95, prefix_config = {key = false}}
SMODS.Atlas {key = "Planet", path = "lot_consumable.png", px = 71, py = 95, prefix_config = {key = false}} -- ?
SMODS.Atlas {key = "Spectral", path = "lot_consumable.png", px = 71, py = 95, prefix_config = {key = false}} -- ???
SMODS.Atlas {key = "balatro", path = "lot_logo.png", px = 337, py = 252, prefix_config = {key = false}}
SMODS.Atlas {key = "cards_1", path = "lot_cards.png", px = 71, py = 95, prefix_config = {key = false}}
SMODS.Atlas {key = "cards_2", path = "lot_cards_2.png", px = 71, py = 95, prefix_config = {key = false}}
SMODS.Atlas {key = "ui_1", path = "lot_ui.png", px = 18, py = 18, prefix_config = {key = false}}
SMODS.Atlas {key = "ui_2", path = "lot_ui_2.png", px = 18, py = 18, prefix_config = {key = false}}
SMODS.Atlas {key = "Voucher", path = "lot_vouch.png", px = 71, py = 95, prefix_config = {key = false}}
SMODS.Atlas {key = "centers", path = "lot_center.png", px = 71, py = 95, prefix_config = {key = false}}

SMODS.Atlas {key = "LJkr", path = "lot_added_jkrs.png", px = 71, py = 95}

-- im just tooooo lazy for localization man
local nameReplacers = {
    ["^Bull$"] = "Bug",
    ["^Egg$"] = "Legg",
    ["Sock and Buskin"] = "Hawk and Buskin",
    ["Canio"] = "Tael",
    ["Triboulet"] = "Qhite",
    ["Yorick"] = "Boxcat",
    ["Chicot"] = "Creature",
    ["Perkeo"] = "Fizz",
    ["Diet Cola"] = "Spirte",
    ["Midas Mask"] = "Kitty Mask",
    ["Merry Andy"] = "Sleepy Andy",
    ["Buffoon Pack"] = "Floral Pack",
    ["Buffoon Tag"] = "Floral Tag"
}

-- automatic replacement of "Joker" to "Lotus"
local function jkr_to_lts(str)
    if not Lotus.config.lot_text_replace then return str end
    if type(str) == "table" then
        for k, _ in pairs(str) do
            str[k] = jkr_to_lts(str[k])
        end
    end
    if type(str) ~= "string" then
        return str
    end
    for key, value in pairs(nameReplacers) do
        str = str:gsub(key, value)
    end
    return string.gsub(
        str, "[jJ][oO][kK][eE][rR][sS]?", function(n)
            if (n == "Jokers") then return "Lotuses"
            elseif (n == "Joker") then return "Lotus"
            elseif (n == "JOKER") then return "LOTUS"
            else return n end
        end
    )
end

Lotus.process_loc_text = function()
    if Lotus.config.lot_text_replace then
        -- manually run through the vanilla jokers...
        for _, v in ipairs(vanilla_jokers) do
            G.localization.descriptions.Joker[v] = jkr_to_lts(G.localization.descriptions.Joker[v])
        end

        -- ...and brute force the rest of the localization
        for _, v in ipairs(G.localization.descriptions) do
            if v ~= "Joker" then
                G.localization.descriptions[v] = jkr_to_lts(G.localization.descriptions[v])
            end
        end
        for _, v in ipairs(G.localization) do
            if v ~= "descriptions" then
                G.localization[v] = jkr_to_lts(G.localization[v])
            end
        end
        G.localization.misc.tutorial.sb_1[2] = "{C:attention}Hawk{}, I'm here to help"
        if brainrot then
            G.localization.misc.tutorial.sb_1 = {
                "Hello there! My name is",
                "{C:attention}Hawk{}, I'm here to help",
                "you learn how {C:attention}to.. uh...{}",
                "I forgot what I was gonna say..."
            }
            G.localization.misc.tutorial.s_1 = {
                "Hey um... I just want to say",
                "sorry for the {C:attention}Hawk Tuah{} joke",
                "earlier. I only have a {C:attention}0.1%{} chance",
                "of even saying it!"
            }
            G.localization.misc.tutorial.s_2 = {
                "...Anyways, buy me I",
                "guess..."
            }
        end
    end

    G.localization.descriptions.Joker.j_hologram.text[5] = "{C:inactive}(no longer visually bugged! :D){}"
end

-- FUCK this man i hate balatro ui
G.FUNCS.lot_save_and_restart = function ()
    SMODS.save_mod_config(Lotus)
    SMODS.restart_game()
end
Lotus.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = {r = 0.1, minw = 4, minh = 4, align = "cm", padding = 0.2, colour = G.C.BLACK},
        nodes = {
            {
                n = G.UIT.C,
                config = {align = "cm", minw = 4, padding = 0.1},
                nodes = {
                    {
                        n = G.UIT.R,
                        config = {align = "cm", padding = 0.03},
                        nodes = {
                            {
                                n = G.UIT.T,
                                config = {
                                    align = "cm",
                                    text = "(All options require a game restart because im bad at coding)",
                                    colour = G.C.UI.TEXT_LIGHT,
                                    scale = 0.3
                                }
                            }
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = {align = "cm", padding = 0},
                        nodes = {
                            create_toggle {
                                label = "Enable Lotus Text Replacement",
                                ref_table = Lotus.config,
                                ref_value = "lot_text_replace",
                            },
                            create_toggle {
                                label = "Enable Modded Lotuses",
                                ref_table = Lotus.config,
                                ref_value = "lot_add_jokers",
                            }
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = {align = "cm", padding = 0.03},
                        nodes = {
                            UIBox_button{
                                label = {"Restart Game"},
                                button = "lot_save_and_restart",
                                col = true
                            }
                        }
                    }
                }
            }
        }
    }
end

-- directly copied from balatro's flower pot code. its a mess. not my fault. sorry
local function flower_pot_logic(context)
    local suits = {
        ['Hearts'] = 0,
        ['Diamonds'] = 0,
        ['Spades'] = 0,
        ['Clubs'] = 0
    }
    for i = 1, #context.scoring_hand do
        if not SMODS.has_any_suit(context.scoring_hand[i]) then
            if context.scoring_hand[i]:is_suit('Hearts', true) and suits["Hearts"] == 0 then suits["Hearts"] = suits["Hearts"] + 1
            elseif context.scoring_hand[i]:is_suit('Diamonds', true) and suits["Diamonds"] == 0  then suits["Diamonds"] = suits["Diamonds"] + 1
            elseif context.scoring_hand[i]:is_suit('Spades', true) and suits["Spades"] == 0  then suits["Spades"] = suits["Spades"] + 1
            elseif context.scoring_hand[i]:is_suit('Clubs', true) and suits["Clubs"] == 0  then suits["Clubs"] = suits["Clubs"] + 1 end
        end
    end
    for i = 1, #context.scoring_hand do
        if SMODS.has_any_suit(context.scoring_hand[i]) then
            if context.scoring_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0 then suits["Hearts"] = suits["Hearts"] + 1
            elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0  then suits["Diamonds"] = suits["Diamonds"] + 1
            elseif context.scoring_hand[i]:is_suit('Spades') and suits["Spades"] == 0  then suits["Spades"] = suits["Spades"] + 1
            elseif context.scoring_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0  then suits["Clubs"] = suits["Clubs"] + 1 end
        end
    end
    return suits["Hearts"] > 0 and
    suits["Diamonds"] > 0 and
    suits["Spades"] > 0 and
    suits["Clubs"] > 0
end

local function ezjuice(c)
    G.E_MANAGER:add_event(Event({
        func = function()
            c:juice_up()
            return true
        end
    }))
end

local function rnd_new_hand(exclude, key)
    local _poker_hands = {}
    for k, v in pairs(G.GAME.hands) do
        if v.visible and v ~= exclude then _poker_hands[#_poker_hands+1] = k end
    end
    return pseudorandom_element(_poker_hands, pseudoseed(key))
end

-- new jokers
if Lotus.config.lot_add_jokers then
    SMODS.Joker { -- funnyman
        key = "funnyman",
        name = "funnyman",
        config = {extra = {chips = 0, chip_gain = 11, poker_hand = nil}},
        blueprint_compat = true,
        rarity = 1,
        atlas = "LJkr",
        pos = {x = 0, y = 0},
        cost = 4,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips,
                    card.ability.extra.chip_gain,
                    localize(card.ability.extra.poker_hand, "poker_hands")
                }
            }
        end,
        calculate = function(self, card, context)
            if context.joker_main and card.ability.extra.chips > 0 then
                return {
                    chips = card.ability.extra.chips,
                    message = localize {type = "variable", key = "a_chips", vars = {card.ability.extra.chips}}
                }
            end
            if context.before and context.scoring_name == card.ability.extra.poker_hand and not context.blueprint then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
                return {
                    message = "Upgraded!",
                    colour = G.C.CHIPS,
                    card = card
                }
            end
            if context.end_of_round and not context.repetition and not context.individual then
                card.ability.extra.poker_hand = rnd_new_hand(card.ability.extra.poker_hand, (self.area and self.area.config.type == 'title') and 'false_funnyman' or 'funnyman')
            end
        end,
        set_ability = function(self, card, initial, delay_sprites)
            card.ability.extra.poker_hand = rnd_new_hand(nil, (self.area and self.area.config.type == 'title') and 'false_funnyman' or 'funnyman')
        end
    }

    SMODS.Joker { -- mimic
        key = "mimic",
        name = "mimic",
        config = {extra = {x_mult = 4}},
        blueprint_compat = true,
        no_pool_flag = 'lot_mimic_inactive',
        rarity = 2,
        atlas = "LJkr",
        pos = {x = 1, y = 0},
        cost = 7,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
            return {
                vars = {card.ability.extra.x_mult}
            }
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    }

    SMODS.Joker { -- im a fork
        key = "fork",
        name = "fork",
        blueprint_compat = false,
        rarity = 3,
        atlas = "LJkr",
        pos = {x = 7, y = 1},
        cost = 9,
        loc_vars = function(self, info_queue, card)
            return {vars = {}}
        end,
        calculate = function(self, card, context)
            if context.joker_main and not context.blueprint and flower_pot_logic(context) and #G.consumeables.cards < G.consumeables.config.card_limit then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        local spectral = SMODS.create_card {set = "Spectral"}
                        spectral:add_to_deck()
                        G.consumeables:emplace(spectral)
                        return true
                    end
                }))
                
            end
        end
    }

    SMODS.Joker { -- lockpick
        key = "lockpick",
        name = "lockpick",
        config = {extra = {x_mult = 5, req_rounds = 6, cur_rounds = 0}},
        blueprint_compat = true,
        rarity = 3,
        atlas = "LJkr",
        pos = {x = 0, y = 1},
        cost = 9,
        loc_vars = function(self, info_queue, card)
            return {vars = {
                card.ability.extra.x_mult,
                card.ability.extra.req_rounds,
                (card.ability.extra.cur_rounds >= card.ability.extra.req_rounds) and "Active!" or card.ability.extra.cur_rounds.."/"..card.ability.extra.req_rounds
            }}
        end,
        calculate = function(self, card, context)
            if context.end_of_round and not context.repetition and not context.individual then
                card.ability.extra.cur_rounds = card.ability.extra.cur_rounds + 1
                if card.ability.extra.cur_rounds < card.ability.extra.req_rounds then
                    return {message = ""..card.ability.extra.cur_rounds} -- if its not a string then it immediately crashes #awesome
                elseif card.ability.extra.cur_rounds == card.ability.extra.req_rounds then
                    return {message = "Active!"}
                end
            end

            if context.joker_main and card.ability.extra.cur_rounds >= card.ability.extra.req_rounds then
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    }

    SMODS.Joker { -- floppy disk
        key = "floppy_disk",
        name = "floppy_disk",
        config = {extra = {mult = 2, add_mult = 1}},
        blueprint_compat = true,
        rarity = 1,
        atlas = "LJkr",
        pos = {x = 4, y = 1},
        cost = 5,
        loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.mult, card.ability.extra.add_mult}}
        end,
        calculate = function(self, card, context)
            if context.end_of_round and not context.repetition and not context.individual then
                if G.GAME.blind.boss then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.add_mult
                    return {
                        message = "Upgraded!",
                        card = card,
                    }
                end
            end
            if context.individual and context.cardarea == G.play then
                ezjuice(card)
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                    mult = card.ability.extra.mult,
                    card = context.other_card
                }
            end
        end
    }

    SMODS.Joker { -- road sign
        key = "sign",
        name = "sign",
        blueprint_compat = false,
        rarity = 2,
        atlas = "LJkr",
        pos = {x = 1, y = 1},
        cost = 8,
        loc_vars = function(self, info_queue, card)
            return {vars = {}}
        end,
        add_to_deck = function(self, card, from_debuff)
            G.GAME.modifiers.lot_sign_active = G.GAME.modifiers.lot_sign_active + 1
        end,
        remove_from_deck = function(self, card, from_debuff)
            G.GAME.modifiers.lot_sign_active = G.GAME.modifiers.lot_sign_active - 1
        end
    }

    SMODS.Joker { -- whiteboard
        key = "white",
        name = "white",
        blueprint_compat = false,
        rarity = 2,
        atlas = "LJkr",
        pos = {x = 3, y = 1},
        cost = 7,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
            info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
            return {vars = {}}
        end,
        add_to_deck = function(self, card, from_debuff)
            G.GAME.modifiers.lot_whiteboard_active = G.GAME.modifiers.lot_whiteboard_active + 1
        end,
        remove_from_deck = function(self, card, from_debuff)
            G.GAME.modifiers.lot_whiteboard_active = G.GAME.modifiers.lot_whiteboard_active - 1
        end
    }

    SMODS.Joker { -- armed and dangerous
        key = "armed",
        name = "armed",
        config = {extra = {reps = 2}},
        blueprint_compat = true,
        rarity = 2,
        atlas = "LJkr",
        pos = {x = 2, y = 0},
        cost = 6,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {card.ability.extra.reps}
            }
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.repetition and not context.individual -- proper context
                and not context.repetition_only and #context.scoring_hand > 1 -- no high cards, thats too cheaty
                and (context.other_card == context.scoring_hand[1] or context.other_card == context.scoring_hand[#context.scoring_hand]) -- are we actually triggering the first/last card?
                and (context.scoring_hand[1]:get_id() == context.scoring_hand[#context.scoring_hand]:get_id()) -- are the first and last card the same rank?
            then return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.reps,
                    card = card
                }
            end
        end,
    }

    SMODS.Joker { -- shotgun
        key = "gun",
        name = "gun",
        config = {extra = {odds = 2}},
        blueprint_compat = true,
        rarity = 2,
        atlas = "LJkr",
        pos = {x = 7, y = 0},
        cost = 6,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds}
            }
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.repetition and not context.repetition_only then
                if pseudorandom("gun") < G.GAME.probabilities.normal / card.ability.extra.odds then
                    return { 
                        message = 'Fired!',
                        repetitions = 1,
                        card = card
                    }
                end
            end
        end,
    }

    SMODS.Joker { -- slop addiction
        key = "slop",
        name = "slop",
        config = {extra = {chips = 15}},
        blueprint_compat = true,
        rarity = 1,
        atlas = "LJkr",
        pos = {x = 6, y = 1},
        cost = 5,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {card.ability.extra.chips}
            }
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.hand and context.individual and not context.end_of_round then
                ezjuice(card)
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                        card = context.other_card,
                    }
                else
                    return {
                        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                        chips = card.ability.extra.chips,
                        card = context.other_card
                    }
                end
                
            end
        end,
    }

    SMODS.Joker { -- dream rotation
        key = "dream",
        name = "dream",
        config = {extra = {mult = 10}},
        blueprint_compat = true,
        soul_pos = {x = 5, y = 0},
        rarity = 2,
        atlas = "LJkr",
        pos = {x = 4, y = 0},
        cost = 7,
        loc_vars = function(self, info_queue, card)
            
            info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
            return {
                vars = {card.ability.extra.mult}
            }
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.individual then
                if context.other_card.ability.effect == 'Stone Card' then
                    return {
                        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                        mult = card.ability.extra.mult,
                        card = context.other_card
                    }
                end
            end
        end,
    }

    SMODS.Joker { -- soy sauce
        key = "soy",
        name = "soy",
        config = {extra = {init_money = 8, money = 8, sub = 2}},
        blueprint_compat = false,
        rarity = 1,
        atlas = "LJkr",
        pos = {x = 3, y = 0},
        cost = 5,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {card.ability.extra.money, card.ability.extra.sub}
            }
        end,
        calc_dollar_bonus = function(self, card)
            local bonus = card.ability.extra.money
            card.ability.extra.money = card.ability.extra.money - card.ability.extra.sub
            if card.ability.extra.money <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        -- This part destroys the card.
                        G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        func = function()
                            G.jokers:remove_card(card)
                            card:remove()
                            card = nil
                            return true;
                        end
                        }))
                        return true
                    end
                    }))
                card_eval_status_text(card, 'extra', nil, nil, nil,
                    { message = "Emptied!" })
            end
            if bonus > 0 then return bonus end
        end
    }

    SMODS.Joker { -- fishy lotus
        key = "fisher",
        name = "fisher",
        config = {extra = {odds = 50}},
        blueprint_compat = false,
        rarity = 3,
        atlas = "LJkr",
        pos = {x = 6, y = 0},
        cost = 7,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
            info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
            info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
            return {
                vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds}
            }
        end,
        calculate = function(self, card, context)
            local caught = {}
            if not context.blueprint and context.cardarea == G.jokers and context.before == true and not context.debuffed_hand then
                for i=1, #context.scoring_hand do
                    if context.scoring_hand[i].edition == nil and (pseudorandom("fisher") < G.GAME.probabilities.normal / card.ability.extra.odds) then
                        caught[#caught+1] = context.scoring_hand[i]
                    end
                end
            end
            if #caught > 0 then
                local i = 1
                local ev = Event({
                    after = 0.5,
                    trigger = "after",
                    no_delete = true,
                    func = function()
                        caught[i]:set_edition(poll_edition(nil, nil, true, true), true)
                        caught[i]:juice_up()
                        card:juice_up()
                        card_eval_status_text(caught[i], 'extra', nil, nil, nil, { message = "Caught!"..((i > 1) and " (x"..format_ui_value(i)..")" or "") })
                        i = i + 1
                        if i > #caught then
                            ev.no_delete = false
                            return true
                        else
                            ev.start_timer = false
                        end
                    end,
                })
                G.E_MANAGER:add_event(ev)
                
            end
        end,
    }

    SMODS.Joker { -- savant
        key = "savant",
        name = "savant",
        config = { extra = { consumable = 1 } },
        blueprint_compat = false,
        rarity = 1,
        atlas = 'LJkr',
        pos = { x = 5, y = 1 },
        cost = 5,
        loc_vars = function(self, info_queue, card)
          return { vars = { card.ability.extra.consumable } }
        end,
        add_to_deck = function(self, card, from_debuff)
          G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.consumable
        end,
        remove_from_deck = function(self, card, from_debuff)
          G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.consumable
        end
      }

    SMODS.Joker { -- mag's stash
        key = "stash",
        name = "stash",
        config = {extra = {x_mult = 1, add_Xmult = 0.35}},
        blueprint_compat = true,
        rarity = 3,
        atlas = "LJkr",
        pos = {x = 2, y = 1},
        cost = 9,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {card.ability.extra.add_Xmult, card.ability.extra.x_mult}
            }
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                    x_mult = card.ability.extra.x_mult
                }
            end
        end,
        update = function(self, card, dt)
            if G.GAME then -- ??? i dont know?? to be safe.
                local amt = 0
                for _,v in pairs(G.GAME.used_vouchers) do
                    if v then amt = amt + 1 end
                end
                card.ability.extra.x_mult = 1 + (amt * card.ability.extra.add_Xmult)
            end
        end
    }

    SMODS.Joker { -- homonculus square
        key = "homonculus",
        name = "homonculus",
        config = {extra = {add_mult = 2, mult = 0}},
        blueprint_compat = true,
        rarity = 1,
        atlas = "LJkr",
        pos = {x = 0, y = 3},
        cost = 4,
        loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.add_mult, card.ability.extra.mult}}
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.jokers and context.before and not context.blueprint then
                local nums = false
                for i = 1, #context.scoring_hand do
                    if not context.scoring_hand[i].debuff and not context.scoring_hand[i]:is_face() then nums = true end
                end
                if nums then
                    local last_mult = card.ability.extra.mult
                    card.ability.extra.mult = 0
                    if last_mult > 0 then 
                        return {
                            message = localize('k_reset')
                        }
                    end
                else
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.add_mult
                end
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end,
    }

    SMODS.Joker { -- membership card
        key = "member",
        name = "member",
        config = {extra = {prog = 0, goal = 2}},
        blueprint_compat = false,
        rarity = 1,
        atlas = "LJkr",
        pos = {x = 1, y = 3},
        cost = 3,
        loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.goal, card.ability.extra.prog}}
        end,
        calculate = function(self, card, context)
            if not context.blueprint and context.open_booster == true then
                card.ability.extra.prog = card.ability.extra.prog + 1
                if card.ability.extra.prog >= card.ability.extra.goal then
                    card.ability.extra.prog = 0
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up()
                            local spectral
                            while spectral == nil do
                                spectral = SMODS.create_card {set = "Consumeables"}

                                if spectral.config.center.name == "The Soul"
                                    or spectral.config.center.name == "Black Hole"
                                    or (spectral.config.center.set == "Spectral" and pseudorandom(pseudoseed('member_ignore_spectral')) >= 0.5)
                                then
                                    spectral:remove()
                                    spectral = nil
                                end
                            end
                            spectral:add_to_deck()
                            G.consumeables:emplace(spectral)
                            return true
                        end
                    }))
                end
            end
        end,
    }

    -- nobodys gonna read the comments in this file. i gotta piss reaaally bad right now

    SMODS.Joker { -- confident lotus
        key = "confident",
        name = "confident",
        config = {extra = {mult = 10, chips = 10}},
        blueprint_compat = true,
        rarity = 1,
        atlas = "LJkr",
        pos = {x = 0, y = 2},
        cost = 5,
        loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.mult, card.ability.extra.chips}}
        end,
        calculate = function(self, card, context)
            if context.other_joker and (context.other_joker.config.center.rarity == 1 or context.other_joker.config.center.rarity == "Common") then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end
                }))
                return {
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult,
                }
            end
        end,
    }

    SMODS.Joker { -- diamond eyes
        key = "diamond",
        name = "diamond",
        config = {extra = {add_mult = 3, mult = 0, discard_req = 3}},
        blueprint_compat = true,
        rarity = 1,
        atlas = "LJkr",
        pos = {x = 1, y = 2},
        cost = 5,
        loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.add_mult, card.ability.extra.discard_req, card.ability.extra.mult}}
        end,
        calculate = function(self, card, context)
            if context.pre_discard and not context.blueprint then
                local c = 0
                for i = 1, #context.full_hand do
                    c = c + (context.full_hand[i]:is_suit("Diamonds") and 1 or 0)
                end
                if c >= card.ability.extra.discard_req then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.add_mult
                    return {
                        message = localize('k_upgrade_ex')
                    }
                end
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end,
    }

    SMODS.Joker { -- zaph
        key = "zaph",
        name = "zaph",
        config = {extra = {chips = 0, chips_per = 20}},
        blueprint_compat = true,
        rarity = 1,
        atlas = "LJkr",
        pos = {x = 4, y = 2},
        cost = 4,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {card.ability.extra.chips_per, card.ability.extra.chips}
            }
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                    chips = card.ability.extra.chips
                }
            end
        end,
        update = function(self, card, dt)
            card.ability.extra.chips = (G.jokers and #G.jokers.cards or 0) * card.ability.extra.chips_per
        end
    }

    SMODS.Joker { -- horned lotus
        key = "horny",
        name = "horny",
        blueprint_compat = false,
        rarity = 2,
        atlas = "LJkr",
        pos = {x = 5, y = 2},
        cost = 4,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
            return {vars = {}}
        end,
        calculate = function(self, card, context)
            if context.destroying_card and not context.blueprint and SMODS.has_enhancement(context.destroying_card, 'm_glass') then
                return true
            end
        end,
    }
    SMODS.Joker { -- pale pumpkin
        key = "pumpkin",
        name = "pumpkin",
        config = {extra = {lvl = 3}},
        blueprint_compat = false,
        rarity = 2,
        atlas = "LJkr",
        pos = {x = 6, y = 2},
        cost = 6,
        loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.lvl}}
        end,
        calculate = function(self, card, context)
            if context.selling_self and not context.blueprint then
                local _hand, _tally = nil, -1
                for k, v in ipairs(G.handlist) do
                    if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                        _hand = v
                        _tally = G.GAME.hands[v].played
                    end
                end
                update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(_hand, 'poker_hands'), chips = G.GAME.hands[_hand].chips, mult = G.GAME.hands[_hand].mult, level=G.GAME.hands[_hand].level})
                level_up_hand(card, _hand, false, card.ability.extra.lvl * removed_levels)
                update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
            end
        end,
    }

    function Lotus.reset_game_globals(run_start)
        if run_start then
            G.GAME.pool_flags.lot_mimic_inactive = true
            G.GAME.modifiers.lot_whiteboard_active = 0
            G.GAME.modifiers.lot_sign_active = 0
        end
    end

    -- pain in the ASS!!!
    local gchxm = Card.get_chip_h_x_mult
    Card.get_chip_h_x_mult = function(self)
        if G.GAME.modifiers.lot_whiteboard_active ~= nil and G.GAME.modifiers.lot_whiteboard_active > 0 then
            if self.ability.name == "Gold Card" and not self.debuff then
                return G.P_CENTERS.m_steel.config.h_x_mult
            end
        end
        return gchxm(self)
    end

    local geore = Card.get_end_of_round_effect
    Card.get_end_of_round_effect = function(self, context)
        local base = geore(self, context)
        if G.GAME.modifiers.lot_whiteboard_active ~= nil and G.GAME.modifiers.lot_whiteboard_active > 0 then
            if self.ability.name == "Steel Card" and not self.debuff then
                base.h_dollars = (base.h_dollars or 0) + G.P_CENTERS.m_gold.config.h_x_mult
            end
        end
        return base
    end

    local she = SMODS.has_enhancement
    SMODS.has_enhancement = function (card, type)
        if card.name == nil then return false end
        if G.GAME and G.GAME.modifiers.lot_whiteboard_active ~= nil and G.GAME.modifiers.lot_whiteboard_active > 0 then
            if (type == "m_gold" or type == "m_steel") then
                return she(card, "m_gold") or she(card, "m_steel")
            end
        end
        return she(card, type)
    end

    
    SMODS.Joker:take_ownership("j_joker", {
        add_to_deck = function(self, card, from_debuff)
            G.GAME.pool_flags.lot_mimic_inactive = false
        end,
    }, true)
end

SMODS.Keybind{
	key = 'imrich',
	key_pressed = 'm',
    held_keys = {'lctrl'}, -- other key(s) that need to be held

    action = function(self)
        G.GAME.dollars = 1e100
    end,
}