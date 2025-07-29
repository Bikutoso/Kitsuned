function calculate_cat_dog(hand)

  -- Table probbably easier way of doing this, just don't know how
  local card_order = {
    ["Ace"] = 14, ["King"] = 13, ["Queen"] = 12, ["Jack"] = 11,
    ["10"] = 10, ["9"] = 9, ["8"] = 8, ["7"] = 7, ["6"] = 6,
    ["5"] = 5, ["4"] = 4, ["3"] = 3, ["2"] = 2
    }

  local valid_high_low = {
    ["Big Dog"] = {"Ace", "9"},
    ["Big Cat"] = {"King", "8"},
    ["Little Cat"] = {"8", "3"},
    ["Little Dog"] = {"7", "2"}
    }

  local select = {0, 14}
  for _, card in ipairs(hand) do
    local current_hand = card_order[card.base.value]
    if select[1] < current_hand then select[1] = current_hand end
    if select[2] > current_hand then select[2] = current_hand end
  end

  for hand_type, high_low in pairs(valid_high_low) do
    local high = nil
    local low = nil

    if select[1] == card_order[high_low[1]] then
      high = high_low[1]
    end
    if select[2] == card_order[high_low[2]] then
      low = high_low[2]
    end

    if high and low then
      return hand_type
    end
  end

  return nil
end
