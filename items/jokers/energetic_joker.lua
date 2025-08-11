SMODS.Joker {
  key = "energetic_joker",
  blueprint_compat = true,
  rarity = 1,
  cost = 4,
  atlas = "jokers",
  pos = { x = 0, y = 0},
  config = { extra = { mult = 12, type = "ktsu_cat_dog" } },
  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge( localize("k_ktsu_art_credit_na"), G.C.PURPLE, nil, 0.9 )
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

