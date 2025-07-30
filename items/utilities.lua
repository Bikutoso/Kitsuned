function calculate_cat_dog(hand)

  local fox_present = false
  if next(SMODS.find_card("j_ktsu_fox")) then fox_present = true end

  -- NOTE: Maybe more efficent to instead of itterating through every hand
  --  high_low high card from table then low to find hand played.
  --  Would also remove make all fox hands the same removing need for checking
  local poker_hands = {
    ["Big Dog"] = {"Ace", "9"},
    ["Big Cat"] = {"King", "8"},
    ["Little Cat"] = {"8", "3"},
    ["Little Dog"] = {"7", "2"}
  }
  local poker_hands_fox = {
    ["Fox Queen"] = {"Queen", "7"},
    ["Fox Jack"] = {"Jack", "6"},
    ["Fox Ten"] = {"10", "5"},
    ["Fox Nine"] = {"9", "4"}
  }

  -- Find higest and lowest played card
  local high_low = {0, 12}
  for _, card in ipairs(hand) do
    local current_hand = SMODS.Ranks[card.base.value].pos.x
    if high_low[1] < current_hand then high_low[1] = current_hand end
    if high_low[2] > current_hand then high_low[2] = current_hand end
  end

  local calculate = function(valid_hands, high_low, fox)
    -- Check if valid hand
    for hand_type, current_hand in pairs(valid_hands) do
      local high = nil
      local low = nil

      if high_low[1] == SMODS.Ranks[current_hand[1]].pos.x then high = current_hand[1] end
      if high_low[2] == SMODS.Ranks[current_hand[2]].pos.x then low = current_hand[2] end

      if high and low then
        if fox then return "Fox" end --If neihter a Cat or Dog it's a fox
        return hand_type
      end
    end
    return nil
  end

  return nil or calculate(poker_hands, high_low) or (fox_present and calculate(poker_hands_fox, high_low, true))
end
