
SMODS.Joker {
  key = "ribbon",
  blueprint_compat = true,
  unlocked = false,
  rarity = 4,
  cost = 12,
  atlas = "jokers",
  pos = { x = 0, y = 2},
  soul_pos = { x = 1, y = 2},
  config = {mult_gain = 0.01, extra = {mult = 1.0} },
  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge( localize("k_ktsu_art_credit_biku"), G.C.PURPLE, nil, 0.9 )
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = {
      1.0 + (card.ability.mult_gain * G.PROFILES[G.SETTINGS.profile].progress.challenges.tally),
      card.ability.mult_gain
      }}
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      if next(SMODS.find_mod("Talisman")) then 
        return {
          Emult_mod = card.ability.extra.mult,
          message = localize({type = "variable", key = "a_emult", vars = {card.ability.extra.mult}}),
          colour = G.C.DARK_EDITION
        }
      else
        return {
          mult = (mult ^ card.ability.extra.mult) - mult,
          remove_default_message = true,
          message = localize({type = "variable", key = "a_emult", vars = {card.ability.extra.mult}}),
          colour = G.C.DARK_EDITION,
        }
      end
    end
  end,
  
  set_ability = function(self, card, initial, delay_sprites)
    card.ability.extra.mult = 1.0 + (card.ability.mult_gain * G.PROFILES[G.SETTINGS.profile].progress.challenges.tally)
  end,

  -- HACK: Legendary jokers forcfully have the Sould Card unlock condition and text.
  --   This forces the joker to be unobtanable until my unlock condition unlocks the card.
  --   Unlock Text is still wrong but likley no way around that outside patches
  in_pool = function(self, args)
      return self.unlocked and args.source == "sou"
  end,
 
  locked_loc_vars = function(self, info_queue, card)
    return { vars = {}}
  end,

  check_for_unlock = function(self, args)
    if G.PROFILES[G.SETTINGS.profile].progress.challenges and G.PROFILES[G.SETTINGS.profile].progress.challenges.tally >= 1 then
      return true
    end
    return false
  end,
}
