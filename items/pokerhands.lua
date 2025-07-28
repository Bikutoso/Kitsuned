
SMODS.PokerHand {
  key = 'cat_dog',
  chips = 30,
  mult = 4,
  l_chips = 30,
  l_mult = 3,
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

    if calculate_cat_dog(hand) then
      return {hand}
    end
  end,
  modify_display_text = function(self, cards, scoring_hand)
    hand_name = calculate_cat_dog(scoring_hand)
    
    if hand_name then
      return hand_name
    end
    
    return "Fox" --When neihter a cat or a dog it's a fox
  end
}
