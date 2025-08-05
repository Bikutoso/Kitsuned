SMODS.Consumable {
  key = "worn_tarot",
  set = "Tarot",
  atlas = "tarots",
  pos = { x = 0, y = 0 },
  cost = 3,
  set_sprites = function(self, card, front)
    -- Find a way to uniqe textures on each instance of the card
    self.pos.x = pseudorandom_element({0, 1, 2, 3, 4, 5, 6}, pseudoseed("worn"), nil)
  end,
  can_use = function(self, card)
    return false --Temporary
  end
}
