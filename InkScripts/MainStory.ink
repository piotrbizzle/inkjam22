VAR inventory_0 = ""
VAR inventory_1 = ""
VAR inventory_2 = ""
VAR score = 0

== function inventory_has(item) ==
{
    - inventory_0 == item:
        ~ return true
    - inventory_1 == item:
        ~ return true
    - inventory_2 == item:
       ~ return true
}
    ~ return false
    
== page_fries ==
- TOWRITE teach you fries
+ "Okay"
    -> END

== page_fish_and_chips ==
- TOWRITE teach you fish and chips
+ "Okay"
    -> END
    
== tutorial_cake_king ==
- TOWRITE Cake King welcomes you and asks for fish and chips
+ "Okay"
    -> END
    
== tutorial_wizard ==
- TOWRITE Wizard teachs you how to cook
+ "Okay"
    -> END
    

== tutorial_cooker ==
- You fire up the ol' cooker! Time to make some food! 
+ {inventory_has("potato") && inventory_has("oil")} Fries
    -> tutorial_cooker_fries
+ {inventory_has("fries") && inventory_has("fish")} Fish and Chips
    -> tutorial_cooker_fish_and_chips
+ Cook nothing
    -> END
    
== tutorial_cooker_fries ==
- You made some fries! Greasy! # take_potato # take_oil # give_fries
+ Nice
    -> END

== tutorial_cooker_fish_and_chips ==
- You made some fish and chips! How positively English of you! # take_fries # take_fish # give_fishAndChips
+ Nice
    -> END
