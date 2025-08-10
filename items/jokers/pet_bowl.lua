SMODS.Joker {
  key = "pet_bowl",
  blueprint_compat = false,
  rarity = 3,
  cost = 12,
  unlocked = false,
  no_pool_flag = "ktsu_pet_bowl_in_deck",
  atlas = "jokers",
  pos = { x = 0, y = 1},
  config = { extra = {score_saved = 0, current_ante = 1} },
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge( localize("k_ktsu_art_credit_biku"), G.C.PURPLE, nil, 0.9 )
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.score_saved } }
  end,
 
  calculate = function(self, card, context)
    -- Ensure only one joker can exist
    if context.buying_card and card == self then
      G.GAME.pool_flags.ktsu_pet_bowl_in_deck = true
    end

    -- Spawn joker again if sold
    if context.selling_card and card == self then
      G.GAME.pool_flags.ktsu_pet_bowl_in_deck = false
    end

    -- Update texture at start of ante
    if G.GAME.round_resets.ante > card.ability.extra.current_ante then
      card.ability.extra.current_ante = G.GAME.round_resets.ante
      card.children.center:set_sprite_pos({ x = self._new_pos_x(card.ability.extra.score_saved), y = 1})
      --TODO: Card jiggle on texture change
      --card:children.center:juice_up()
    end
    
    -- Chip save
    if context.end_of_round and context.main_eval and not context.blueprint then
     local chips_excess = G.GAME.chips - G.GAME.blind.chips

     if safe_compare(chips_excess, ">", 0) then
       local sound_variants = {"ktsu_crunch1", "ktsu_crunch2", "ktsu_crunch3", "ktsu_crunch4"}

       G.GAME.chips = G.GAME.blind.chips
       card.ability.extra.score_saved = card.ability.extra.score_saved + chips_excess
       card.children.center:set_sprite_pos({ x = self._new_pos_x(card.ability.extra.score_saved), y = 1})

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
    end

   -- Game Over handeling
   if context.end_of_round and context.game_over and not context.blueprint then
     local chips_saved = card.ability.extra.score_saved

     G.GAME.chips = G.GAME.chips + chips_saved
     card.ability.extra.score_saved = 0
     card.children.center:set_sprite_pos({x = 0, y = 1}) -- No need to calculate new texture
     
     if safe_compare(G.GAME.chips, ">=", G.GAME.blind.chips) then
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
  
  load = function(self, card, card_table, other_card)
    local chips_saved = card.ability.extra.score_saved
    card.children.center:set_sprite_pos({ x = self._new_pos_x(chips_saved), y = 1})
  end,
  
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 10, G.PROFILES[G.SETTINGS.profile].career_stats.c_losses}}
  end,
  
  check_for_unlock = function(self, args)
    if args.type == 'career_stat' and args.statname == 'c_losses' then
      return G.PROFILES[G.SETTINGS.profile].career_stats[args.statname] >= 10
    end
    return false
  end,

  _new_pos_x = function(score_saved)
    local score_blind = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.starting_params.ante_scaling
    if safe_compare(score_saved, ">=", score_blind * 2) then return 2 end
    if safe_compare(score_saved, ">=", score_blind) then return 1 end
    return 0
  end
}
