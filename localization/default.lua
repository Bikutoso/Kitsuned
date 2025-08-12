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
            "Surplus score saved",
            "for use in a Game Over",
            "{C:inactive}(Currently {X:purple,C:white}#1#{C:inactive})"
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
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
          },
        },
        j_ktsu_ribbon = {
          name = "Ribbon",
          text = {
            "This Joker Gains",
            "{X:dark_edition,C:white}^0.01{} Mult for every",
            "{C:attention}Challenge{} completed",
            "{C:inactive}(Currently {X:dark_edition,C:white}^#1#{C:inactive} Mult)",
          },
          unlock = {
            "Complete a {C:attention, E:1} Challenge",
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
      },
    },
    misc = {
        challenge_names = {
        },
        achievement_names = {
          ["ach_ktsu_what_are_the_odds"] = "What are the odds?",
        },
        achievement_descriptions = {
          ["ach_ktsu_what_are_the_odds"] = "1 in 100,000,000",
        },
        dictionary = {
          ["k_ktsu_art_credit_biku"] = "Art: Bikutoso",
          ["k_ktsu_art_credit_na"] = "Art: N/A", -- Slight modifications to base assets
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
        },
        v_dictionary={
          a_emult = {"^#1# Mult"},
        },
    }
}
