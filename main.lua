
SMODS.Sound {
  key = "crunch1",
  path = "crunch1.ogg"
}

SMODS.Sound {
  key = "crunch2",
  path = "crunch2.ogg"
}

SMODS.Sound {
  key = "crunch3",
  path = "crunch3.ogg"
}

SMODS.Sound {
  key = "crunch4",
  path = "crunch4.ogg"
}

modules = {
  "jokers",
  "pokerhands",
  "planets",
  "achievements",
  "utilities"
}


for _, module in ipairs(modules) do
  assert(SMODS.load_file("items/"..module..".lua"))()
end
