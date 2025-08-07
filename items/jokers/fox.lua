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
