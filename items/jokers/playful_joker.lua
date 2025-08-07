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
