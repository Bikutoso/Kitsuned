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
            "{X:mult,C:white}X#1#{} Mult if played",
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
            "{C:attention}Cat/Dog{} can to be",
            "made with nonstandard hands",
            "{C:inactive}(ex: {C:attention}Q-7, 10-5{C:inactive})",
          },
        },
        j_ktsu_pet_bowl = {
          name = "Pet Bowl",
          text = {
            "Surplus chips saved",
            "to try and prevent death",
            "{C:inactive}(Currnetly {X:purple,C:white}#1#{C:inactive} Chips)"
          },
          unlock = {
            "Lose {C:attention,E:1}#1#{} runs",
            "{C:inactive}(#2#)",
          },
        },
        j_ktsu_rain = {
          name = "Rain",
          text = {
            "Gains {C:chips}+#2#{} Chips",
            "per hand played.",
            "Loose {C:chips}-#3#{} Chips",
            "after each {C:attention}Blind{}",
            "{C:inactive}(Currnetly {C:chips}+#1#{C:inactive} Chips)",
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
      Tarot = {
        c_ktsu_worn_tarot = {
          name = "Worn Card",
          text = {
            "Upgrades cards with",
            "existing enhancments",
            "{C:inactive}(Cannot upgrade same card twice)",
          },
        },
      },
    },
    misc = {
        challenge_names = {
          c_ktsu_self_made = "Self Made",
        },
        achievement_names = {
          ["ach_ktsu_what_are_the_odds"] = "What are the odds?",
        },
        achievement_descriptions = {
          ["ach_ktsu_what_are_the_odds"] = "1 in 100,000,000",
        },
        dictionary = {
          ["k_ktsu_art_credit_biku"] = "Art: Bikutoso",
          ["k_ktsu_moon"] = "Moon",
          ["k_ktsu_crunch"] = "Crunch",
          ["k_ktsu_downgrade"] = "Downgrade!"
        },
        poker_hands = {
          ["ktsu_cat_dog"] = "Cat/Dog",
        },
        poker_hand_descriptions = {
          ["ktsu_cat_dog"] = {
            "Defined High and Low card",
            "cards inbetween unplayed",
            "(A-9, K-8, 8-3, 7-2)",
          },
        }
    }
}
