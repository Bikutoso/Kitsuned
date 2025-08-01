
SMODS.PokerHand {
  key = 'cat_dog',
  chips = 40,
  mult = 5,
  l_chips = 15,
  l_mult = 3,
  above_hand = "Straight",
  example = {
    {"S_K", true},
    {"C_Q", false},
    {"S_J", false},
    {"D_9", false},
    {"H_8", true}
  },
  evaluate = function(parts, hand)
    if #hand < 5 then return {} end
    if next(parts._all_pairs) or next(parts._straight) then return {} end

    high = next(parts._highest)
    low = next(parts.ktsu_lowest)

    sendDebugMessage("High: "..inspect(high).."\nLow: "..inspect(low), "ktsu")
    
    return { SMODS.merge_lists(parts._highest, parts.ktsu_lowest) }
    --return calculate_cat_dog(hand, false)
  end,
  modify_display_text = function(self, cards, scoring_hand)
    return "cat/dog"
    --return calculate_cat_dog(scoring_hand, true)
  end
}

SMODS.PokerHandPart {
  key = "lowest",
  func = function(hand)
    if #hand < 1 then return {} end
    local low_card = {}
    local low_raw = 11
    
    for _, card in ipairs(hand) do
      local card_value = card.base.value
      if SMODS.Ranks[card_value].pos.x < low_raw then
        low_card[1] = card
        low_raw = SMODS.Ranks[card_value].pos.x
      end
    end
    --sendDebugMessage("Part: "..inspectDepth(low_card), "ktsu")
    return low_card
  end
}
