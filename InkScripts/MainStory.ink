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
- \= Fries Recipe \=
- 1 Potato
- 1 Oil
+ "Okay"
    -> END

== page_fish_and_chips ==
- \= Fish and Chips Recipe \=
- 1 Fish
- 1 Fries
+ "Okay"
    -> END
    
== page_banana_split ==
- \= Banana Split Recipe \=
- 1 Banana
- 1 Ice Cream with Syrup
+ "Okay"
    -> END
    
== tutorial_cake_king ==
- My royal chef! It's so good to see you this morning. The Gentlebirds are singing and everything is lovely in the kingdom. It's incredible!
+ "Yes, Cake King, it is!"
- ...YET, I cannot escape the feeling that something terrible is about to happen.
+ "What do you mean, your majesty?"
- Perhaps it's nothing. Perhaps I'm just hungry. Why don't you whip me up some fish and chips? If you forget how, go talk to The Royal Wizard, Wizzy Woo, in the room to the West.
+ {inventory_has("fishAndChips")} "Here is your Fish and Chips, my liege"
    -> tutorial_cake_king_give_fish
+ "Okay"
    -> END
    
== tutorial_cake_king_give_fish ==
- Yum yum yum. By the way, do you like the new rug? It commerates our adventure together last year. Remember that? 
- I'm sure nothing that crazy will ever happen in our quiet kingdom EVER again #take_fishAndChips # send_to_throneRoomTut|3|-1.2|0.35
+ "What's that noise?"
  -> END
  
== tutorial_hostage ==
- \(A kingly figure made of Oatmeal Raisin dough emerges from the shadows and holds a knife to Cake King's throat\)
- I'm taking your big idiot king hostage! If you ever want to see him again, come find me in THE SWEETYVERSE. I'll be waiting...
+ "THE SWEETYVERSE???"
-  \(The mysterious interloper steps through a purple portal, taking Cake King with him!\) # send_to_throneRoomTut|0
+ "Alas!"
    -> END

    
== tutorial_wizard ==
- Royal Chef! You haven't really forgotten how to cook have you??
+ "Well..."
- It's easy! You can pick up items in the world like that bottle of Oil to my right with the E key and drop them with Q key.
+ "Pick up with E and drop with Q. Easy enough."
- You can interact with your Cooker in the kitchen to the North by walking up to it and pressing Spacebar. If you're holding all the ingredients for a recipe, you'll be able to cook it!
+ "How will I know what I need?"
- Some recipes are recorded on Recipe Pages like the one to the left of me there. If you walk up to one and press Space, you'll be able to read the recipe!
- But listen! Not all recipes are written down! You'll have to come up with some on your own
+ "Okay, I can do that"
    -> END
    
== tutorial_wizard_2 ==
- \(You tell Wizzy Woo what happened\)
- Good gravy! Did you say THE SWEETYVERSE? As luck would have it, I've been studying THE SWEETYVERSE!
+ "Ohh?"
- Yes! It's a universe parallel to our own, and the home of all things sweet and desserty. Just this morning, I was able to open a portal to THE SWEETYVERSE for the first time!
+ "What a coincidence!"
- Indeed! That purple oval in my summoning area is a portal directly to THE SWEETYVERSE. If you walk up to it and press Spacebar, you'll step through to the other side. But tread carefully! Portals act in strange and mysterious ways
+ "Strange and mysterious ways?"
- Raw ingredients carried through the portal change to become their parallel universe counterpart. For example, that bottle of Oil on my desk turns into Chocolate Syrup in THE SWEETYVERSE.
+ "How strange!"
- BUT, prepared dishes seem to only exist in one universe at a time. If you prepare something in your Cooker and carry it through a portal, it won't change!
+ "How mysterious!"
- I know that's a lot to take in. Before I can let you loose to find Cake King, I need to know you understand the strange mysteriousness of portals.
- Why don't you make me a nice Banana Split? Everything you need should be in this castle.
+ {inventory_has("bananaSplit")} "Here is the Banana Split you wanted"
    -> tutorial_wizard_2_give_banana
+ "One Banana Split coming up!"
    -> END
    
== tutorial_wizard_2_give_banana ==
- Fantastic work, chef! I'm confident you're ready to travel to THE SWEETYVERSE and rescue Cake King. God speed! # take_bananaSplit #send_to_wizardRoom
+ "I'll do my best!"
    -> END

== tutorial_cooker ==
- You fire up the ol' cooker! Time to make some food! 
+ {inventory_has("potato") && inventory_has("oil")} Fries
    -> tutorial_cooker_fries
+ {inventory_has("fries") && inventory_has("fish")} Fish and Chips
    -> tutorial_cooker_fish_and_chips
+ {inventory_has("iceCream") && inventory_has("chocolateSyrup")} Ice Cream with Syrup
    -> tutorial_cooker_ice_cream_with_syrup
+ {inventory_has("iceCreamWithSyrup") && inventory_has("banana")} Banana Split
    -> tutorial_cooker_banana_split
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
    
== tutorial_cooker_ice_cream_with_syrup ==
- You made some Ice Cream with Syrup! Decadent! # take_iceCream # take_chocolateSyrup # give_iceCreamWithSyrup
+ Nice
    -> END
    
== tutorial_cooker_banana_split ==
- You made a Banana Split! It's healthy now! # take_iceCreamWithSyrup # take_banana # give_bananaSplit
+ Nice
    -> END
