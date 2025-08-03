
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
    if #hand < SMODS.four_fingers() then return {} end
    if next(parts._all_pairs) or next(parts._straight) then return {} end

    local current_hand = SMODS.merge_lists(parts._highest, parts.ktsu_lowest)
    local valid = get_cat_dog_hand_name(current_hand)
    
    
    if valid then return { current_hand } else return {} end
  end,
  modify_display_text = function(self, cards, scoring_hand)
    return get_cat_dog_hand_name(scoring_hand)
  end
}

SMODS.PokerHandPart {
  key = "lowest",
  func = function(hand)
    local lowest = nil

    for _, card in ipairs(hand) do
      if not lowest or card:get_nominal() < lowest:get_nominal() then
        lowest = card
      end
    end
    
    if #hand > 0 then return {{lowest}} else return {} end
  end
}
