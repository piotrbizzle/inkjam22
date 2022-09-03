VAR inventory_0 = ""
VAR inventory_1 = ""
VAR inventory_2 = ""

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
Hohhohohohoho lad it is I, your liege, CAKE KING!!!
 + "Your Majesty!"
    -> ending
 + "You are a weird little guy."
    -> bad_ending
 + {inventory_has("fish")} "Look at this fish"
    -> fish_ending

== ending ==
- Good work
    + "Thanks"
    -> END

== bad_ending ==
- You will be punished for this.
    + "Seems Bad"
    -> END
    
== fish_ending ==
- Nice fish.
  + "Thanks"
  -> END