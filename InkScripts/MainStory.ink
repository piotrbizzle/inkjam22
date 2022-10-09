VAR inventory_0 = ""
VAR inventory_1 = ""
VAR inventory_2 = ""
VAR score = 100

// values
VAR anchovyPizza_value = 48
VAR breadAndButter_value = 20
VAR bread_value = 8
VAR butter_value = 8
VAR candyCherry_value = 16
VAR cheesePizza_value = 36
VAR cheeseSandwich_value = 17
VAR cheeseSauce_value = 13
VAR cheeseyBroccoli_value = 35
VAR cherryPie_value = 30
VAR chipsAndSalsa_value = 31
VAR chips_value = 21
VAR chocolateDonut_value = 42
VAR donut_value = 32
VAR dough_value = 12
VAR fishAndChips_value = 28
VAR friedEgg_value = 13
VAR friesWithKetchup_value = 21
VAR fries_value = 12
VAR gentlebirdPie_value = 69
VAR iceCreamWithSyrup_value = 12
VAR jellyDonut_value = 40
VAR koolAid_value = 15
VAR meatPie_value = 32
VAR mushroomPie_value = 35
VAR mushroomPizza_value = 47
VAR nachosSupreme_value = 45
VAR nachos_value = 36
VAR pastaWithChocolateSauce_value = 29
VAR pastaWithRedSauce_value = 25
VAR pasta_value = 17
VAR pastryDough_value = 20
VAR pepperoniPizza_value = 44
VAR potatoBread_value = 15
VAR powderedDonut_value = 38
VAR toastWithJam_value = 24
VAR veganPizza_value = 22


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
- {oatmeal_king_intro: {score <= 0: Wow, you actually paid the whole ransom! | I will not release your King until you finish paying the ransom! You still need to bring me ${score} worth of food!} | About time you showed up! If you ever want to see your precious Cake King again you'd better pay up!}
+ {!oatmeal_king_intro} "What are your demands?"
    -> oatmeal_king_intro
// king
+ {inventory_has("fishAndChips")} "Try this Fish and Chips" 
~ score = score - fishAndChips_value
Delicious! Have ${fishAndChips_value} # take_fishAndChips
   -> oatmeal_king
+ {inventory_has("fries")} "Try these Fries" 
~ score = score - fries_value
Hm, I prefer my fries with ketchup. Still, pretty good! Have ${fries_value} # take_fries
   -> oatmeal_king
+ {inventory_has("iceCreamWithSyrup")} "Try this Ice Cream with Syrup" 
~ score = score - iceCreamWithSyrup_value
Chocolate sauce best sauce. I said it! Have ${iceCreamWithSyrup_value} # take_iceCreamWithSyrup
   -> oatmeal_king
+ {inventory_has("breadAndButter")} "Try this Bread and Butter" 
~ score = score - breadAndButter_value
A classic! Have ${breadAndButter_value} # take_breadAndButter
   -> oatmeal_king
+ {inventory_has("toastWithJam")} "Try this Toast with Jam" 
~ score = score - toastWithJam_value
Oh man my Ferryman loves Toast with Jam! Have ${toastWithJam_value} # take_toastWithJam
   -> oatmeal_king
+ {inventory_has("donut")} "Try this Donut" 
~ score = score - donut_value
Holy Donuts! Get it?? Have ${donut_value} # take_donut
   -> oatmeal_king
+ {inventory_has("chocolateDonut")} "Try this Chocolate Donut" 
~ score = score - chocolateDonut_value
What an upgrade! Have ${chocolateDonut_value} # take_chocolateDonut
   -> oatmeal_king
+ {inventory_has("pastryDough")} "Try this Pastry Dough" 
~ score = score - pastryDough_value
I guess this technically is food! Have ${pastryDough_value} # take_pastryDough
   -> oatmeal_king
+ {inventory_has("dough")} "Try this Dough" 
~ score = score - dough_value
Is this even safe to eat? Anyway, have ${dough_value} # take_dough
   -> oatmeal_king
+ {inventory_has("powderedDonut")} "Try this Powdered Donut" 
~ score = score - powderedDonut_value
Gotta dust off my fingers after this one. Have ${powderedDonut_value} # take_powderedDonut
   -> oatmeal_king
+ {inventory_has("jellyDonut")} "Try this Jelly Donut" 
~ score = score - jellyDonut_value
A little messy, but so so good! Have ${jellyDonut_value} # take_jellyDonut
   -> oatmeal_king
+ {inventory_has("cherryPie")} "Try this Cherry Pie" 
~ score = score - cherryPie_value
Yum! Have ${cherryPie_value} # take_cherryPie
   -> oatmeal_king
+ {inventory_has("meatPie")} "Try this Meat Pie" 
~ score = score - meatPie_value
A sweet pie is good, but you know what I really love? A fruit pie! Have ${meatPie_value} # take_meatPie
   -> oatmeal_king
+ {inventory_has("gentlebirdPie")} "Try this Gentlebird Pie" 
~ score = score - gentlebirdPie_value
I -- did you cook a sentient being into this pie? It does look scrumptious though... I can't resist -- have ${gentlebirdPie_value} # take_gentlebirdPie
   -> oatmeal_king
+ {inventory_has("potatoBread")} "Try this Potato Bread" 
~ score = score - potatoBread_value
Wholesome! Have ${potatoBread_value} # take_potatoBread
   -> oatmeal_king
+ {inventory_has("chips")} "Try these Chips" 
~ score = score - chips_value
Impossible to eat just one, am I right? Have ${chips_value} # take_chips
   -> oatmeal_king
+ {inventory_has("chipsAndSalsa")} "Try this Chips and Salsa" 
~ score = score - chipsAndSalsa_value
Spicy! Have ${chipsAndSalsa_value} # take_chipsAndSalsa
   -> oatmeal_king
+ {inventory_has("nachos")} "Try this Nachos" 
~ score = score - nachos_value
A prince among meals! Have ${nachos_value} # take_nachos
   -> oatmeal_king
+ {inventory_has("nachosSupreme")} "Try this Nachos Supreme" 
~ score = score - nachosSupreme_value
Now THIS is a meal fit for a king! Have ${nachosSupreme_value} # take_nachosSupreme
   -> oatmeal_king
+ {inventory_has("pastaWithRedSauce")} "Try this Pasta with Red Sauce" 
~ score = score - pastaWithRedSauce_value
Pretty good! Have ${pastaWithRedSauce_value} # take_pastaWithRedSauce
   -> oatmeal_king
+ {inventory_has("pastaWithChocolateSauce")} "Try this Pasta With Chocolate Sauce" 
~ score = score - pastaWithChocolateSauce_value
This is certainly unique! Have ${pastaWithChocolateSauce_value} # take_pastaWithChocolateSauce
   -> oatmeal_king
+ {inventory_has("veganPizza")} "Try this Vegan Pizza" 
~ score = score - veganPizza_value
I feel like it's missing something! Have ${veganPizza_value} # take_veganPizza
   -> oatmeal_king
+ {inventory_has("cheesePizza")} "Try this Cheese Pizza" 
~ score = score - cheesePizza_value
A little plain, but definitely yummy! Have ${cheesePizza_value} # take_cheesePizza
   -> oatmeal_king
+ {inventory_has("pepperoniPizza")} "Try this Pepperoni Pizza" 
~ score = score - pepperoniPizza_value
Meaty! Have ${pepperoniPizza_value} # take_pepperoniPizza
   -> oatmeal_king
+ {inventory_has("anchovyPizza")} "Try this Anchovy Pizza" 
~ score = score - anchovyPizza_value
Ooh that's pretty salty huh? Have ${anchovyPizza_value} # take_anchovyPizza
   -> oatmeal_king
+ {inventory_has("friedEgg")} "Try this Fried Egg" 
~ score = score - friedEgg_value
Excellent! Have ${friedEgg_value} # take_friedEgg
   -> oatmeal_king
+ {inventory_has("friesWithKetchup")} "Try this Fries with Ketchup" 
~ score = score - friesWithKetchup_value
Ketchup counts as a vegetable! So does potato! Double vegetable! Have ${friesWithKetchup_value} # take_friesWithKetchup
   -> oatmeal_king
+ {inventory_has("candyCherry")} "Try this Candy Cherry" 
~ score = score - candyCherry_value
It tastes like chemicals! Have ${candyCherry_value} # take_candyCherry
   -> oatmeal_king
+ {inventory_has("cheeseSandwich")} "Try this Cheese Sandwich" 
~ score = score - cheeseSandwich_value
More of a snack than a meal, but still good. Have ${cheeseSandwich_value} # take_cheeseSandwich
   -> oatmeal_king
+ {inventory_has("mushroomPizza")} "Try this Mushroom Pizza" 
~ score = score - mushroomPizza_value
Chewy! Have ${mushroomPizza_value} # take_mushroomPizza
   -> oatmeal_king
+ {inventory_has("mushroomPie")} "Try this Mushroom Pie" 
~ score = score - mushroomPie_value
Not for everyone, but I love it! Have ${mushroomPie_value} # take_mushroomPie
   -> oatmeal_king
+ {inventory_has("cheeseyBroccoli")} "Try this Cheesey Broccoli" 
~ score = score - cheeseyBroccoli_value
Healthy and delicious! Have ${cheeseyBroccoli_value} # take_cheeseyBroccoli
   -> oatmeal_king
+ {inventory_has("cheeseSauce")} "Try this Cheese Sauce" 
~ score = score - cheeseSauce_value
Kind of deranged to drink cheese sauce by itself right? Have ${cheeseSauce_value} # take_cheeseSauce
   -> oatmeal_king
+ {inventory_has("bread")} "Try this Bread" 
~ score = score - bread_value
Bland! Have ${bread_value} # take_bread
   -> oatmeal_king
+ {inventory_has("butter")} "Try this Butter" 
~ score = score - butter_value
I can feel my arteries clogging already! Have ${butter_value} # take_butter
   -> oatmeal_king
+ {inventory_has("pasta")} "Try this Pasta" 
~ score = score - pasta_value
Mama mia! Have ${pasta_value} # take_pasta
   -> oatmeal_king
+ {inventory_has("koolAid")} "Try this Kool-Aid" 
~ score = score - koolAid_value
Did you melt a popsicle into a glass? Just like Mama used to make! Have ${koolAid_value} # take_koolAid
   -> oatmeal_king
+ {score <= 0} Yeah I did! Now let Cake King go!
    -> oatmeal_king_ending
+ {oatmeal_king_intro} "I'll be back with more food soon!"
    -> END

// cooker
== cooker ==
- You fire up the ol' cooker! Time to make some food! 
// cookerIn
+ {inventory_has("fish") && inventory_has("fries")} Fish and Chips (Retail Value: ${fishAndChips_value})
    -> cooker_fishAndChips
+ {inventory_has("oil") && inventory_has("potato")} Fries (Retail Value: ${fries_value})
    -> cooker_fries
+ {inventory_has("iceCream") && inventory_has("chocolateSyrup")} Ice Cream with Syrup (Retail Value: ${iceCreamWithSyrup_value})
    -> cooker_iceCreamWithSyrup
+ {inventory_has("bread") && inventory_has("butter")} Bread and Butter (Retail Value: ${breadAndButter_value})
    -> cooker_breadAndButter
+ {inventory_has("bread") && inventory_has("jam")} Toast with Jam (Retail Value: ${toastWithJam_value})
    -> cooker_toastWithJam
+ {inventory_has("pastryDough") && inventory_has("oil")} Donut (Retail Value: ${donut_value})
    -> cooker_donut
+ {inventory_has("donut") && inventory_has("chocolateSyrup")} Chocolate Donut (Retail Value: ${chocolateDonut_value})
    -> cooker_chocolateDonut
+ {inventory_has("dough") && inventory_has("butter")} Pastry Dough (Retail Value: ${pastryDough_value})
    -> cooker_pastryDough
+ {inventory_has("flour") && inventory_has("egg")} Dough (Retail Value: ${dough_value})
    -> cooker_dough
+ {inventory_has("donut") && inventory_has("sugar")} Powdered Donut (Retail Value: ${powderedDonut_value})
    -> cooker_powderedDonut
+ {inventory_has("jam") && inventory_has("donut")} Jelly Donut (Retail Value: ${jellyDonut_value})
    -> cooker_jellyDonut
+ {inventory_has("pastryDough") && inventory_has("cherry")} Cherry Pie (Retail Value: ${cherryPie_value})
    -> cooker_cherryPie
+ {inventory_has("pastryDough") && inventory_has("meatball")} Meat Pie (Retail Value: ${meatPie_value})
    -> cooker_meatPie
+ {inventory_has("martin") && inventory_has("pastryDough")} Gentlebird Pie (Retail Value: ${gentlebirdPie_value})
    -> cooker_gentlebirdPie
+ {inventory_has("potato") && inventory_has("bread")} Potato Bread (Retail Value: ${potatoBread_value})
    -> cooker_potatoBread
+ {inventory_has("dough") && inventory_has("salt")} Chips (Retail Value: ${chips_value})
    -> cooker_chips
+ {inventory_has("chips") && inventory_has("hotSauce")} Chips and Salsa (Retail Value: ${chipsAndSalsa_value})
    -> cooker_chipsAndSalsa
+ {inventory_has("chips") && inventory_has("cheeseSauce")} Nachos (Retail Value: ${nachos_value})
    -> cooker_nachos
+ {inventory_has("nachos") && inventory_has("meatball")} Nachos Supreme (Retail Value: ${nachosSupreme_value})
    -> cooker_nachosSupreme
+ {inventory_has("pasta") && inventory_has("marinara")} Pasta with Red Sauce (Retail Value: ${pastaWithRedSauce_value})
    -> cooker_pastaWithRedSauce
+ {inventory_has("pasta") && inventory_has("chocolateSyrup")} Pasta With Chocolate Sauce (Retail Value: ${pastaWithChocolateSauce_value})
    -> cooker_pastaWithChocolateSauce
+ {inventory_has("dough") && inventory_has("marinara")} Vegan Pizza (Retail Value: ${veganPizza_value})
    -> cooker_veganPizza
+ {inventory_has("veganPizza") && inventory_has("cheese")} Cheese Pizza (Retail Value: ${cheesePizza_value})
    -> cooker_cheesePizza
+ {inventory_has("cheesePizza") && inventory_has("meatball")} Pepperoni Pizza (Retail Value: ${pepperoniPizza_value})
    -> cooker_pepperoniPizza
+ {inventory_has("cheesePizza") && inventory_has("anchovy")} Anchovy Pizza (Retail Value: ${anchovyPizza_value})
    -> cooker_anchovyPizza
+ {inventory_has("egg") && inventory_has("oil")} Fried Egg (Retail Value: ${friedEgg_value})
    -> cooker_friedEgg
+ {inventory_has("fries") && inventory_has("marinara")} Fries with Ketchup (Retail Value: ${friesWithKetchup_value})
    -> cooker_friesWithKetchup
+ {inventory_has("cherry") && inventory_has("sugar")} Candy Cherry (Retail Value: ${candyCherry_value})
    -> cooker_candyCherry
+ {inventory_has("cheese") && inventory_has("bread")} Cheese Sandwich (Retail Value: ${cheeseSandwich_value})
    -> cooker_cheeseSandwich
+ {inventory_has("mushroom") && inventory_has("cheesePizza")} Mushroom Pizza (Retail Value: ${mushroomPizza_value})
    -> cooker_mushroomPizza
+ {inventory_has("mushroom") && inventory_has("pastryDough")} Mushroom Pie (Retail Value: ${mushroomPie_value})
    -> cooker_mushroomPie
+ {inventory_has("broccoli") && inventory_has("cheeseSauce")} Cheesey Broccoli (Retail Value: ${cheeseyBroccoli_value})
    -> cooker_cheeseyBroccoli
+ {inventory_has("cheese") && inventory_has("butter")} Cheese Sauce (Retail Value: ${cheeseSauce_value})
    -> cooker_cheeseSauce
+ {inventory_has("flour")} Bread (Retail Value: ${bread_value})
    -> cooker_bread
+ {inventory_has("cream")} Butter (Retail Value: ${butter_value})
    -> cooker_butter
+ {inventory_has("dough")} Pasta (Retail Value: ${pasta_value})
    -> cooker_pasta
+ {inventory_has("popsicle")} Kool-Aid (Retail Value: ${koolAid_value})
    -> cooker_koolAid
+ Cook nothing
    -> END
    
// cookerOut
== cooker_fishAndChips ==
- You made Fish and Chips! # take_fish # take_fries # give_fishAndChips
+ Nice
     -> END
== cooker_fries ==
- You made Fries! # take_oil # take_potato # give_fries
+ Nice
     -> END
== cooker_iceCreamWithSyrup ==
- You made some Ice Cream with Syrup! So decadent! # take_iceCream # take_chocolateSyrup # give_iceCreamWithSyrup
+ Nice
    -> END
== cooker_breadAndButter ==
- You made Bread and Butter! # take_bread # take_butter # give_breadAndButter
+ Nice
     -> END
== cooker_toastWithJam ==
- You made Toast with Jam! # take_bread # take_jam # give_toastWithJam
+ Nice
     -> END
== cooker_donut ==
- You made Donut! # take_pastryDough # take_oil # give_donut
+ Nice
     -> END
== cooker_chocolateDonut ==
- You made Chocolate Donut! # take_donut # take_chocolateSyrup # give_chocolateDonut
+ Nice
     -> END
== cooker_pastryDough ==
- You made Pastry Dough! # take_dough # take_butter # give_pastryDough
+ Nice
     -> END
== cooker_dough ==
- You made Dough! # take_flour # take_egg # give_dough
+ Nice
     -> END
== cooker_powderedDonut ==
- You made Powdered Donut! # take_donut # take_sugar # give_powderedDonut
+ Nice
     -> END
== cooker_jellyDonut ==
- You made Jelly Donut! # take_jam # take_donut # give_jellyDonut
+ Nice
     -> END
== cooker_cherryPie ==
- You made Cherry Pie! # take_pastryDough # take_cherry # give_cherryPie
+ Nice
     -> END
== cooker_meatPie ==
- You made Meat Pie! # take_pastryDough # take_meatball # give_meatPie
+ Nice
     -> END
== cooker_gentlebirdPie ==
- You made Gentlebird Pie! # take_martin # take_pastryDough # give_gentlebirdPie
+ Nice
     -> END
== cooker_potatoBread ==
- You made Potato Bread! # take_potato # take_bread # give_potatoBread
+ Nice
    -> END
== cooker_chips ==
- You made Chips! # take_dough # take_salt # give_chips
+ Nice
     -> END
== cooker_chipsAndSalsa ==
- You made Chips and Salsa! # take_chips # take_hotSauce # give_chipsAndSalsa
+ Nice
     -> END
== cooker_nachos ==
- You made Nachos! # take_chips # take_cheeseSauce # give_nachos
+ Nice
     -> END
== cooker_nachosSupreme ==
- You made Nachos Supreme! # take_nachos # take_meatball # give_nachosSupreme
+ Nice
     -> END
== cooker_pastaWithRedSauce ==
- You made Pasta with Red Sauce! # take_pasta # take_marinara # give_pastaWithRedSauce
+ Nice
     -> END
== cooker_pastaWithChocolateSauce ==
- You made Pasta With Chocolate Sauce! # take_pasta # take_chocolateSyrup # give_pastaWithChocolateSauce
+ Nice
     -> END
== cooker_veganPizza ==
- You made Vegan Pizza! # take_dough # take_marinara # give_veganPizza
+ Nice
     -> END
== cooker_cheesePizza ==
- You made Cheese Pizza! # take_veganPizza # take_cheese # give_cheesePizza
+ Nice
     -> END
== cooker_pepperoniPizza ==
- You made Pepperoni Pizza! # take_cheesePizza # take_meatball # give_pepperoniPizza
+ Nice
     -> END
== cooker_anchovyPizza ==
- You made Anchovy Pizza! # take_cheesePizza # take_anchovy # give_anchovyPizza
+ Nice
     -> END
== cooker_friedEgg ==
- You made Fried Egg! # take_egg # take_oil # give_friedEgg
+ Nice
     -> END
== cooker_friesWithKetchup ==
- You made Fries with Ketchup! # take_fries # take_marinara # give_friesWithKetchup
+ Nice
     -> END
== cooker_candyCherry ==
- You made Candy Cherry! # take_cherry # take_sugar # give_candyCherry
+ Nice
     -> END
== cooker_cheeseSandwich ==
- You made Cheese Sandwich! # take_cheese # take_bread # give_cheeseSandwich
+ Nice
     -> END
== cooker_mushroomPizza ==
- You made Mushroom Pizza! # take_mushroom # take_cheesePizza # give_mushroomPizza
+ Nice
     -> END
== cooker_mushroomPie ==
- You made Mushroom Pie! # take_mushroom # take_pastryDough # give_mushroomPie
+ Nice
     -> END
== cooker_cheeseyBroccoli ==
- You made Cheesey Broccoli! # take_broccoli # take_cheeseSauce # give_cheeseyBroccoli
+ Nice
     -> END
== cooker_cheeseSauce ==
- You made Cheese Sauce! # take_cheese # take_butter # give_cheeseSauce
+ Nice
     -> END
== cooker_bread ==
- You made Bread! # take_flour # give_bread
+ Nice
     -> END
== cooker_butter ==
- You made Butter! # take_cream # give_butter
+ Nice
     -> END
== cooker_pasta ==
- You made Pasta! # take_dough # give_pasta
+ Nice
     -> END
== cooker_koolAid ==
- You made Kool-Aid! # take_popsicle # give_koolAid
+ Nice
     -> END


    
== oatmeal_king_intro ==
- \(Oatmeal Raisin King distractedly picks at one his his raisins\)
- Your so-called 'King' owes me big time, and you'd better pay up! Let's say... $100!
+ "But I'm just a simple Royal Chef. I spend all my money just paying the rent!"
- Hmmm you do seem pretty impoverished. Tell you what, since you're a chef, why don't you bring me delicious foods whose market value meets or exceeds $100?
+ "And then you'll release Cake King?"
- Yeah yeah I guess. Why do you like that guy anyway, I heard he makes you sleep in the kitchen?
+ "It's not so bad. The cooker keeps it nice and warm and smoky in there"
- I guess, jeez...
+ "..."
- Hurry up and bring me my food.
+ "Right away!"
    -> END
    
== oatmeal_king_ending ==
- If you think I’ll actually let your pathetic lump of a king free then you are but a fool! Let me tell you why this little loaf is in that cell
+ "But you said if I paid the ransom he would be freed!"
- Listen! Long ago, I was a kind and generous king in your universe. I truly cared for my people, providing free housing for all. 
- But do you know what Cake King wanted, what he did!?
+ What???
- Somehow, his wizard learned how to open a door from THE SWEETYVERSE dimension to our own BLANDYVERSE. He saw our universe's fine dough and desired it for himself! 
- Being a cake, he could make himself bigger and of higher status with more dough.
+ That does sound like something he would do. But how he did he get you to trade places with him?
- He promised me sweets galore if I took his place as king for a bit in THE SWEETYVERSE. It sounded great, but his kingdom was uncared for -- on the brink of chaos!
- Before I could tell him the deal was off, he shut the rift between universes, trapping me THE SWEETYVERSE! 
+ How did you return to THE BLANDYVERSE to kidnap Cake King?
- Only Cake King's Royal Wizard knew the secret of portal travel, so I had to task all of my court magicians with rediscovering the technique. They only just cracked it this morning!
+ "You mean Wizzy Woo is from THE SWEETYVERSE?"
- Wizzy Woo? Is that your universe's Wheezy Wee?
+ "I think so"
- No no, Cake King's ORIGINAL Royal Wizard. I heard he was a Gentlebird, and that he's been hiding out in THE BLANDYVERSE under deep cover as some kind of potato farmer.
- Come to think of it, I wonder why he hasn't come to rescue Cake King? 
+ "It's truly a mystery"
- You need to understand, Cake King is a monster! I heard how he forced you into a dangerous rent situation last year.
- If he treats all of his subjects that poorly, he can never be allowed to return to power
+ "I see what you mean"
- But, you did pay my ransom as agreed. So I put it up to you:
- If you leave Cake King locked up and let me bring both THE BLANDYVERSE and THE SWEETYVERSE under my benevolent rule, I will offer you the finest kitchen-apartment my Royal Architects can construct and the freedom to cook whatever you like
- OR 
- You can free Cake King, in which case both of you are exiled from THE SWEETYVERSE forever.
+ You are right, Cake King has mistreated me, I'll take your offer
  -> epilogue_a
+ I'll not side with a blasphemous kidnapper like you! Free Cake King!
  -> epilogue_b
  
== epilogue_a ==
- \(And so, Oatmeal Raisin King kept Cake King in permanent confinement. The BLANDYVERSE and SWEETYVERSE both thrived under his kingsmanship\)
- \(The Royal Chef opened a sweet restaurant for yuppies in THE BLANDYVERSE and earned tons of cash. Between the business revenue and his free apartment, the Royal Chef never worried about money again\)
- \(But somehow, deep in the Royal Chef's heart, he knew this was not The Canon Ending\)
- \~THE END\~
+ Credits?
    -> the_end

== epilogue_b ==
- \(True to his word, Oatmeal Raisin King let Cake King free and used the ransom money to fund anti-portal research. Within a few months, THE BLANDYVERSE and THE SWEETYVERSE were once again totally cut off\)
- \(The Royal Chef returned to working for Cake King, who continued to charge The Royal Chef monthly rent to live in the kitchen\)
- \(Somehow, deep in the Royal Chef's heart, he knew this was The Canon Ending\)
- \~THE END\~
+ Credits?
    -> the_end


== the_end ==
- CAKE KING II: A KING'S RANSOM
- Made for the InkJam 2022 by Piotrbizzle
- With lots of help from the community, especially TheRealRangoette, dendanskemand, and nootls. Thank you to everyone who pitched in <3 
+ Nice.
    -> the_end

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
+ "Yeah!"
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
+ "Yeah!"
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
    
== cow_plain ==
- This cow makes Cream! Pretty normal!
+ "Moo"
    -> END  
    
== cow_sweet ==
- This cow makes Jam! Pretty weird!
+ "Moo"
    -> END  

== cow_salty ==
- This cow makes Tomato Sauce! Pretty... chunky!
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
+ "The farm's just to the East of here, so sorry for your loss"
- He was killed last year by the weirdest looking fella by the descriptions -- chefs hat, dark as shadow, blue eyes that pierce your bloody soul, a villainous looking moustache and shaped like a short rectang-
+ "..."
- You know, I just realized I'm in an awful hurry. Th-thanks for the directions, stranger, I'll be on my way.
+ "..."
  -> END

== sign_plain ==
- NORTH: Castle von Cake
- EAST: Mingus Farms Creamery
- SOUTH: Royal Vacation Tower - CONDEMNED
- WEST: Gorgeous Coastline
+ "Got it"
    -> END
    
== sign_sweet ==
- NORTH: Castle von Oatmeal
- EAST: Mingus Farms Jampitheatre
- SOUTH: Royal Vacation Tower
- WEST: Gorgeous Coastline
+ "Got it"
    -> END
    
== sign_salty ==
- NORTH: Castle von Pemmican
- EAST: Mingus Farms Marinarium
- SOUTH: The People's Vacation Tower
- WEST: Gorgeous Coastline
+ "Got it"
    -> END

== ferryman ==
- {ferryman_complete: Ready to cross the lake / sea? | {ferryman_intro: Do you have my Toast with Jam? | Why hello there! I. AM. THE. FERRYMAN! I help travelers sail from shore to shining shore. You, my good man, look like a box in need of a ride!}}
+ {!ferryman_intro} “I’m the royal chef, not a box.”
    -> ferryman_intro
+ {ferryman_intro && !ferryman_complete && inventory_has("toastWithJam")} "Right here! Will you take me aboard your boat?.
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
- Bring me a nice piece of Toast with Jam, Then I’ll take you and your silly chef hat across the lake.
+ Okay. I guess I'll go make some Toast with Jam.
    -> END

== ferryman_complete ==
- Anchors aweigh!  # take_toastWithJam # send_to_island|1.1|0.25
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
- {fenix_intro: \(The Phoenix seems tired of talking to you\) | \(The Phoenix glances at you, disinterestedly. Her vest is incredibly sweet\)}
+ {!fenix_intro} "Excuse me"
    -> fenix_intro
+ {fenix_intro} Leave her be
    -> END

== fenix_intro ==
- \(She doesn't stop looking over the balcony, but you're pretty sure she's listening\)
+ "Where is your King? I noticed the throneroom is empty"
- ...
+ "..?"
- \(She sighs like a cool person\) 
- We don't use a king anymore. That guy was lame so we ran him out of town
+ "Oh..!"
    -> END

== wizzy ==
- Feel free to use this portal any time you want to shift over to THE SWEETYVERSE
+ "Perfect"
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
    
== page_anchovy_pizza ==
- \= Anchovy Pizza Recipe \=
- 1 Anchovy
- 1 Cheese Pizza
+ "Okay"
    -> END
    
== page_cheesey_broccoli ==
- \= Cheesey Broccoli Recipe \=
- 1 Broccoli
- 1 Cheese Sauce
+ "Okay"
    -> END
    
== page_cheese_sauce ==
- \= Cheese Sauce Recipe \=
- 1 Cheese
- 1 Butter
+ "Okay"
    -> END

== page_dough ==
- \= Dough Recipe \=
- 1 Flour
- 1 Egg
+ "Okay"
    -> END

== page_meat_pie ==
- \= Meat Pie Recipe \=
- 1 Meatball
- 1 Pastry Dough
+ "Okay"
    -> END

== page_chips ==
- \= Tortilla Chips Recipe \=
- 1 Dough
- 1 Salt
+ "Okay"
    -> END
    
== page_chocolate_donut ==
- \= Chocolate Donut Recipe \=
- 1 Chocolate Sauce
- 1 Donut
+ "Okay"
    -> END
    
== page_nachos_supreme ==
- \= Los Nachos Supreme Recipe \=
- 1 Nachos
- 1 Meatball
+ "Okay"
    -> END
    
== page_butter ==
- \= Butter Recipe \=
- 1 Cream
+ "Okay"
    -> END

// item names
== item_anchovy ==
- It's an Anchovy! Slimy!
+ "Okay"
    -> END

== item_anchovyPizza ==
- It's an Anchovy Pizza! Polarizing!
+ "Okay"
    -> END

== item_banana ==
- It's a Banana! Freudian!
+ "Okay"
    -> END
    
== item_bananaSplit ==
- It's a Banana Split! What is split about it? Nobody knows.
+ "Okay"
    -> END

== item_bread ==
- It's a slice of Bread! Yeasty!
+ "Okay"
    -> END

== item_breadAndButter ==
- It's Bread and Butter! Fundamental!
+ "Okay"
    -> END

== item_broccoli ==
- It's Broccoli! Healthy!
+ "Okay"
    -> END

== item_butter ==
- It's Butter! Fatty!
+ "Okay"
    -> END

== item_candyCane ==
- It's a Candy Cane! Minty!
+ "Okay"
    -> END

== item_candyCherry ==
- It's a Candy Cherry! Artificialious!
+ "Okay"
    -> END

== item_cheese ==
- It's Cheese! Holy!
+ "Okay"
    -> END

== item_cheesePizza ==
- It's a Cheese Pizza! Cowabunga!
+ "Okay"
    -> END

== item_cheeseSandwich ==
- It's a Cheese Sandwich! Chewy!
+ "Okay"
    -> END

== item_cheeseSauce ==
- It's Cheese Sauce! Thick!
+ "Okay"
    -> END

== item_cheeseyBroccoli ==
- It's Cheesey Broccoli! Cheesey!
+ "Okay"
    -> END

== item_cherry ==
- It's a Cherry! Fruity!
+ "Okay"
    -> END

== item_cherryPie ==
- It's a Cherry Pie! Sweet!
+ "Okay"
    -> END

== item_chips ==
- It's Chips! Chips!
+ "Okay"
    -> END

== item_chipsAndSalsa ==
- It's Chips and Salsa! Spicy!
+ "Okay"
    -> END

== item_chocolateDonut ==
- It's a Chocolate Donut! Chocolately!
+ "Okay"
    -> END

== item_chocolateSyrup ==
- It's Chocolate Syrup! Rich!
+ "Okay"
    -> END

== item_cream ==
- It's Cream! Creamy!
+ "Okay"
    -> END

== item_donut ==
- It's a Donut! Plain!
+ "Okay"
    -> END

== item_dough ==
- It's Dough! Kneady!
+ "Okay"
    -> END

== item_egg ==
- It's an Egg! Fragile!
+ "Okay"
    -> END

== item_fish ==
- It's a Fish! Aquatic!
+ "Okay"
    -> END

== item_fishAndChips ==
- It's Fish and Chips! Fishy! (Also, Chippy!)
+ "Okay"
    -> END

== item_flour ==
- It's Flour! Dry!
+ "Okay"
    -> END

== item_friedEgg ==
- It's a Fried Egg! Breakfasty!
+ "Okay"
    -> END

== item_fries ==
- It's Fries! Greasy!
+ "Okay"
    -> END

== item_friesWithKetchup ==
- It's Fries with Ketchup! Ketchupy!
+ "Okay"
    -> END

== item_gentlebirdPie ==
- It's a Gentlebird Pie! Criminal!
+ "Okay"
    -> END

== item_hotSauce ==
- It's Hot Sauce! Vinegary!
+ "Okay"
    -> END

== item_iceCream ==
- It's Ice Cream! Cold!
+ "Okay"
    -> END

== item_iceCreamWithSyrup ==
- It's Ice Cream with Syrup! Syrupy!
+ "Okay"
    -> END

== item_jam ==
- It's Jam! JAAAAAAAAAAAAM!
+ "Okay"
    -> END

== item_jellyDonut ==
- It's a Jelly Donut! Messy!
+ "Okay"
    -> END

== item_koolAid ==
- It's Kool-Aid! Drinkable!
+ "Okay"
    -> END

== item_marinara ==
- It's Marinara Sauce! Tomatious!
+ "Okay"
    -> END

== item_meatPie ==
- It's a Meat Pie! Filling!
+ "Okay"
    -> END

== item_meatball ==
- It's a Meat Ball! Meaty!
+ "Okay"
    -> END

== item_mushroom ==
- It's a Mushroom! Fungible!
+ "Okay"
    -> END

== item_mushroomPie ==
- It's a Mushroom Pie! Mushy!
+ "Okay"
    -> END

== item_mushroomPizza ==
- It's a Mushroom Pizza! Funky!
+ "Okay"
    -> END

== item_nachos ==
- It's Nachos! Party time!
+ "Okay"
    -> END

== item_nachosSupreme ==
- It's Nachos Supreme! KINGLY!
+ "Okay"
    -> END

== item_oil ==
- It's Oil! Slick!
+ "Okay"
    -> END

== item_pasta ==
- It's Pasta! Bland!
+ "Okay"
    -> END

== item_pastaWithChocolateSauce ==
- It's Pasta with Chocolate Sauce! Inventive!
+ "Okay"
    -> END

== item_pastaWithRedSauce ==
- It's Pasta with Red Sauce! Classico!
+ "Okay"
    -> END

== item_pastryDough ==
- It's Pastry Dough! Flaky!
+ "Okay"
    -> END

== item_pepperoniPizza ==
- It's Pepperoni Pizza! Popular!
+ "Okay"
    -> END

== item_popsicle ==
- It's a Popsicle! Icy!
+ "Okay"
    -> END

== item_potato ==
- It's a Potato! Nourishing!
+ "Okay"
    -> END

== item_potatoBread ==
- It's Potato Bread! Hearty!
+ "Okay"
    -> END

== item_powderedDonut ==
- It's a Powdered Donut! Dusty!
+ "Okay"
    -> END

== item_salt ==
- It's Salt! Coarse!
+ "Okay"
    -> END

== item_sugar ==
- It's Sugar! Grainy!
+ "Okay"
    -> END

== item_swedishFish ==
- It's a Swedish Fish! Gummy!
+ "Okay"
    -> END

== item_toastWithJam ==
- It's Toast with Jam! Jammy!
+ "Okay"
    -> END

== item_veganPizza ==
- It's Vegan Pizza! Incomplete!
+ "Okay"
    -> END

// tutorial
== tutorial_cake_king ==
- {tutorial_cake_king_intro: Well, do you have my Fish and Chips or what? | \(Cake King sits at his throne, looking perfectly regal and rich as can be\)}
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
-  \(The interloper drags Cake King out of the throne room and over the balcony\) # send_to_throneRoomTut|0
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
- If you walk up to one and press Spacebar, you'll be able to read the recipe!
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
- BUT, prepared dishes seem to only have a single form across both universes. If you prepare something in your Cooker and carry it through a portal, it won't change!
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
- You made some Ice Cream with Syrup! So decadent! # take_iceCream # take_chocolateSyrup # give_iceCreamWithSyrup
+ Nice
    -> END
    
== tutorial_cooker_banana_split ==
- You made a Banana Split! It's healthy now! # take_iceCreamWithSyrup # take_banana # give_bananaSplit
+ Nice
    -> END