SMODS.Consumable {
  key = "rhea",
  set = "Planet",
  cost = 3,
  config = { hand_type = "ktsu_cat_dog"},
  atlas = "planets",
  pos = { x = 0, y = 0 },
  set_card_type_badge = function(self, card, badges)
    badges[1] = create_badge( localize("k_ktsu_moon"), get_type_colour( self or card.config, card ), nil, 1.2 )
  end,
  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge( localize("k_ktsu_art_credit_na"), G.C.PURPLE, nil, 0.9 )
  end,
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.hands["ktsu_cat_dog"].level,
        localize(card.ability.hand_type, "poker_hands"),
        G.GAME.hands["ktsu_cat_dog"].l_mult,
        G.GAME.hands["ktsu_cat_dog"].l_chips,
        colours = {
          (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)])
        },
      },
    }
  end
}
