function get_cat_dog_hand_name(hand)
  local fox_present = next(SMODS.find_card("j_ktsu_fox")) and true or false

  -- TODO: Low Ace Fox?
  local poker_hands = {
    ["Ace"] = {["9"] = "Big Dog"},
    ["King"] = {["8"] = "Big Cat"},
    ["Queen"] = {["7"] = "Fox"},
    ["Jack"] = {["6"] = "Fox"},
    ["10"] = {["5"] = "Fox"},
    ["9"] = {["4"] = "Fox"},
    ["8"] = {["3"] = "Little Cat"},
    ["7"] = {["2"] = "Little Dog"}
  }

  local highest = hand[1].base.value
  local lowest = hand[2].base.value
  sendDebugMessage("High: "..highest.."\nLow: :"..lowest, "ktsu")
  -- Find Valid Hand
  if poker_hands[highest] then
    valid_hand = poker_hands[highest][lowest]
    if not fox_present and valid_hand == "fox" then return nil end

    return valid_hand
  end
end
