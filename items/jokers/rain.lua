SMODS.Joker {
  key = "rain",
  rarity = 1,
  atlas = "jokers",
  pos = { x = 4, y = 0},
  config = { extra = { chips = 0, chip_gain = 15, chip_loss = 25 }},
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge( localize("k_ktsu_art_credit_biku"), G.C.PURPLE, nil, 0.9 )
  end,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain, card.ability.extra.chip_loss }}
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chip_mod = card.ability.extra.chips,
        message = localize { type = "variable", key = "a_chips", vars = { card.ability.extra.chips }}
      }
    end
    if context.before and not context.blueprint then
      card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
      return {
        message = localize("k_upgrade_ex"),
        colour = G.C.CHIPS,
        card = card
      }
    end
    if (( context.end_of_round and context.cardarea == G.jokers ) or context.skip_blind ) and not context.blueprint then
      card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_loss
      if card.ability.extra.chips <= 0 then
        card.ability.extra.chips = 0
        return nil
      end
      return {
        message = localize("k_ktsu_downgrade"),
        --colour = G.C.CHIPS,
        card = card
      }
    end
  end
}

