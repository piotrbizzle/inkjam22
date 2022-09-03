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

== cake_king ==
- Hohhohohohoho lad it is I, your liege, CAKE KING!!!
- The remaining ransom is ${100 - score}
 + "Your Majesty!"
    -> ending
 + "You are a weird little guy."
    -> bad_ending
 + "Teleport me!"
    -> tp_ending
 + {inventory_has("fish")} "Give me a coin for this fish"
    -> fish_ending

== ending ==
- Good work. 
    + "Thanks"
    -> END

== bad_ending ==
- You will be punished for this. # send_to_zone0
    + "Seems Bad"
    ~ score = score - 10
    -> END
    
== tp_ending ==
- Bam! # send_to_zone0|-2.6|-1.6
    + "Wow"
    -> END
    
== fish_ending ==
- Deal #take_fish # give_coin
  + "Thanks"
  -> END