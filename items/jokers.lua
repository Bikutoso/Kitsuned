
SMODS.Atlas {
  key = "jokers",
  path = "jokers.png",
  px = 71,
  py = 95
}

SMODS.Joker {
  key = "energetic_joker",
  blueprint_compat = true,
  rarity = 1,
  cost = 4,
  atlas = "jokers",
  pos = { x = 0, y = 0},
  config = { extra = { mult = 10, type = "ktsu_cat_dog" } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, localize(card.ability.extra.type, "poker_hands") } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands["ktsu_cat_dog"]) then
      return {
        mult = card.ability.extra.mult,
        message = localize { type = "variable", key = "a_mult", vars = { card.ability.extra.mult } }
      }
    end
  end
}

SMODS.Joker {
  key = "playful_joker",
  blueprint_compat = true,
  rarity = 1,
  cost = 4,
  atlas = "jokers",
  pos = { x = 1, y = 0},
  config = { extra = { chips = 90, type = "ktsu_cat_dog" } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, localize(card.ability.extra.type, "poker_hands") } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands["ktsu_cat_dog"]) then
      return {
        chips = card.ability.extra.chips,
        message = localize { type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }
      }
    end
  end
}

SMODS.Joker {
  key = "friend",
  unlocked = false,
  blueprint_compat = true,
  rarity = 3,
  cost = 8,
  atlas = "jokers",
  pos = { x = 2, y = 0},
  config = { extra = { Xmult = 3, type = "ktsu_cat_dog" } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult, localize(card.ability.extra.type, "poker_hands") } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands["ktsu_cat_dog"]) then
      return {
        xmult = card.ability.extra.Xmult,
        message = localize { type = "variable", key = "a_xmult", vars = { card.ability.extra.Xmult } }
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize("ktsu_cat_dog", "poker_hands") } }
  end,
  check_for_unlock = function(self, args)
    return args.type == "win_no_hand" and G.GAME.hands["ktsu_cat_dog"].played == 0
  end
}

SMODS.Joker {
  key = "fox",
  blueprint_compat = false,
  rarity = 2,
  cost = 8,
  atlas = "jokers",
  pos = { x = 3, y = 0},
  config = {},
  loc_vars = function(self, info_queue, card)
    return {}
  end,
}
SMODS.Joker {
  key = "pet_bowl",
  blueprint_compat = false,
  rarity = 3,
  cost = 12,
  atlas = "jokers",
  pos = { x = 1, y = 1},
  config = {},
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.pet_bowl_saved
      }
    }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval then
     local chips_saved = G.GAME.pet_bowl_saved
     local chips_excess = G.GAME.chips - G.GAME.blind.chips
     
     if chips_excess > 0 then
       G.GAME.chips = G.GAME.chips - chips_excess
       G.GAME.pet_bowl_saved = chips_saved + chips_excess
        G.E_MANAGER:add_event(Event({
          func = function()
            --G.hand_text_area.blind_chips:juice_up()
            G.hand_text_area.game_chips:juice_up()
            play_sound("slice1")
            return true
          end,
        }))
       return {
         message = localize("k_upgrade_ex"),
         colour = G.C.PURPLE,
         card = card,
       }
     end

     if context.game_over then
       G.GAME.chips = G.GAME.chips + chips_saved
       G.GAME.pet_bowl_saved = 0
       if G.GAME.chips >= G.GAME.blind.chips then
         G.E_MANAGER:add_event(Event({
           func = function()
             --G.hand_text_area.blind_chips:juice_up()
             G.hand_text_area.game_chips:juice_up()
             play_sound("tarot1")
             return true
           end,
         }))
         return {
           message = localize("k_saved_ex"),
           saved = true,
           colour = G.C.PURPLE,
         }
       end
     end
     
     self.pos.x = G.GAME.round_resets.ante % 3
    end
  end
}


local igo = Game.init_game_object
function Game:init_game_object()
  local ret = igo(self)
  ret.pet_bowl_saved = 0
  return ret
end
