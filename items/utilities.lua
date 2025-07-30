function calculate_cat_dog(hand)

  local fox_present = false
  if next(SMODS.find_card("j_ktsu_fox")) then fox_present = true end

  local valid_high_low = {
    ["Big Dog"] = {"Ace", "9"},
    ["Big Cat"] = {"King", "8"},
    ["Little Cat"] = {"8", "3"},
    ["Little Dog"] = {"7", "2"}
  }
  local fox_high_low = {
    ["Fox Queen"] = {"Queen", "7"},
    ["Fox Jack"] = {"Jack", "6"},
    ["Fox Ten"] = {"10", "5"},
    ["Fox Nine"] = {"9", "4"}
  }

  -- Find higest and lowest played card
  local select = {0, 12}
  for _, card in ipairs(hand) do
    local current_hand = SMODS.Ranks[card.base.value].pos.x
    if select[1] < current_hand then select[1] = current_hand end
    if select[2] > current_hand then select[2] = current_hand end
  end

  local calculate = function(valid_hands, high_low, fox)
    -- Check if valid hand
    for hand_type, poker_hand in pairs(valid_hands) do
      local high = nil
      local low = nil

      if select[1] == SMODS.Ranks[poker_hand[1]].pos.x then high = poker_hand[1] end
      if select[2] == SMODS.Ranks[poker_hand[2]].pos.x then low = poker_hand[2] end

      if high and low then
        if fox then return "Fox" end --If neihter a Cat or Dog it's a fox
        return hand_type
      end
    end
    return nil
  end

  return nil or calculate(valid_high_low, select) or (fox_present and calculate(fox_high_low, select, true))
end
