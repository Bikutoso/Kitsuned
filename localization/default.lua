return {
    descriptions = {
      Joker = {
        j_ktsu_energetic_joker = {
          name = "Energetic Joker",
          text = {
            "{C:mult}+#1#{} Mult if played",
            "hand contains",
            "a {C:attention}#2#",
          },
        },
        j_ktsu_playful_joker = {
          name = "Playful Joker",
          text = {
            "{C:chips}+#1#{} Chips if played",
            "hand contains",
            "a {C:attention}#2#",
          },
        },
        j_ktsu_friend = {
          name = "The Friend",
          text = {
            "{X:mult,C:white}+#1#{} Mult if played",
            "hand contains",
            "a {C:attention}#2#",
          },
          unlock = {
            "Win a run",
            "without playing",
            "a {E:1,C:attention}#1#",
          },
        },
        j_ktsu_fox = {
          name = "Fox",
          text = {
            "Allows {C:attention}Cat/Dog{} to be",
            "made with nonstandard hands",
            "{C:inactive}(ex: {C:attention}10 9 7 6 5{C:inactive})",
          },
        },
      },
      Planet={
        c_ktsu_rhea = {
          name = "Rhea",
          text = {
            "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
            "{C:attention}#2#",
            "{C:mult}+#3#{} Mult and",
            "{C:chips}+#4#{} chips",
          },
        },
      },
    },
    misc = {
        dictionary = {
          ["k_ktsu_moon"] = "Moon"
        },
        poker_hands={
          ["ktsu_cat_dog"] = "Cat/Dog",
        },
        poker_hand_descriptions={
          ["ktsu_cat_dog"] = {
            "From a set high to set low",
            "with non-pair cards inbetween",
            "(A-9, K-8, 8-3, 7-2)",
          }
        }
    }
}
