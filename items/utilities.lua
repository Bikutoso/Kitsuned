function calculate_cat_dog(hand)
  local fox_present = false
  if next(SMODS.find_card("j_ktsu_fox")) then fox_present = true end

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
  -- Find higest and lowest played card
  local high_low = {{0, nil}, {12, nil}} -- Integer Value, Card Name
  for _, card in ipairs(hand) do
    if SMODS.has_no_suit(card) then return {} end -- Not valid hand if stone
  
    local current_hand = SMODS.Ranks[card.base.value].pos.x
    if high_low[1][1] < current_hand then high_low[1] = {current_hand, card.base.value} end
    if high_low[2][1] > current_hand then high_low[2] = {current_hand, card.base.value} end
  end

  -- Find Valid Hand
  local high = high_low[1][2]
  local low = high_low[2][2]
  if poker_hands[high] then
    local played_hand = poker_hands[high][low]
    if played_hand == "Fox" and not fox_present then return {} end -- If no fox don't fox
    return played_hand
  end
end
