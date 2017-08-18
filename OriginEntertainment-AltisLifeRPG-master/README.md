# AltisRPG 3.1.4.8 ver.  		   
     
**modified by JB81**	 
                                   
## Changelogs

** Changelog 4.8.2015**

* Cop Icon Update for all levels
* Configured Clothing, Weapon, Vehicle shops with donator discounts
* Edited welcoming information
* Implemented teargas for cops
* Configured medicloadout
* Implemented cop dispatch markers for both cop forces; bluefor + opfor
* Bunch of misc bug fixes

** Changelog 4.7.2015**

* Added in NLR timer fix for players that have been revived
* Intro edit
* Various misc stringtable fixes
* Added in tablet UI
* New Main UI update
* Added in donator skins + cop skins + medic skins

** Changelog 4.4.2015**

* Workout Script
  * Players can now workout at weights by paying a small fee. Result is redgull effect for 10 minutes.
* Added buy sounds
* Added Surrender Animation; Tab key
* Yelp Sound for cops; Shift+F
* Added restrain sounds
* Added ticket sounds
* Added car alarm sounds
* Added car blinkers; Q + E 
* Added bank alarm sounds
* Added lockpick sounds
* Added medic siren sounds
* Implemented donator system for large storage crates
* Implemented paycheck system
  * Donators has 5 levels
  * BlueFor Cops has 6 levels
  * OpFor Cops has 6 levels
  * Medics has 3 levels
* Implemented vehicle blinkers
  * Q for left blinkers
  * E for right blinkers
  * R for warning blinkers
* Implemented Sitdown & Standup Mechanism
* Implemented teargas for cops
* Added Origin Entertainment Watermark
* Added advanced death messages.
  * Will now show who killed you, what kind of weapon the enemy killed you with and the distance between you and the enemy.
* Refined Spawn Points.
  * If the player has a rebel license, they can spawn in either the rebel outposts or in the city.
  * If the player has a canadian passport, they can only spawn in canada.
  * If the player has both canadian passport and a rebel license, they can spawn in either canada or in one of the outposts.
* All Y-Inventory items will now save
* Donator discount included
* Unique loadscreen implemented
* Updated corrected cop light positions
* Configured dynamic market.
  

** Changelog 4.3.2015**

* SlingRoad Mechanism
  * Players can now slingroad ground vehicles
  * The pilot must have keys to that ground vehicle

** Changelog 4.2.2015**

* Cop Rank & Speaking Tag above Players
  * Players now get their rank icon + cop rank
* Rewritten Civ & Medic & Cop & Cop2 InteractionMenu
* Rewritten Civ & Medic & Cop & Cop2 VInteractionMenu
* Cops with level 2 or higher can now seize vehicles. Seized vehicles will be deleted.
* Cops can now breathalyze drunken players.
* Added in whiskey, moonshine, beer with unique effects
* Added in GPS Trackers
  * Available in cop, vigilante, rebel, civ market
* Added in SpeedBomb
  * Available in rebel market
  * Speedbomb will trigger at 70mph and will go off if the vehicle speed falls below 50.
* Added in vigilante class
  * Vigilante class can send players to jail and receive bounty.
  * When buying a vigilante license, the rebel license will be deleted.
  * Vigilantes receive smg tazers.
* Stringtable for gathering notification fix
* News System Implemented
  * Players with news license can now become newscasters
  * Powers to send out channel 1 news messages
  * Buying news license will remove rebel license and lawyer license
* Lawyer System Implemented
  * Players with lawyer license can now become lawyers
  * Powers to become an attorney for other players
  * Buying lawyer license will remove rebel license and news license
* Custom Jail Time Implemented
  * Cops can now input the amount of time they want to send their criminal for.
* Paintball System Implemented
  * Players will can join a lobby for paintball from a paintball npc
  * They will receive a cash prize if they have won the paintball arena
* Map updated with checkpoint + border + jail
* Robbing Shops

** Changelog 4.1.2015**

* Implemented group system
* Admin Menu Fix
  * Fix regarding permissions
* StatusBar Fix
  * Position & Color & Uptime Fix
* Deleted Rock/Cement & Sand/Glass
* Implemented New UI
  * Including wanted & fatigue
* Players can now press windows key to mine!
* Anti name-change mechanism
  * If players are changing their name and coming back into the server, they will be kicked with a prompt.
* Miranda rights will now show up on the screen of a restrained player
* NewLifeRule Timer
  * Timer will show up when the player dies.


** Changelog 3.31.2015**

* Independent class no longer has gang menu in the Y-menu.
* Implemented player position saving
* Admin Menu implemented for players with either admin level of 1 or 2.
* Implemented Dynamic Market
* Implemented statusbar



** Changelog 3.30.2015**

* Fix for OpFor Class
  * Added in vehicle shop for OpFor class
  * Added in vehicle shop licenses for OpFor class
  * Added in virtual shop for OpFor Class
  * Added in weapon shop for OpFor Class
  * OpFors can now open gates with "O" while in vehicles
  * Fixed black icon bug in stores

** Changelog 3.28.2015**

* Fix for OpFor Class
  * Civs can now get into vehicles that have OpFor in them.
  * OpFors now can restrain with Shift+R on civilians.
* Player texture for all playerside Ini [Will use when I receive usuable skins]

** Changelog 3.27.2015**

* Implemented OpFor Class; Codename: cop2
  * Working similarly as BlueFor
* Implemented passport system for 2 countries: Neochori Federation & Pyrgos United
  * Players will lose their current passport if they decide to declare another passport from a different country.
* Added InteractionMenu for OpFor Cops

** Changelog 3.24.2015**

* Updated Spyglass to cover more script kiddies
* Fixed black icons on spawn menu

** Changelog 3.23.2015**

* Anti-Hack Injection Fix
  * To stop some scripts from injecting executable function files from database.
* Disabled accessing Tactical View while restrained
* Disabled accessing maps while restrained
* Disabled accessing inventory while restrained
* Disabled picking up items while restrained
* Disabled throwing items while restrained
* Advanced Interaction with vehicles + Items [Implemented, however disabled for now]
  * Players are now able to tow ground vehicles with other ground vehicles
  * Players are now able to sling load ground vehicles with air vehicles
  * Players are now able to move & load & store selective building parts into vehicles
* FastRoping
  * Players are now able to fast rope down from selective helicopters for a faster landing.
* Deleting all snakes on map
  * Deleting all ambient snakes to avoid situations where snakes are opening locked doors.
* MagRepack Mechanism
  * When players are in a long fight, players are often ended up with mags with only 2~3 bullets in them. Now players can interact with the MagRepack by pressing LeftCtrl + R. MagRepack helps put all those scattered bullets into single mags. Just drag and drop.
* Fuel Consumption
  * Vehicles now consume more fuel than default
* Donator Discounts
  * There are 5 levels of donators. Donators pay less than non-donators when they are buying a vehicle, clothing or weapon.
  * Level 1 donator has 5 % discount
  * Level 2 donator has 10 % discount
  * Level 3 donator has 15 % discount
  * Level 4 donator has 20 % discount
  * Level 5 donator has 25 % discount
* Custom Battleye Filters
* Public Bluefor Cop Slots Removed


** Changelog 3.22.2015**

* Hotkey B - Pickaxe
* Hotkey 1 - Wanted List (Will upgrade to Persistent Wanted List later)
* Hotkey 2 - Smartphone (Will implement Persistent Smartphone soon)
* Hotkey 3 - Dynamic Market (Will implement Dynamic Market soon)
* Hotkey Shift+3 - Martial Arts Animation
* Hotkey Shift+4 - Kneebend Animation
* Hotkey Shift+5 - Kneebend Slow Animation
* Hotkey Shift+6 - Pushup Animation
* Hotkey Shift+7 - Scared Animation
* Hotkey Shift+8 - Scared#2 Animation
* Hotkey H/H - Holster instead of Shift+H & Ctrl+H
* Hotkey Shift+p - Earplugs; Lowers veh sounds
* Hotkey O - For cops in veh, opens gates. For cops on foot, interacts with spikestrips
* Hotkey U - Now physically opens doors on selected vehicles.


** Changelog 3.21.2015**

* Anti-VDM Mechanism
* Advanced Tazer Mechanism
* Dynamic Weather
* No-Side-Chat Mechanism