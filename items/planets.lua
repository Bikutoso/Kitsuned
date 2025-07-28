
SMODS.Consumable {
  set = "Planet",
  key = "moon",
  cost = 3,
  config = { hand_type = "ktsu_cat_dog"},
  pos = {x = 0, y = 0},
  atlas = "planet",
  set_card_type_badge = function(self, card, badges)
    badges[1] = create_badge(localize("k_ktsu_moon"), get_type_colour(card.config.center, card), nil, 1.2)
  end,
  loc_vars = function(self, info_queue, center)
    return {
      vars = {
        G.GAME.hands[center.ability.hand_type].level,
        localize(center.ability.hand_type, "poker_hands"),
        G.GAME.hands[center.ability.hand_type].l_mult,
        G.GAME.hands[center.ability.hand_type].l_chips,
        colours = {
          (G.GAME.hands[center.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[center.ability.hand_type].level)])
        }
      }
    }
  end
}
