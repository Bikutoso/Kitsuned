function calculate_cat_dog(hand)

  local fox_present = false
  if next(SMODS.find_card("j_ktsu_fox")) then fox_present = true end

  local valid_high_low = {
    ["Big Dog"] = {12, 7},   -- Ace-9
    ["Big Cat"] = {11, 6},   -- King-8
    ["Little Cat"] = {6, 1}, -- 8-3
    ["Little Dog"] = {5, 0}  -- 7-2
  }
  local fox_high_low = {
    ["Fox Queen"] = {10, 5}, -- Queen-7
    ["Fox Jack"] = {9, 4},   -- Jack-6
    ["Fox Ten"] = {8, 3},    -- 10-5
    ["Fox Nine"] = {7, 2}    -- 9-4
  }
  
  local calculate = function(valid_hands, fox)
    --sendDebugMessage("Entered Func: "..(fox and "true" or "false"), "Ktsu")
    local select = {0, 14}
    local current_hand = nil
    for _, card in ipairs(hand) do
      current_hand = SMODS.Ranks[card.base.value].pos.x
      if select[1] < current_hand then select[1] = current_hand end
      if select[2] > current_hand then select[2] = current_hand end
    end

    for hand_type, high_low in pairs(valid_hands) do
      local high = nil
      local low = nil

      if select[1] == high_low[1] then high = high_low[1] end
      if select[2] == high_low[2] then low = high_low[2] end

      if high and low then
        --sendDebugMessage("Valid hand: "..hand_type, "Ktsi")
        if fox then return "Fox" end --If neihter a Cat or Dog it's a fox
        return hand_type
      end
    end
    return nil
  end

  --sendDebugMessage("Fox: "..(fox_present and "true" or "false"), "Ktsu")
  return nil or calculate(valid_high_low) or (fox_present and calculate(fox_high_low, true))
end
