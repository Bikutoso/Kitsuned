
SMODS.Joker {
  key = "energetic_joker",
  blueprint_compat = true,
  rarity = 1,
  cost = 4,
  atlas = "jokers",
  pos = { x = 0, y = 0},
  config = { extra = { mult = 12, type = "ktsu_cat_dog" } },
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge( localize("k_ktsu_art_credit_biku"), G.C.PURPLE, nil, 0.9 )
  end,
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        localize(card.ability.extra.type, "poker_hands")
      }
    }
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
  config = { extra = { chips = 100, type = "ktsu_cat_dog" } },
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge( localize("k_ktsu_art_credit_biku"), G.C.PURPLE, nil, 0.9 )
  end,
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        localize(card.ability.extra.type, "poker_hands")
      }
    }
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
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge( localize("k_ktsu_art_credit_biku"), G.C.PURPLE, nil, 0.9 )
  end,
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.Xmult,
        localize(card.ability.extra.type, "poker_hands")
      }
    }
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
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge( localize("k_ktsu_art_credit_biku"), G.C.PURPLE, nil, 0.9 )
  end,
  loc_vars = function(self, info_queue, card)
    return {}
  end,
}
SMODS.Joker {
  key = "pet_bowl",
  blueprint_compat = false,
  rarity = 3,
  cost = 12,
  unlocked = false,
  no_pool_flag = "ktsu_pet_bowl_in_deck",
  atlas = "jokers",
  pos = { x = 0, y = 1},
  config = { extra = {score_saved = 0} },
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge( localize("k_ktsu_art_credit_biku"), G.C.PURPLE, nil, 0.9 )
  end,
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.score_saved
      }
    }
  end,
  calculate = function(self, card, context)
    calc_texture = function()
      local chips_saved = card.ability.extra.score_saved
      local blind_score = G.GAME.blind.chips
      local old_texture = self.pos.x

      -- BUG: Until updated texture can be wrong if sold and rebought, or reload a save.
      if chips_saved >= blind_score * 2 then -- Well 2 times blind
        self.pos.x = 2
      elseif chips_saved >= blind_score then -- Above blind
        self.pos.x = 1
      else -- Under blind
        self.pos.x = 0
      end
      if not old_texture == self.pos.x then return true end
    end
  
    -- Ensure only one joker can exist
    if context.buying_card and card == self then
      G.GAME.pool_flags.ktsu_pet_bowl_in_deck = true
    end

    -- Spawn joker again if sold
    if context.selling_card and card == self then
      G.GAME.pool_flags.ktsu_pet_bowl_in_deck = false
      card.ability.extra.score_saved = 0 -- Forcefully reset joker and sprite
      self.pos.x = 0
    end

    -- Update texture for each blind
    if context.setting_blind or context.skip_blind then
      calc_texture()
      --TODO: Card jiggle on texture change
    end
    
    -- Chip save
    if context.end_of_round and context.main_eval and not context.blueprint then
     local chips_saved = card.ability.extra.score_saved
     local chips_excess = G.GAME.chips - G.GAME.blind.chips
     
     if chips_excess > 0 then
       local sound_variants = {"ktsu_crunch1", "ktsu_crunch2", "ktsu_crunch3", "ktsu_crunch4"}
       G.GAME.chips = G.GAME.chips - chips_excess
       card.ability.extra.score_saved = chips_saved + chips_excess
       calc_texture()

       G.E_MANAGER:add_event(Event({
         func = function()
           G.hand_text_area.game_chips:juice_up()
           play_sound(pseudorandom_element(sound_variants, "cruncho", nil))
           return true
         end,
       }))
       return {
         message = localize("k_ktsu_crunch"),
         colour = G.C.PURPLE,
         card = card,
       }
     end
     load = function(self, card, card_table, other_card)
      local chips_saved = card.ability.extra.score_saved
      local blind_score = G.GAME.blind.chips

      if chips_saved >= blind_score * 2 then -- Well 2 times blind
        self.pos.x = 2
      elseif chips_saved >= blind_score then -- Above blind
        self.pos.x = 1
      else -- Under blind
        self.pos.x = 0
      end
     end
   end

   -- Game Over handeling
   if context.end_of_round and context.game_over and not context.blueprint then
     local chips_saved = card.ability.extra.score_saved
     
     G.GAME.chips = G.GAME.chips + chips_saved
     card.ability.extra.score_saved = 0
     self.pos.x = 0 -- No need to calculate new texture
     
     if G.GAME.chips >= G.GAME.blind.chips then
       G.E_MANAGER:add_event(Event({
         func = function()
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
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 10, G.PROFILES[G.SETTINGS.profile].career_stats.c_losses}}
  end,
  check_for_unlock = function(self, args)
    if args.type == 'career_stat' and args.statname == 'c_losses' then
      return G.PROFILES[G.SETTINGS.profile].career_stats[args.statname] >= 10
    end
    return false
  end
}

SMODS.Joker {
  key = "rain",
  rarity = 1,
  atlas = "jokers",
  pos = { x = 4, y = 0},
  config = { extra = { chips = 0, chip_gain = 15, chip_loss = 25 }},
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge( localize("k_ktsu_art_credit_biku"), G.C.PURPLE, nil, 0.9 )
  end,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain, card.ability.extra.chip_loss }}
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chip_mod = card.ability.extra.chips,
        message = localize { type = "variable", key = "a_chips", vars = { card.ability.extra.chips }}
      }
    end
    if context.before and not context.blueprint then
      card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
      return {
        message = localize("k_upgrade_ex"),
        colour = G.C.CHIPS,
        card = card
      }
    end
    if (( context.end_of_round and context.cardarea == G.jokers ) or context.skip_blind ) and not context.blueprint then
      card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_loss
      if card.ability.extra.chips <= 0 then
        card.ability.extra.chips = 0
        return nil
      end
      return {
        message = localize("k_ktsu_downgrade"),
        --colour = G.C.CHIPS,
        card = card
      }
    end
  end
}

