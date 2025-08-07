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
