
modules = {
  "jokers",
  "pokerhands",
  "planets",
  "utilities"
}


for _, module in ipairs(modules) do
  assert(SMODS.load_file("items/"..module..".lua"))()
end
