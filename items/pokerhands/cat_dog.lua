
SMODS.PokerHand {
  key = 'cat_dog',
  chips = 35,
  mult = 5,
  l_chips = 25,
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
    local valid = get_cat_dog_hand_name(current_hand) -- Valid if has a name
    
    -- ISSUE: Some unplayed stone cards don't always produce valid hands.
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
      if not SMODS.has_no_suit(card) then -- HACK: No Stone in low
        if not lowest or card:get_nominal() < lowest:get_nominal() then
          lowest = card
        end
      end
    end
    
    if #hand > 0 then return {{lowest}} else return {} end
  end
}

function get_cat_dog_hand_name(hand)
  local fox_present = next(SMODS.find_card("j_ktsu_fox")) and true or false

  -- TODO: Low Ace Fox?
  local poker_hands = {
    ["Ace9"] = "Big Dog",
    ["King8"] = "Big Cat",
    ["Queen7"] = "Fox",
    ["Jack6"] = "Fox",
    ["105"] = "Fox",
    ["94"] = "Fox",
    ["83"] = "Little Cat",
    ["72"] = "Little Dog"
  }

  local highest = hand[1].base.value
  local lowest = hand[2].base.value

  -- Find Valid Hand
  valid_hand = poker_hands[highest..lowest]

  if not fox_present and valid_hand == "fox" then return nil end
  return valid_hand
end
