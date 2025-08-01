function calculate_cat_dog(hand, display)
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
  local high_low_raw = {["high"] = "2", ["low"] = "Ace"}
  local high_low = {}
  for i, card in ipairs(hand) do
    -- Note but we do want stone if kicker?
    if SMODS.has_no_suit(card) then return {} end -- Not valid hand if stone

    local current_card = card.base.value
    local current_card_int = SMODS.Ranks[current_card].pos.x
    if SMODS.Ranks[high_low_raw["high"]].pos.x < current_card_int then
      high_low_raw["high"] = current_card
      high_low[i] = card
    elseif SMODS.Ranks[high_low_raw["low"]].pos.x > current_card_int then
      high_low_raw["low"] = current_card
      high_low[i] = card
    else
      high_low[i] = {}
    end
  end    
  -- Find Valid Hand
  if poker_hands[high_low_raw["high"]] then
    local played_hand = poker_hands[high_low_raw["high"]][high_low_raw["low"]]

    if display then return played_hand or {} end -- Display Text

    if not played_hand then return {} end -- Non Valid hand 
    if played_hand == "Fox" and not fox_present then return {} end -- If no fox don't fox
    return high_low
  end
end
