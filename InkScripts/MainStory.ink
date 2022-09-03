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

== tutorial_cake_king ==
- Hohhohohohoho lad it is I, your liege, CAKE KING!!!
- The remaining ransom is ${100 - score}
 + "Your Majesty!"
    -> ending

== ending ==
- Good work. # send_to_throneRoom|1
    + "Thanks"
    -> END
