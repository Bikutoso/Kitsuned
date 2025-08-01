
SMODS.PokerHand {
  key = 'cat_dog',
  chips = 30,
  mult = 4,
  l_chips = 30,
  l_mult = 2,
  above_hand = "Straight",
  example = {
    {"S_K", true},
    {"C_Q", true},
    {"S_J", true},
    {"D_9", true},
    {"H_8", true}
  },
  evaluate = function(parts, hand)
    if #hand < 5 then return {} end
    ---BUG: Deleting Shortcut while having a cat/dog selected still have Straight hand selected
    if next(parts._all_pairs) or next(parts._straight) then return {} end

    return calculate_cat_dog(hand) and {hand} or {}
  end,
  modify_display_text = function(self, cards, scoring_hand)
    return calculate_cat_dog(scoring_hand)
  end
}

-- NOTE: Removed until a lock system can be made.
--SMODS.PokerHand {
--  key = "glitched",
--  chips = 4.8e309,
--  mult = 4.8e309,
--  l_chips = 1,
--  l_mult = 1,
--  visible = false,
--  example = {
--    { 'S_10',false, edition = "e_holo",   enhancement = "m_gold",  seal = "Blue"},
--    { 'C_7', true,  edition = "e_negative",                         seal = "Gold"},
--    { 'C_9', false,  edition = "e_foil",   enhancement = "m_glass", seal = "Purple"},
--    { 'H_K', false,  edition = "e_holo",   enhancement = "m_steel", seal = "Red"},
--    { 'D_J', true,  edition = "e_negative",enhancement = "m_bonus", seal = "Purple"}
--  },
--  evaluate = function(parts, hand)
--      if math.random(1,1000000) == 1 then return { hand } end
--  end
--}
