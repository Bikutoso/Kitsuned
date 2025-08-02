
SMODS.PokerHand {
  key = 'cat_dog',
  chips = 40,
  mult = 4,
  l_chips = 25,
  l_mult = 2,
  above_hand = "Straight",
  example = {
    {"S_K", true},
    {"C_Q", true},
    {"S_J", true},
    {"D_9", true},
    {"H_8", true}
  },
  evaluate = function(parts, hand)
    if #hand < 5 then return {} end
    ---BUG: Deleting Shortcut while having a cat/dog selected still have Straight hand selected
    if next(parts._all_pairs) or next(parts._straight) then return {} end

    return calculate_cat_dog(hand) and {hand} or {}
  end,
  modify_display_text = function(self, cards, scoring_hand)
    return calculate_cat_dog(scoring_hand)
  end
}
