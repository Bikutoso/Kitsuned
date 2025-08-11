
SMODS.Joker {
  key = "champion",
  rarity = 3,
  cost = 8,
  atlas = "jokers",
  pos = { x = 3, y = 1},
  config = { extra = {mult = 1.05} },
  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge( localize("k_ktsu_art_credit_biku"), G.C.PURPLE, nil, 0.9 )
  end,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    -- G.PROFILES[G.SETTINGS.profile].challenges.tally
    if context.joker_main then
      return {
        Emult_mod = card.ability.extra.mult,
        message = localize({type = "variable",key = "a_mult",vars = {card.ability.extra.mult},}),
        colour = G.C.DARK_EDITION
      }
    end
  end,
}
