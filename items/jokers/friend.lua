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
    badges[#badges + 1] = create_badge( localize("k_ktsu_art_credit_na"), G.C.PURPLE, nil, 0.9 )
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
