SMODS.Atlas {
  key = "achievements",
  path = "achievements.png",
  px = 66,
  py = 66
}

SMODS.Achievement {
  key="what_are_the_odds",
  atlas = "achievements",
  pos = { x = 0, y = 0 },
  bypass_all_unlocked = true,
  hidden_text = true,
  unlock_condition = function(self, args)
    if args.handname then
      -- Until glitched hand is fixed just a random chance each hand played
      if math.random(1,1000000) == 1 then return true end
    end
    --if args.handname == "ktsu_glitched" then
    --  return true
    --end
  end
}
