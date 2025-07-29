
SMODS.Atlas {
  key = "jokers",
  path = "jokers.png",
  px = 71,
  py = 95
}

SMODS.Joker {
  key = "energetic_joker",
  blueprint_compat = true,
  rarity = 1,
  cost = 4,
  atlas = "jokers",
  pos = { x = 0, y = 0},
  config = { extra = { mult = 12, type = "ktsu_cat_dog" } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, localize(card.ability.extra.type, "poker_hands") } }
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

SMODS.Joker {
  key = "playful_joker",
  blueprint_compat = true,
  rarity = 1,
  cost = 4,
  atlas = "jokers",
  pos = { x = 1, y = 0},
  config = { extra = { chips = 100, type = "ktsu_cat_dog" } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, localize(card.ability.extra.type, "poker_hands") } }
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

SMODS.Joker {
  key = "friend",
  unlocked = false,
  blueprint_compat = true,
  rarity = 3,
  cost = 8,
  atlas = "jokers",
  pos = { x = 2, y = 0},
  config = { extra = { Xmult = 3, type = "ktsu_cat_dog" } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult, localize(card.ability.extra.type, "poker_hands") } }
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
