
SMODS.PokerHand {
  key = 'cat_dog',
  chips = 80,
  mult = 8,
  l_chips = 30,
  l_mult = 4,
  example = {
    { 'S_K', true},
    { 'C_Q', true},
    { 'S_J', true},
    { 'D_9', true},
    { 'H_8', true}
 },
 evaluate = function(parts, hand)
  if #hand < 5 then return {} end
  if next(parts._all_pairs) then return {} end
  
  local valid_high_low = {
    ["Big Dog"] = {"Ace", "9"},
    ["Big Cat"] = {"King", "8"},
    ["Little Cat"] = {"8", "3"},
    ["Little Dog"] = {"7", "2"}
    }

  for hand_type, high_low in pairs(valid_high_low) do
    high = nil
    low = nil
    
    for i = 1, #hand do
      sendDebugMessage("Curhand: "..hand[i].base.value, "Ktsu")
      if not i == 1 or not i == 5 then
        local current_hand = hand[i].base.value
        if current_hand == high_low[1] then
          sendDebugMessage("Hightrue: "..hand[i].base.value, "Ktsu")
          high = current_hand
        end
        if current_hand == high_low[2] then
          sendDebugMessage("Lowtrue: "..hand[i].base.value, "Ktsu")
          low = current_hand
        end
      end
    end

    if high and low then
      return {hand}
    end

  end
 end
}
