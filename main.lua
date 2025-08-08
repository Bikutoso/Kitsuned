local available_modules = {
  [""] = { --Item Root
    "content.lua",
  },
  ["utilities"] = {
    "compare.lua",
  },
  ["jokers"] = {
    "energetic_joker.lua",
    "playful_joker.lua",
    "friend.lua",
    "fox.lua",
    "pet_bowl.lua",
    "rain.lua",
  },
  ["pokerhands"] = {
    "cat_dog.lua",
  },
  --["tarots"] = {}, --Disabled for the moment
  ["planets"] = {
    "rhea.lua",
  },
  ["challanges"] = {
    "self_made.lua",
  },
  ["achievements"] = {
   "what_are_the_odds.lua",
  },
}

for module_name, module in pairs(available_modules) do
  for _, file in ipairs(module) do
    sendInfoMessage("Loading: ./items/"..module_name.."/"..file, "ktsu")
    assert(SMODS.load_file("items/"..module_name.."/"..file))()
  end
end
