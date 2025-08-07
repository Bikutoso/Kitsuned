
modules = {
  "content",
  "jokers",
  "pokerhands",
  --"tarots", --Disabled for the moment
  "planets",
  "challanges",
  "achievements",
  "utilities"
}


for _, module in ipairs(modules) do
  assert(SMODS.load_file("items/"..module..".lua"))()
end
