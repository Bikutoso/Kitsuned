
SMODS.PokerHand {
  key = "Cat/Dog",
  chips = 80,
  mult = 8,
  l_chips = 30,
  l_mult = 4,
  example = {
    { "S_K", true},
    { "S_Q", true},
    { "S_J", true},
    { "S_9", true},
    { "S_8", true},
 },
 evaluate = function(parts, hand)
  if not next(parts._all_pairs) then
    local valid_high_low = {
      ["Big Dog"] = {"Ace", "9"},
      ["Big Cat"] = {"King", "8"},
      ["Little Cat"] = {"8", "3"},
      ["Little Dog"] = {"7", "2"}}
    for hand_type, high_low in pairs(valid_high_low) do
      high = false
      low = false
      
      for i, card in ipars(hand) do
        if i == 1 and card.base.value == high_low[1] then
          high = true
        end
        if i == 5 and card.base.value == high_low[2] then
          low = true
        end
      end

      if high and low then
        return {hand}
      end
    end
  end
  return {}
 end,
}
