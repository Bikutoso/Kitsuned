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
