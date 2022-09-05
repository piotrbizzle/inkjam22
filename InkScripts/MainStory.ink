VAR inventory_0 = ""
VAR inventory_1 = ""
VAR inventory_2 = ""
VAR score = 100

VAR fries_value = 5
VAR fish_and_chips_value = 20
VAR ice_cream_with_syrup_value = 5
VAR banana_split_value = 25

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

== oatmeal_king ==
- {oatmeal_king_intro: {score <= 0: Fair's fair. You and your | I will not release your King until you finish paying the ransom! You still need to bring me ${score} worth of food!} | About time you showed up! If you ever want to see your precious Cake King again you'd better pay up!}

+ {!oatmeal_king_intro} "What are your demands?"
    -> oatmeal_king_intro
    
+ {inventory_has("fries")} "Try these Fries" 
~ score = score - fries_value
In my royal opinion, Fries exist mainly as a vehicle for Ketchup. They're just okay plain. Have ${fries_value}" # take_fries
    -> END
    
+ {inventory_has("fish_and_chips")} "Try this Fish and Chips" 
~ score = score - fish_and_chips_value
No newspaper to wrap it in? How will I learn about current events? Still, pretty tasty. Have ${fish_and_chips_value}" # take_fish_and_chips
    -> END
    
+ {inventory_has("ice_cream_with_syrup")} "Try this Ice Cream with Syrup" 
~ score = score - ice_cream_with_syrup_value
Why don't we ever put Chocolate Syrup on other stuff, like a nice pasta? It's such an underrated condiment. Have ${ice_cream_with_syrup_value}" # take_ice_cream_with_syrup
    -> END
    
+ {inventory_has("banana_split")} "Try this Banana Split" 
~ score = score - banana_split_value
Oh man, My Royal Wizard loves these! He's out on a research expedition right now, though. Have ${banana_split_value}" # take_banana_split
    -> END
    
+ "I'll be back with more food soon!"
    -> END
    
== oatmeal_king_intro ==
- \(Oatmeal Raisin King distractedly picks at one his his raisins\)
- Your so-called 'King' owes me big time, and you'd better pay up! Let's say... $100!
+ "But I'm just a simple Royal Chef. I spend all my money just paying the rent!"
- Hmmm you do seem pretty impoverished. Tell you what, since you're a chef, why don't you  bring me delicious meals whose market value meets or exceeds $100?
+ "And then you'll release Cake King?"
- Yeah yeah I guess. Why do you like that guy anyway, I heard he makes you sleep in the kitchen?
+ "It's not so bad. The cooker keeps it nice and warm and smoky in there"
- I guess, jeez...
+ "..."
- Hurry up and bring me my food, you're bumming me out.
+ "Right away!"
    -> END
    
== oatmeal_king_ending ==
- Well, you've payed my ransom in delicious delicacies, but if you think I’ll actually let your pathetic lump of a king free then you are but a fool! Let me tell you why this little loaf is in that cell
+ "But you said if I paid the ransom he would be freed!"
- I told but a white lie. Long ago, I was a kind and generous king in your universe. I truly cared for my people, providing free housing for all. 
- But do you know what Cake King wanted, what he did!?
+ What???
- Somehow, his wizard learned how to open a door from THE SWEETYVERSE dimension to our own BLANDYVERSE. He saw our universe's fine dough and desired it for himself! 
- Being a cake, he could make himself bigger and of higher status with more dough.
+ That does sound like something he would do. But how he did he get you to trade places with him?
- He promised me sweets galore if I took his place as king for a bit in THE SWEETYVERSE. It sounded great, but his kingdom was uncared for -- on the brink of chaos!
- Before I tell him the deal was off, he shut the rift between universes trapping me THE SWEETYVERSE! 
+ How did you return to THE BLANDYVERSE to kidnap Cake King?
- Only Cake King's Royal Wizard knew the secret of portal travel, so I had to task all of my court magicians to rediscover the technique. They only just cracked it this morning!
+ "You mean Wizzy Woo is from THE SWEETYVERSE?"
- Wizzy Woo? Is that your universe's Wheezy Wee?
- Come to think of it, I wonder why he hasn't come to rescue Cake King? 
+ "It's truly a mystery"
- You need to understand, Cake King is a monster! I heard how he forced you into a dangerous rent situation last year.
- If he treats all of his subjects that poorly, he can never be allowed to return to power
+ "I see what you mean"
- But, you did pay my ransom as agreed. So I put it up to you:
- If you leave Cake King locked up and let me bring both THE BLANDYVERSE and THE SWEETYVERSE under my benevolent rule, I will offer you the finest kitchen-apartment my Royal Architects can construct and the freedom to cook whatever you like
- OR You can free Cake King, in which case both of you are exiled from THE SWEETYVERSE forever.
+ You are right, Cake King has mistreated me, I'll take your offer
  -> END
+ I'll not side with a blasphemous kidnapper like you! Free Cake King!
  -> END

== knight_plain ==
- This tower has been permanently closed for safety reasons! It could crumble at any second!
+ "It looks okay from the outside..."
    -> END
    
== knight_sweet ==
- His Royal Majesty Oatmeal Raisin King has given me strict orders that nobody is permitted to enter except for a weird little rectangle chef guy. That must be you?
+ "I guess so"
    -> enter_tower
+ "Nah"
    -> END
    
== knight_sweet_2 ==
- Ready to Leave?
+ "I guess so"
    -> exit_tower
+ "Nah"
    -> END
    
== knight_salty ==
- The Royal Wizard is conducting crucial research in this tower!
- Actually, you kind of look like him. Are you his assistant or something?
+ "Pretty much"
    -> enter_tower
+ "Nah"
    -> END
    
== knight_salty_2 ==
- Ready to Leave?
+ "I guess so"
    -> exit_tower
+ "Nah"
    -> END
    
== enter_tower ==
- I'll escort you inside # send_to_towerFloor1|-3|-1.1
+ "Okay"
    -> END

== exit_tower ==
- I'll escort you out # send_to_towerEntrance|-0.3|-0.8
+ "Okay"
    -> END
    
== cow ==
- Moo
+ "Moo"
    -> END
    
== martin ==
- {martin_intro: \(Martin avoids your gaze\) | Oh heya mate, you a local? Sorry I’m a tad bitty lost.}
+ {!martin_intro} "Where are you trying to go?"
    -> martin_intro
+ {martin_intro} "..."
    -> END

== martin_intro ==
- The name’s Martin, Martin the Purple Workingbird, despite my plumage being blue now, it blooms into a mix of purple and blue once spring be coming round.
+ "Fascinating!"
- See I’ve come here to pay respects to me brothers death, he used to own the farm round here. Lookin for it ya see. 
+ "The farm's just to the East of here, o sorry for your loss"
- He was killed last yea by the weirded looking fella by the descriptions -- chefs hat, dark as shadow, blue eyes that pierce your bloody soul, a villainous looking moustache and shaped like a short rectang-
+ "..."
- You know, I just realized I'm in an awful hurry. Th-thanks for the directions, stranger, I'll be on my way.
+ "..."
  -> END

== ferryman ==
- {ferryman_complete: Ready to cross the lake / sea? | {ferryman_intro: Do you have my Peanut Butter and Jelly Sandwich? | Why hello there! I. AM. THE. FERRYMAN! I help travelers sail from shore to shining shore. You, my good man, look like a box in need of a ride!}}
+ {!ferryman_intro} “I’m the royal chef, not a box.”
    -> ferryman_intro
+ {ferryman_intro && !ferryman_complete && inventory_has("peanutButterAndJellySandwich")} "Right here! Will you take me aboard your boat?.
    ->  ferryman_complete
+ {ferryman_complete} "Let's do it!"
    -> ferryman_cross
+ {ferryman_intro} "Not yet"
    -> END 
    
== ferryman_intro ==
- Oh, my mistake! Well would you like to ride across this chocolatey lake / sea in my lovely boat?
+ Actually, yes I would.
- Lovely! Well that will be $45,000 for a one way ticket or $90,000 for a roundtrip pass!
+ What!! That’s more than Oatmeal King wanted for his ransom! Is there no other way?
- I’m sorry good sir. My lovely boat is the only way to cross this sea, and so, I have a bit of a monopoly! So do you have the money?
+ No.
- Harrumph… well it was worth a shot. Let’s see, perhaps we can come to another arrangement. I have a particular craving. A desire if you will. A need for a yum yum in my tum tum. What do you say?
+ Ummm, gross. What do you want me to make you?
- Bring me a Peanut Butter and Jelly sandwich, Then I’ll take you and your silly chef hat across this chocolately lake.
+ Okay. I guess I'll go make a Peanut Butter and Jelly sandwich.
    -> END

== ferryman_complete ==
- Anchors aweigh!  # take_peanutButterAndJellySandwich # send_to_island|1.1|0.25
+ "Ahoy!"
    -> END
    
== ferryman_cross ==
- Anchors aweigh!  # send_to_island|1.0|0.25
+ "Ahoy!"
    -> END
    
== ferryman_2 ==
- "Ready to cross the lake / sea?" 
+ "Let's do it!"
    -> back_to_dock
+ "Not yet"
    -> END

== back_to_dock ==
- Anchors aweigh!" # send_to_dock|0.3|0.3
+ "Ahoy!"
    -> END
    
== fenix ==
- \(The Phoenix glances at you, boredly. His vest is incredibly sweet\)"
+ "What a cool guy"
    -> END

== wizzy ==
+ What are you waiting for!? Get out there and save your king!
- "Okay okay"
    -> END

== wheezy ==
- {wheezy_intro: \(Wheezy Wee gasps for air. He's done a lot of science today\) | Hello there! \*cough cough\* I’m … \(The wizard takes a deep breath\)}
+ {!wheezy_intro} Wait patiently for him to catch his breath
    -> wheezy_intro
+ Leave him be
    -> END
    
    
== wheezy_intro ==
- ... I’m Wheezy Wee. You shouldn’t be here. I came out here, far away from civilization, to conduct dangerous experiments. 
+ "What kind of experiments?"
- Experiments of a teleportonic nature! \(He pauses to catch his breath\). Long story short, just this morning, I was able to open up this portal!
+ "What a coincidence! I walked through a portal this morning!"
- Really? You live in THE SALTYVERSE?
+ "No, my home isn’t salty… it’s just normal."
- You mean… you live in an alternate universe that is neither sweet, nor salty? WHAT A REVELATION! There are multiple parallel universes! 
+ "Wow!"
- Your home needs a name! Let’s see, it’s normal. Sounds kind of bland… hmmm. We shall call it “BLANDYVERSE”
+ "Really? Can we just call it home?"
- NO! I am a wizard scientist. Everything must have a proper name. It is THE BLANDYVERSE!
+ "Fine, whatever. Can I go through your portal now?"
- Yes! I was hoping you would… I just need to catch my breath first.
+ "Bye Wheezy Wee"
    -> END
    
== woozy ==
- {woozy_intro: I'll get back to work in like \*hic\* six minutes, tops | What's happening, I'm \*hic\* Woozy Woah}
+ {!woozy_intro} "Are you drinking Hot Sauce straight from the bottle??"
    -> woozy_intro
+ {woozy_intro} "Just be sure to drink some water"
    -> END
    
== woozy_intro == 
- Relaaaax, I'm just taking a \*hic\* break to enjoy a coupla nice hot ones. The portal's basically working now, who cares if the \*hic\* tower on the other side is all sealed up?
+ "Seems fine to me"
    -> END
    
== cake_king_prison ==
- Chef! You have to get me out of here! They've got me locked up right across from a bunch of bottles of Chocolate Syrup for some reason and it's freaking me out!
+ "Aye aye, your majesty!"
    -> END

// recipe pages
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
    
// cooker
== cooker ==
- You fire up the ol' cooker! Time to make some food! 
+ {inventory_has("potato") && inventory_has("oil")} Fries (Retail Value: ${fries_value})
    -> cooker_fries
+ {inventory_has("fries") && inventory_has("fish")} Fish and Chips (Retail Value: ${fish_and_chips_value})
    -> cooker_fish_and_chips
+ {inventory_has("iceCream") && inventory_has("chocolateSyrup")} Ice Cream with Syrup (Retail Value: ${ice_cream_with_syrup_value}) 
    -> cooker_ice_cream_with_syrup
+ {inventory_has("iceCreamWithSyrup") && inventory_has("banana")} Banana Split (Retail Value: ${banana_split_value})
    -> cooker_banana_split
+ Cook nothing
    -> END
    
== cooker_fries ==
- You made some fries! Greasy! # take_potato # take_oil # give_fries
+ Nice
    -> END

== cooker_fish_and_chips ==
- You made some fish and chips! How positively English of you! # take_fries # take_fish # give_fishAndChips
+ Nice
    -> END
    
== cooker_ice_cream_with_syrup ==
- You made some Ice Cream with Syrup! Decadent! # take_iceCream # take_chocolateSyrup # give_iceCreamWithSyrup
+ Nice
    -> END
    
== cooker_banana_split ==
- You made a Banana Split! It's healthy now! # take_iceCreamWithSyrup # take_banana # give_bananaSplit
+ Nice
    -> END

// tutorial
== tutorial_cake_king ==
- {tutorial_cake_king_intro: Well, do you have my Fish and Chips or what? \(Cake King sits at his throne, looking perfectly regal and rich as hell\)}
+ {!tutorial_cake_king_intro} "Good morning, my liege!"
  -> tutorial_cake_king_intro
+ {inventory_has("fishAndChips")} "Here is your Fish and Chips, my liege"
    -> tutorial_cake_king_give_fish
+ {tutorial_cake_king_intro} "I'm working on it..."
    -> END

== tutorial_cake_king_intro ==
- My royal chef! It's so good to see you this morning. The Gentlebirds are singing and everything is lovely in the kingdom. It's incredible!
+ "Yes, your highness, it is!"
- ...YET, I cannot escape the feeling that something terrible is about to happen.
+ "What do you mean, your majesty?"
- Perhaps it's nothing. Perhaps I'm just hungry. Why don't you whip me up some fish and chips? If you forgot how, go talk to The Royal Wizard in the room to the West.
+ "Your wish is my command"
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
- \(The Royal Wizard, Wizzy Woo, is waiting for you in the hallway\)
- Royal Chef! You haven't really forgotten how to cook have you??
+ "Well..."
- It's easy!
- First off, you can pick up items like that bottle of Oil to my right with the E key and drop them with Q key.
+ "Pick up with E and drop with Q. Easy enough."
- Once you're carrying some ingredients, you can interact with your Cooker in the kitchen to the North by walking up to it and pressing Spacebar. 
- If you're holding all the ingredients for a recipe, you'll be able to cook it!
+ "How will I know what I need?"
- Some recipes are recorded on Recipe Pages like the one to the left of me there. 
- If you walk up to one and press Space, you'll be able to read the recipe!
+ "Handy!"
- But listen! Not all recipes are written down! You'll have to come up with some on your own
+ "Thanks for the help, Wizzy Woo"
    -> END
    
== tutorial_wizard_2 ==
- \(You tell Wizzy Woo what happened\)
- Good gravy! Did you say THE SWEETYVERSE? As luck would have it, I've been studying THE SWEETYVERSE!
+ "Ohh?"
- Yes! It's a universe parallel to our own, and the home of all things sweet and desserty. Just this morning, I was able to open a portal to THE SWEETYVERSE for the first time!
+ "What a coincidence!"
- Indeed! That purple oval in my summoning area is a portal directly to THE SWEETYVERSE. If you walk up to it and press Spacebar, you'll step through to the other side. But tread carefully! Portals act in strange and mysterious ways
+ "Strange and mysterious ways?"
- Raw ingredients carried through the portal change to become their parallel universe counterpart. 
- For example, that bottle of Oil on my desk turns into Chocolate Syrup in THE SWEETYVERSE.
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
