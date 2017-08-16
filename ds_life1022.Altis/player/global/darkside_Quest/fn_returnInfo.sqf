/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns the players currently selected quest info
*/

private ["_return","_curQuest","_warning","_myCurQuest"];

_return = [];
if(_this select 1)then
	{
	_curQuest = _this select 0;
	}
	else
	{
	switch(DS_questFocus)do
		{
		case 0:{_curQuest = (DS_infoArray select 13)};
		case 1:{_curQuest = (DS_infoArray select 15)};
		case 2:{_curQuest = (DS_infoArray select 17)};
		case 3:
			{
			if(playerSide isEqualTo west)then
				{
				_curQuest = (DS_infoArray select 21);
				};
			if(player getVariable ["security",false])then
				{
				_curQuest = (DS_infoArray select 19);
				};
			if(player getVariable ["mechanic",false])then
				{
				_curQuest = (DS_infoArray select 23);
				};
			if(player getVariable ["medic",false])then
				{
				_curQuest = (DS_infoArray select 10);
				};
			};
		};
	};

switch(DS_questFocus)do
	{
	case 0:{_myCurQuest = (DS_infoArray select 13)};
	case 1:{_myCurQuest = (DS_infoArray select 15)};
	case 2:{_myCurQuest = (DS_infoArray select 17)};
	case 3:
		{
		if(playerSide isEqualTo west)then
			{
			_myCurQuest = (DS_infoArray select 21);
			};
		if(player getVariable ["security",false])then
			{
			_myCurQuest = (DS_infoArray select 19);
			};
		if(player getVariable ["mechanic",false])then
			{
			_myCurQuest = (DS_infoArray select 23);
			};
		if(player getVariable ["medic",false])then
			{
			_myCurQuest = (DS_infoArray select 10);
			};
		};
	};

if(isNil "_curQuest")exitwith{_return};
if(isNil "_myCurQuest")exitwith{_return};

switch(DS_questFocus)do {
	case 0: {
		switch(_curQuest)do {
			case 0: {
				_return = ["Apple Picker","Pick 250 Apples from any of the apple fields marked on your map","$5000","Visit any Apple Orchard and pick apples by pressing tab"];
			};
			case 1: {
				_return = ["Truck Driver","Complete a truck driving job from the jobs depot","$5000","Visit any jobs depot to start a job as a truck driver"];
			};
			case 2: {
				_return = ["Repair a vehicle","Use a repair kit on any vehicle","$5000","With a repair kit in your inventory (Bought from a market or gas station), press windows key and click the repair icon while facing any vehicle"];
			};
			case 3: {
				_return = ["Catch a bus","Catch a bus and travel over 5km","$5000","Visit any bus stop and scroll to open the menu, catch the bus to any location over 5km away"];
			};
			case 4: {
				_return = ["Skydiving","Go Skydiving","$10000","Visit a sky diving center and select the option to skydive"];
			};
			case 5: {
				_return = ["Banking Insurance","Buy Bank Insurance","$10000","At any ATM, click the buy bank insurance button. This will save your money one time if the bank is robbed"];
			};
			case 6: {
				_return = ["Vehicle Storage Upgrade","Install a vehicle storage upgrade on a vehicle","$10000","Vehicle upgrades can be installed on your vehicles at any vehicle upgrade shop. This will enable your vehicle to carry more items"];
			};
			case 7: {
				_return = ["Taxi Driver","Complete a taxi mission","$10000","In a Taxi SUV press F5 to begin taxi missions"];
			};
			case 8: {
				_return = ["Factory","Craft a material","$10000","At a factory, craft any of the materials. These materials can then be used to craft items"];
			};
			case 9: {
				_return = ["Dive Fishing","Catch 20 fish by hand","$15000","Swim up to a fish in the ocean and press the windows key on it to catch it"];
			};
			case 10: {
				_return = ["Pick-Axe","Use a pickaxe 50 times","50% quicker Pick Axe usage","Buy a pickaxe at the market and use it (Press 'Tab') at any mineral mining field"];
			};
			case 11: {
				_return = ["Use NOS","Install and activate NOS on your vehicle","$15000","Nitro kits can be bought in most shops, install these by pressing the windows key on your vehicle and selecting 'Install NOS'"];
			};
			case 12: {
				_return = ["Deliver Fuel","Complete fuel delivery mission","Tempest Fuel Truck","Visit any Jobs Depot to begin your fuel delivery job. Follow the instructions to complete this quest"];
			};
			case 13: {
				_return = ["Vehicle Fuel Upgrade","Install a vehicle fuel upgrade on a vehicle","$20000","Vehicle upgrades can be installed on your vehicles at any vehicle upgrade shop. This will enable your vehicle to consume fuel more efficiently"];
			};
			case 14: {
				_return = ["Life Insurance","Purchase 10 life insurances","$20000","Life insurance can be bought at the insurance broker in Athira, when you die you do not drop your cash if you have life insurance'"];
			};
			case 15: {
				_return = ["Toll Booth","Drive through a toll booth","$20000","Tool booths are placed on time saving roads, the fee removed is calculated by your total bank money"];
			};
			case 16: {
				_return = ["Jerry Can","Refuel your vehicle","50% more fuel per jerry can use","Refuel your vehicle buy using a jerry can. Press the windows key on the vehicle when you have a refuel kit in your inventory"];
			};
			case 17: {
				_return = ["Chopper Cargo Missions","Complete a chopper cargo mission","Ability to buy the advanced weapons license","Chopper cargo missions can be started at any jobs depot"];
			};
			case 18: {
				_return = ["Realistic Mode","Switch into realistic mode","$50000","You can switch into, or out of realistic mode at the Athira Insurance Broker, Information about realistic mode can be found in the J menu"];
			};
			case 19: {
				_return = ["Lotto Winner","Win lotto","$50000","Buy a lotto ticket at any market or gas station and win any division to pass this quest"];
			};
			case 20: {
				_return = ["Vehicle Insurance","Install insurance on a vehicle","$50000","Install vehicle insurance on any vehicle at an upgrades shop"];
			};
			case 21: {
				_return = ["Fishing Net","Catch 100 fish using a fishing net","$50000","Drive a boat into the ocean and bring it to halt. Then scroll to drop net, move around to collect more fish"];
			};
			case 22: {
				_return = ["Mineral Processor","Process 300 Legal Minerals","30% faster legal processing","Minerals can be processed at their respective processing areas. Once processed they can be sold or used to craft items"];
			};
			case 23: {
				_return = ["Truck Driver Promotion","Get promoted as a truck driver","25% extra payment for truck driving jobs","Visit any jobs depot to start a job as a truck driver, after completing 4 jobs you will be promoted to the next level"];
			};
			case 24: {
				_return = ["Blueprints","Check a blueprint out","$50000","After buying a blueprint from a factory, open your 'y' menu and click 'use' on the blueprint for information"];
			};
			case 25: {
				_return = ["Auto Miner","Use the Auto Miner to collect Minerals","$75000","The Auto Miner will full itself up with resources when you take it to a resource field and activate it using the windows key"];
			};
			case 26: {
				_return = ["Taxi Driver Promotion","Get promoted as a taxi driver","Extra 25% payment for taxi missions","In a Taxi SUV press F5 to begin taxi missions, after completing 4 missions you will be promoted to the next level"];
			};
			case 27: {
				_return = ["Relics","Collect 300 legal relics","50% faster relic collection","Legal Relics can be searched for at the shipwrecks marked on the map, just swim 10m under the shipwreck and press tab, these are then sold for profit"];
			};
			case 28: {
				_return = ["Get Treated","Visit a hospital and get yourself checked over","50% off all future hospital fees","Being revived by anybody other than a medic can lead to an infection, these are treated at any hospital"];
			};
			case 29: {
				_return = ["Deliver Fuel Advanced","Complete three fuel delivery missions","Taru (Fuel) in your garage","Visit any Jobs Depot to begin your fuel delivery job. (Finish three missions to complete this quest)"];
			};
			case 30: {
				_return = ["Special Vehicle Upgrade","Apply a special vehicle upgrade to a vehicle","$75000","Special upgrades can be installed on certain vehicles, these are applied at vehicle upgrade shops (Both Offroads, Hummingbirds and M900's)"];
			};
			case 31: {
				_return = ["Air Taxi","Complete an Air Taxi Mission","Extra 20% payment for Air Taxi Missions","Air Taxi missions are started at air fields. Complete the mission to finish the quest. If you have already completed this job chain simply complete a mission at the top level to complete this quest"];
			};
			case 32: {
				_return = ["Use NOS Advanced","Install and activate NOS on your vehicle 50 times","Double the amount of uses from any NOS kit you install","Nitro kits can be bought in most shops, install these by pressing the windows key on your vehicle and selecting 'Install NOS'"];
			};
			case 33: {
				_return = ["Crop Dusting","Dust some crops","20% extra payment for crop dusting jobs","Complete a drop dusting mission, started at air fields"];
			};
			case 34: {
				_return = ["Chopper Cargo Advanced","Get promoted doing chopper cargo missions","50% extra payment for cargo missions","Chopper cargo missions can be started at any jobs depot"];
			};
			case 35: {
				_return = ["Life Insurance","Purchase 100 life insurances","Spawn in with bank insurance","Life insurance can be bought at the insurance broker in Athira, when you die you do not drop your cash if you have life insurance'"];
			};
			case 36: {
				_return = ["Big Auction Spender","Spend over $1m on one auction","Ability to make a custom Real Estate","Bid and win an auction at the black market auction house for an amount over $1m"];
			};
			case 37: {
				_return = ["Airbags Vehicle Upgrade","Apply airbags vehicle upgrade to a vehicle","Airbag upgrades give double the airbags","Airbags upgrades can be installed on land vehicles, when applied the vehicles crew does not take damage during crashes, until the air bags run out"];
			};
			case 38: {
				_return = ["Big Time Trucker","Carry a wideload (Level 12)","Ability to purchase 2 extra real estate property's","Carry a wideload truck mission. If you have already completed this job chain simply complete a mission at the top level to complete this quest"];
			};
			case 39: {
				_return = ["Crafting Level","Increase your crafting level","All crafting is 50% faster","Your crafting level increases over time as you continue to craft"];
			};
			case 40: {
				_return = ["Air Taxi Advanced","Get promoted as an Air Taxi Pilot","Extra 30% payment for Air Taxi Missions","Air Taxi missions are started at air fields. Complete the mission to finish the quest.. If you have already completed this job chain simply complete a mission at the top level to complete this quest"];
			};
			case 41: {
				_return = ["Deliver Fuel Advanced pt2","Complete three fuel delivery missions","All ungaraged vehicles come with a super fuel upgrade installed","Visit any Jobs Depot to begin your fuel delivery job. (Finish three missions to complete this quest)"];
			};
			case 42: {
				_return = ["Animal Repellent","Install Animal Repellent on 10 vehicles","All ungaraged vehicles automatically have Animal Repellent upgrade added","This upgrade prevents vehicles from hitting random animals during the night"];
			};
			case 43: {
				_return = ["Fishing Advanced","Catch 200 fish by hand","Your water skills enable you to quench a small amount of thirst when eating","Catch fish by pressing windows key on them while swimming"];
			};
			case 44: {
				_return = ["Pro Taxi Driver","Complete a level 18 or higher taxi mission","Never have to sit your Car/Truck license test again (Just pay for it)","Taxi missions are started by pressing F5 while inside an SUV taxi"];
			};
			case 45: {
				_return = ["Drink Up","Drink water 5km in the air","Thirst gain is halved","Learn how to control your bladder by drinking at 5km in the air"];
			};
			case 46: {
				_return = ["Crop Dusting Advanced","Complete 5 Crop Dusting Runs","50% less chance of real estate damages","Crop dusting missions are started at air fields. Complete 5 missions to finish the quest"];
			};
			case 47: {
				_return = ["Pro Air Taxi Pilot","Complete the last level of Air Taxi Missions (Level 10)","Ability To Purchase the Blackwasp jet at Air Shops","Reach the end of the Air Taxi Pilot missions"];
			};
			case 48: {
				_return = ["Pro Truck Driver","Complete a job in the last level of truck driving (Level 14)","Ability to purchase two extra houses over your limit","Reach the end of the truck driving mission"];
			};
			case 49: {
				_return = ["Pro Chopper Cargo Pilot","Do a mission on the last level of cargo pilot (Level 17)","Never have to sit your Air license test again (Just pay for it)","Chopper cargo missions can be started at any jobs depot"];
			};
			case 50: {
				_return = ["Random Auction","Win a random auction at the black market","Never again win a resource in a random auction","Random auctions at the black market can contain many different rewards"];
			};
			case 51: {
				_return = ["Win $1m from Lotto","Win a total of $1m while playing civilian","Unlimited Airbags on all retrieved land vehicles","Over time win a total of $1m from lotto"];
			};
			case 52: {
				_return = ["Custom Realestate","Create some custom realestate","Ability to prestige the civilian quest line","Custom realestate is made at the realestate buildings and increases your paychecks. (Press 7 if you've already made one)"];
			};
			case 53: {
				_return = ["Coming Soon","Coming Soon","Coming Soon","Coming Soon"];
			};
		};
	};
	case 1: {
		switch(_curQuest)do {
			case 0: {
				_return = ["Create a Gang","Create a gang so you can play as a group","$5000","Gangs are created in the 'Y' menu by clicking the Gang button"];
			};
			case 1: {
				_return = ["Rob a Gas Station","Rob any Gas Station for some cash","$5000","Scroll on the counter in marked Gas Stations, select rob to begin a robbery"];
			};
			case 2: {
				_return = ["Knock Someone out","Knock out any other player","$5000","Press (Shift+G) when facing another player (Must have a weapon)"];
			};
			case 3: {
				_return = ["Siphon Fuel","Use a Siphon kit on someones vehicle","$5000","Buy a Siphon kit from a Gang Hideout then use it by pressing the windows key on a vehicle"];
				};
			case 4: {
				_return = ["Drug Convoy","Complete a Land Drug Convoy Mission","Hemtt","Start a land drug convoy mission from any gang hideout, begin them at the flag of any area that you own"];
				};
			case 5: {
				_return = ["Lockpick a Vehicle","Use a lockpick on somebodies vehicle","$10000","Attempt to lockpick somebodies vehicle by pressing the windows key while facing the vehicle when you have a lockpick in your inventory"];
				};
			case 6: {
				_return = ["Rob somebody","Rob anybody","$10000","Once somebody is knocked out, scroll on them to rob them of any money they may be carrying"];
				};
			case 7: {
				_return = ["Capture a Gang Hideout","Capture a Hideout","$20000","Once you're in a gang, select a flag at a gang hideout and select 'capture'"];
				};
			case 8: {
				_return = ["Rob a Hospital (Cash)","Steal money from a hospital","$20000","Visit a northern hospital and rob it for cash"];
				};
			case 9: {
				_return = ["Weapons Convoy","Complete a gang hideout land weapons convoy","Weapons Convoys cost half the price","Weapons convoys are started the same way as drug convoys. Instead of cash you are awarded with rare weapons in truck"];
				};
			case 10: {
				_return = ["Chop Shop","Chop a vehicle","Ability to purchase the Qilin from gang hideouts","Steal somebodies vehicle and take it to a chop shop to receive money for it"];
				};
			case 11: {
				_return = ["Pay Bail","Pay bail to get an early release from jail","$25000","Get yourself jailed and then pay bail halfway through your sentence to get an early release"];
				};
			case 12: {
				_return = ["Illegal Relics","Collect some illegal Relics","$25000","Visit a shipwreck and dive for illegal relics, these can then be processed at illegal relics processor then sold"];
				};
			case 13: {
				_return = ["Strangle Someone","Strangle a downed person","$30000","Press windows key on a downed player to strangle him, this makes them unable to be revived"];
				};
			case 14: {
				_return = ["Lockpick Advanced","Successfully Lockpick 3 vehicles","$30000","Lock pick three vehicles"];
				};
			case 15: {
				_return = ["Drug Harvester","Harvest 500 Drugs","Drug harvest speed increased by 30%","With 60kg's of free space and while standing in a drug field, simply press tab to begin harvesting drugs. Harvest speed is determined by your morality"];
				};
			case 16: {
				_return = ["Rob a Cop","Rob a police officer","$50000","Knockout and rob a police officer"];
				};
			case 17: {
				_return = ["Rob a Hospital (Chemicals)","Steal Chemicals from a hospital","$50000","When robbing a hospital select the chemical option. These can then be used to process Meth"];
				};
			case 18: {
				_return = ["Cop Killer","Kill a police officer","Ability to purchase the prowler from gang hideouts and rebel vehicle shops","Murder a police officer (Make sure it's not RDM)"];
				};
			case 19: {
				_return = ["Capture a Gang Hideout Part 2","Capture a Hideout","$20000","Once you're in a gang, select a flag at a gang hideout and select 'capture'"];
				};
			case 20: {
				_return = ["Rob Gas Stations","Steal at least $100k from gas stations","Alcohol Effects last double the normal length","Continue robbing gas stations until you have taken a total of $100k"];
				};
			case 21: {
				_return = ["Drug Convoys Advanced","Complete three land drug convoys","Offroad HMG in your garage","Complete three land drug convoy missions to complete this quest"];
				};
			case 22: {
				_return = ["Meth Head","Process some Meth","$60000","Combine the two needed ingredients to process Meth at the processor in the rebel KOS zone"];
				};
			case 23: {
				_return = ["Siphon Fuel Advanced","Use a Siphon kit on a police vehicle","$60000","Buy a Siphon kit from a Gang Hideout then use it by pressing the windows key on a police vehicle"];
				};
			case 24: {
				_return = ["Fake ID Convoy","Complete a fake ID convoy","50% off start price for fake ID convoys","Fake ID convoys are started at gang hideouts, they give you an item that you can use to hide your identity"];
				};
			case 25: {
				_return = ["Process Illegal Relics","Process 300 illegal relics at the illegal relics processor","$75000","Relics can be processed (Cleaned) at the illegal relics processor"];
				};
			case 26: {
				_return = ["Weapons Convoy Advanced","Complete three gang hideout land weapons convoys","Taru (Ammo) in your garage","Weapons convoys are started the same way as drug convoys. Instead of cash you are awarded with rare weapons in truck"];
				};
			case 27: {
				_return = ["Drug Processor","Process 500 units of drugs","Processing speed increased by 30%","Process your collected drugs at the tub in a gang hideout that you own"];
				};
			case 28: {
				_return = ["Own three Gang Hideouts at once","Capture and hold any three hideouts at once","Hideout capture speed increased by 20%","By owning three hideouts, you will receive extra income from those gang hideouts. Once you receive a payment you will complete this quest"];
				};
			case 29: {
				_return = ["Cop Killer Gang Hideout","Kill a police officer at any gang hideout","20% faster reviving","Ambush police raiding a gang hideout and kill an officer to complete this quest"];
				};
			case 30: {
				_return = ["Chop Shop Advanced","Chop five police vehicles","Lockpicks work 30% faster","Steal five police vehicles and take it to a chop shop to receive money for it"];
				};
			case 31: {
				_return = ["Token Mission","Complete a token mission from the rebel kos flag","Adds a hotkey (ctrl + L) to quickly lock and unlock gang","Capture the rebel KOS area to be allowed to begin token missions at the flag"];
				};
			case 32: {
				_return = ["Hospital Robbery Advanced","Steal money from hospitals","$100k","Steal a total of $100k from hospitals to complete this quest"];
				};
			case 33: {
				_return = ["Chop Shop Expert","Chop ten vehicles","Chopshop works 50% faster","Steal ten vehicles and take it to a chop shop to receive money for it"];
				};
			case 34: {
				_return = ["Gangster Killer","Kill and strangle three people at any gang hideout","All future water weapons convoys come with a gas helmet","Gang hideouts are KOS zones, kill and strangle three people in one of these hideouts to complete this quest"];
				};
			case 35: {
				_return = ["KOS Token Payments","Complete 4 token missions from the KOS flag","10 minutes off KOS Capture point capture time","Once you've captured the KOS point, begin token missions at the flag"];
				};
			case 36: {
				_return = ["Gang Hideout Advanced","Receive 5 payments while owning three gang hideouts at once","20% quicker Hideout Cap time","Receive 5 Payments for owning three hideouts at once"];
				};
			case 37: {
				_return = ["Fake ID Convoy Advanced","Complete 3 fake ID convoys","Double the income from gang payments","Fake ID convoys are started at gang hideouts, they give you an item that you can use to hide your identity"];
				};
			case 38: {
				_return = ["Weapons Convoy Advanced","Complete three land weapons convoys","Each weapons convoy you complete will also contain a gas resistant illegal helmet","Weapons convoys are started the same way as drug convoys. Instead of cash you are awarded with rare weapons in truck"];
				};
			case 39: {
				_return = ["Hostage Mission","Complete a Hostage Mission","Police do not get your name when you take a hostage","Take a hostage to a hostage area and attempt to collect a ransom for him before the police stop you"];
				};
			case 40: {
				_return = ["Addict","Process 1000 units of drugs","Getting drunk allows you to carry 300kg in stead of the normal 120kg","Drugs are processed at gang hideouts (This quest excludes meth)"];
				};
			case 41: {
				_return = ["Meth Head Part 2","Process 300 units of Meth","Allows you to craft and use no recoil items at factory's","Combine the two needed ingredients to process Meth at the processor in the rebel KOS zone"];
				};
			case 42: {
				_return = ["Strangle Three People","Strangle three downed people","Strangle now works 50% faster","Press windows key on a downed player to strangle him, this makes them unable to be revived"];
				};
			case 43: {
				_return = ["Process Illegal Relics","Process 500 illegal relics at the illegal relics processor","Processing time of illegal relics 50% faster","Relics can be processed (Cleaned) at the illegal relics processor"];
				};
			case 44: {
				_return = ["Land Weapons Convoy Expert","Complete 5 Land weapons convoys","All future land weapons convoys come with 2 gas helmet's","Weapons convoys are started the same way as drug convoys. Instead of cash you are awarded with rare weapons in truck"];
				};
			case 45: {
				_return = ["Cop Killer (Hospitals)","Kill 10 police officers while you are within 200m of hospitals","Future hospital robberies will pay double the cash","Rob a hospital to make it a kos area then kill responding police officers to complete this quest"];
				};
			case 46: {
				_return = ["Chop shop (Armoured)","Chop 5 police armoured vehicles","Double the payout from all future police vehicle chops","Chop 5 police armoured vehicles"];
				};
			case 47: {
				_return = ["KOS Token Payments part 2","Complete 20 token missions from the KOS flag","All future token payments are doubled","Once you've captured the KOS point, begin token missions at the flag, tokens gained by gang members will also count towards this quest"];
				};
			case 48: {
				_return = ["Hostage Mission (Cop)","Take a cop hostage and complete the hostage mission","Ability to prestige your gang questline (Details on J Menu)","Take a cop hostage to a hostage area and attempt to collect a ransom for him before the police stop you"];
				};
			case 49: {
				_return = ["Coming Soon","Coming Soon","Coming Soon","Coming Soon"];
				};
			};
		};
	case 2:
		{
		switch(_curQuest)do
			{
			case 0: {
				_return = ["Advanced Rebel Training","Buy Adv Rebel Training","$10000","Buy Adv Rebel training at a rebel outpost, with this you can respawn at a rebel hideout after one death, you can also revive your team"];
				};
			case 1: {
				_return = ["Revive","Revive a downed player","$10000","When you have Adv Rebel training you can revive other down rebels. Simply use the windows key on them to bring them back from the dead"];
				};
			case 2: {
				_return = ["Lighter","Light a vehicle on fire","$10000","Using a lighter bought at a rebel hideout, light a vehicle on fire using the windows key, then stand back and watch the fireworks"];
				};
			case 3: {
				_return = ["Use C4","Use a C4 explosive","$20000","The C4 bought at rebel hideouts can currently be used to destroy the power station, blow open the bank doors and bust people out of jail"];
				};
			case 4: {
				_return = ["Carbomb","Complete a Carbomb mission","Orca in your garage","Begin a car bomb mission at a rebel hideout"];
				};
			case 5: {
				_return = ["Checkpoint","Begin Checkpoint Takeover","$25k","Begin a checkpoint take over, just scroll in a police checkpoint area to begin the capture process"];
				};
			case 6: {
				_return = ["Ziptie","Ziptie someone","$25k","Zipties are bought at rebel hideouts, they can be used to restrain players"];
				};
			case 7: {
				_return = ["IED","Use an IED","$30k","IED's are bought at rebel hideouts. Use them by first placing them then activating them with your scroll wheel"];
				};
			case 8: {
				_return = ["Armed Land Vehicle","Buy an Armed Land Vehicle","$50k","Armed vehicles can be bought at Rebel Hideouts. Rebels use these to combat the police. Rent or Buy one of these vehicle to complete this quest"];
				};
			case 9: {
				_return = ["Destroy Power Station","Destroy the power station","$100k","Using C4, destroy the Altis Power Station to turn out the lights"];
				};
			case 10: {
				_return = ["Cop Killer Athira","Kill a police officer in Athira","$150k","Simply Kill a cop in Athira, make sure it's not RDM"];
				};
			case 11: {
				_return = ["Vehicle Rearm","Rearm a vehicle","50% quicker vehicle rearming","Rearm your armed vehicle at any gang hideout (At the flag)"];
				};
			case 12: {
				_return = ["Buy a Safe Cracker","Buy a Safe Cracker","$30k","Buy a safe cracker that is used to crack safes at Fort Knox. (Safe Crackers are bought at the Rebel Kos items shop"];
				};
			case 13: {
				_return = ["Spy Docs","Steal the spies documents","$150k","Hunt down the spy and scroll on him to take his documents, these can be sold at rebel item traders, found at rebel hideouts"];
				};
			case 14: {
				_return = ["Cop Restrain","Restrain a police officer","$200k","Knock out a police officer and restrain him using zipties to complete this quest"];
				};
			case 15: {
				_return = ["Big Jail","Get sent to jail","Can not fail doing hard jail work","Get sent to jail for 30 minutes (Tip - You will need to have rebel vehicle training)"];
				};
			case 16: {
				_return = ["Money Bags","Steal a Bag Of Money","$200k","Steal a bag of money from the safe at the national bank"];
				};
			case 17: {
				_return = ["Cop Killer Bank","Kill a cop in the bank","$200k","Simply kill a cop in the bank area"];
				};
			case 18: {
				_return = ["Capture Checkpoint","Capture a police checkpoint","$250k","Capture a checkpoint, complete the 10 minute capture period to complete the quest"];
				};
			case 19: {
				_return = ["Steal Police Money","Take police bank money","Scope Sway Halved","Crack open the money safe at Fort Knox to steal the money from the police bank"];
				};
			case 20: {
				_return = ["Blow the doors","Blow open the banks doors","25% fast C4 usage","Using C4, blow open the banks doors"];
				};
			case 21: {
				_return = ["Thermal Strider Convoy","Complete a convoy","Ifrit HMG in your garage","Complete the unarmed thermal strider convoy, these are started at the north and south rebel hideouts"];
				};
			case 22: {
				_return = ["Research Facility","Begin cracking the safe at the research facility","Carbombs explode 50% quicker","Use a safecracker on the safe at the research facility to gain access to rare Y inventory items"];
				};
			case 23: {
				_return = ["Sell Spy Docs","Sell spy documents","$50k","Simply sell the stolen documents to complete this quest"];
				};
			case 24: {
				_return = ["Craft A Lynx","Craft a Lynx at a Factory","Ability to craft the Land Vehicle Ammo upgrade","Gather all the required parts and craft a Lynx at any Factory"];
				};
			case 25: {
				_return = ["Escape Jail","Escape the Altis Jail","1 Minute off all future sentences","Get a group of friends to bust you out of jail using c4 to complete this quest"];
				};
			case 26: {
				_return = ["Cop Killer Fort Knox","Kill a cop in Fort Knox","Ability to purchase Stun Armour at rebel item shops","Kill a police officer in Fort Knox"];
				};
			case 27: {
				_return = ["Take Batteries","Take Thermal Batteries","Ability to craft the bulletproof SUV","Take a thermal battery, either from a stolen convoy or the bottom safe at Fort Knox"];
				};
			case 28: {
				_return = ["IED Advanced","Set off three IED's in Athira","IED activation distance increased to 200m","Set off three IED's in Athira"];
				};
			case 29: {
				_return = ["Cop Killer Jail","Kill a cop at Jail","Ability to purchase Y inventory Armed planes from the KOS area","Simply kill a police officer at the Jail to complete this quest"];
				};
			case 30: {
				_return = ["Thermal Hellcat Convoy","Complete the Hellcat Convoy","Armed Ghost Hawk in your garage","Complete the Thermal Hellcat Mission, started at rebel hideouts"];
				};
			case 31: {
				_return = ["Checkpoint Advanced","Capture and hold a police Checkpoint","25% extra checkpoint payments","Receive four payments for holding a police checkpoint"];
				};
			case 32: {
				_return = ["Blow the jail gates","Blow open the jail gates","50% faster C4 usage","Use C4 at the jail gates to blow them open"];
				};
			case 33: {
				_return = ["Armed Strider Convoy","Complete the armed strider convoy","Rebel Convoys Start Prices 50% Off","Complete the armed strider convoy to finish this quest"];
				};
			case 34: {
				_return = ["Read the spy docs","What's in those spy docs anyway","50% off your money returned on all rebel trainings plus the ability to purchase Y inventory DAR pawnees at the KOS area","Get sent to jail while holding 10 spy documents in your inventory"];
				};
			case 35: {
				_return = ["Stay Calm","Lower that scope sway","Low morality no longer increases your scope sway","Use an escape jail card three times (Bought at rebel KOS token shop)"];
				};
			case 36: {
				_return = ["DAR Pawnee","Unpack a DAR Pawnee","Ability to craft Air Vehicle Ammo upgrades","DAR pawnees are bought using rebel tokens from the rebel KOS capture point"];
				};
			case 37: {
				_return = ["Money Bags Advanced","Steal 10 Bags Of Money","Taking money bags from the bank is 50% quicker","Steal 10 bags of money from the safe at the national bank"];
				};
			case 38: {
				_return = ["Terrorist Mission","Complete a Terrorist Mission","Ability to purchase Y inventory blackfoots from the KOS area","Terrorist Missions begin at rebel outpost, complete one to finish this quest"];
				};
			case 39: {
				_return = ["Carbomber Expert","Complete five Car Bomb Missions","Carbomb payout is doubled","Complete five carbomb missions to complete this quest"];
				};
			case 40: {
				_return = ["Extreme Arsonist","Light 10 police vehicles on fire","50% faster lighter use","Using a lighter bought at a rebel hideout, light 10 police vehicles on fire using the windows key, then stand back and watch the fireworks"];
				};
			case 41: {
				_return = ["Vehicle Rearm Advanced","Vehicle Rearm Advanced","20% quicker revive speed","Install a vehicle ammo upgrade on either an armed land or air vehicle"];
				};
			case 42: {
				_return = ["Steal spy docs advanced","Steal spy docs advanced","All rebel kits come with an extra 3 stun armours","Steal 5 spy docs from the spy while hes on his way to the bank"];
				};
			case 43: {
				_return = ["Steal Police Money (Advanced)","Take $1m from the safe at Fortknox","Ability to prestige Rebel quest line (Details on J menu)","Crack open the money safe at Fort Knox to steal at least $1m out of the money from the police bank"];
				};
			case 44: {
				_return = ["Coming Soon","Coming Soon","Coming Soon","Coming Soon"];
				};
			};
		};
	case 3:
		{
		switch(_curQuest)do
				{
				case 0:
					{
					_return =
					["Unavailable","These quest are for whitelisted civilian jobs only","",""];
					};
				};
		if(player getVariable ["medic",false])then
			{
			switch(_curQuest)do
				{
				case 0:
					{
					_return =
					["Clean Up Kavala","Remove 10 human remains from the Kavala area","$10k","Remove 10 human remains in the Kavala area to complete this quest (Within 3km)"];
					};
				case 1:
					{
					_return =
					["Clean Up The Bank","Remove 3 human remains near the bank","$10k","Remove 3 human remains near the bank to complete this quest (Within 500m)"];
					};
				case 2:
					{
					_return =
					["Make medikits","Make 10 medikits","25% off medikit creation price","Each medikit cost $200 to make, make 10 through your scroll option to complete this quest"];
					};
				case 3:
					{
					_return =
					["Revive Someone","Revive a downed person","50% quicker reviving","Windows key on incapacitated person to revive them"];
					};
				case 4:
					{
					_return =
					["Force Unlock","Force open the locks of a vehicle","50% quicker force lock speed","Medics can force unlocked a vehicle to eject incapacitated persons inside the vehicle"];
					};
				case 5:
					{
					_return =
					["Return Human Remains","Return 20 human remains to Kavala","25% extra payment for delivering human remains","Collected human remains can be traded for cash at hospitals"];
					};
				case 6:
					{
					_return =
					["Charge Someone","Charge someone atleast $1k","$25k","Windows key on a player to offer them a chance to pay you for your services out of their bank account"];
					};
				case 7:
					{
					_return =
					["Clean Up Athira","Remove 10 human remains nearby Athira","$25k","Remove 10 human remains within 5km of Athira to complete this quest (Within 3km)"];
					};
				case 8:
					{
					_return =
					["Speed Boost","Use the Medic Speed Boost 20 times","10s off boost reload timer","Medics have a small nos boost on all land vehicles, pressing space activates this"];
					};
				case 9:
					{
					_return =
					["Treat Sickness","Treat somebodies sickness","$50k","Sometimes after being revived by a dodgey doctor a player may catch an infection, Medics can heal this on the spot"];
					};
				case 10:
					{
					_return =
					["Medic Missions","Complete 20 Medic Missions","Medic Mission Promotion","Medic Missions upgrade after each medic mission quest is completed. The missions are started at hospitals"];
					};
				case 11:
					{
					_return =
					["Clean Up Pyrgos","Remove 5 human remains nearby Pyrgos","Double payment for cleaning up human remains","Remove 5 human remains within 5km of Pyrgos to complete this quest (Within 3km)"];
					};
				case 12:
					{
					_return =
					["Revive Someone p2","Revive a downed person","25% extra revive payment","Windows key on incapacitated person to revive them"];
					};
				case 13:
					{
					_return =
					["Return Human Remains pt2","Return 20 human remains to Telos Hospital","Ability to quick travel between hospitals","Collected human remains can be traded for cash at hospitals"];
					};
				case 14:
					{
					_return =
					["M900","Buy A Medic M900","Ability to refuel at any hospital","The M900 Chopper is used by medics to travel quickly around the Island"];
					};
				case 15:
					{
					_return =
					["Clean Up Gang Hideouts","Clean up 3 human remains at any gang hideout","$75k","Gang hideouts are KOS zones, take extra care not to become a human remain yourself"];
					};
				case 16:
					{
					_return =
					["Make Medikits pt2","Make 20 medikits","Medikits created instantly","Each medikit cost $150 to make, make 20 through your scroll option to make them instantly in the future"];
					};
				case 17:
					{
					_return =
					["Charge Someone pt2","Charge someone at least $20k","Air Bags on all ungaraged vehicles","Windows key on a player to offer them a chance to pay you for your services out of their bank account"];
					};
				case 18:
					{
					_return =
					["Clean up Sofia","Clean up 3 human remains from around Sofia","+50% Human Remain clean up payment","Clean up any human remains you find around Sofia (Within 5km)"];
					};
				case 19:
					{
					_return =
					["Revive People","Revive 3 incapacitated people","50% extra revive payment","Using your windows key revive 3 incapacitated people"];
					};
				case 20:
					{
					_return =
					["Medic Missions","Complete 20 Medic Missions","Medic Missions Promotion","Medic missions are started at Hospitals, the mission size depends on your quest level"];
					};
				case 21:
					{
					_return =
					["Clean Up Gang Hideouts","Clean up 4 human remains at any gang hideout","Civilian Markers around Telos Hospital","Gang hideouts are KOS zones, take extra care not to become a human remain yourself"];
					};
				case 22:
					{
					_return =
					["Speed Boost pt2","Use the Medic Speed Boost 50 times","Further 10s off boost reload timer","Medics have a small nos boost on all land vehicles, pressing space activates this"];
					};
				case 23:
					{
					_return =
					["Return Human Remains pt3","Return 50 human remains to Sofia Hospital","Quick Travel Speed Doubled","Collected human remains can be traded for cash at hospitals"];
					};
				case 24:
					{
					_return =
					["Revive Many People","Have at least 20 revives over all of time","Adv Security on all ungaraged vehicles","Have at least 20 revives while playing as a medic"];
					};
				case 25:
					{
					_return =
					["Clean Up Gang Hideouts","Clean up 5 human remains at any gang hideout","Civilian Markers around Sofia Hospital","Gang hideouts are KOS zones, take extra care not to become a human remain yourself"];
					};
				case 26:
					{
					_return =
					["Medic Missions","Complete 20 air crash rescue missions","Buyable Orca In the Air Shop","Complete 20 of the current medic missions that you are on"];
					};
				case 27:
					{
					_return =
					["Dedication","Play at least 50 hours as a whitelisted civilian","Ability to use a building box from your vehicles","Play a combined total of 50 hours as a whitelisted civilian (Quest will complete when you open your stats menu)"];
					};
				case 28:
					{
					_return =
					["KOS Clean up","Clean up 5 human remains in the rebel KOS Area","Human remains return payment doubled","Rebel KOS is the most dangerous area on Altis, sneak in and out or end up as a human remain yourself"];
					};
				case 29:
					{
					_return =
					["Medic Missions","Complete 20 poison gas medic missions","Bullet Proof SUV in Garage","Complete 20 of your current medic missions"];
					};
				case 30:
					{
					_return =
					["Coming Soon","Coming Soon","Coming Soon","Coming Soon"];
					};
				};
			};
		if(player getVariable ["mechanic",false])then
			{
			switch(_curQuest)do
				{
				case 0:
					{
					_return =
					["Clean Up Kavala","Impound 20 vehicles in Kavala","$10k","Impound abandoned cars within 5km of Kavala to complete this quest (Within 5km)"];
					};
				case 1:
					{
					_return =
					["Clean Up Anywhere","Impound 20 vehicles anywhere on Altis","$10k","Impound abandoned cars anywhere on Altis so long as they are not at a jobs depot (Within 5km)"];
					};
				case 2:
					{
					_return =
					["Make Repair Kits","Make 10 repair kits","25% off repair kit created price","Each repair kit cost $200 to make, make 10 through your scroll option to complete this quest"];
					};
				case 3:
					{
					_return =
					["Make Some Money","Charge people for your services","10% payout for impounding vehicles","Charge people for your services, charge a total combined amount of $10k to complete this quest"];
					};
				case 4:
					{
					_return =
					["Clean Up Athira","Impound 10 vehicles in the Athira Region","$15k","Impound abandoned cars within 5km of Athira to complete this quest (Within 5km)"];
					};
				case 5:
					{
					_return =
					["Make NOS Kits","Make 10 NOS kits","25% off nos kit created price","Each NOS kit cost $800 to make, make 10 through your scroll option to complete this quest"];
					};
				case 6:
					{
					_return =
					["Force Locks","Force open a vehicles locks","$15k","Sometimes there is a dead body inside a vehicle, windows key on it to force it unlocked then kick the dead body out before impounding"];
					};
				case 7:
					{
					_return =
					["Clean Up Pyrgos","Impound 10 vehicles in the Pyrgos Region","$20k","Impound abandoned cars within 5km of Pyrgos to complete this quest (Within 5km)"];
					};
				case 8:
					{
					_return =
					["Clean Up Police Vehicles","Impound 10 police vehicles","+20% payment for impounding vehicles","Impound abandoned police cars, be sure to have police permission before impounding their vehicles"];
					};
				case 9:
					{
					_return =
					["Kavala Tow Truck","Tow 10 vehicles back to the Kavala impound lot","+50% Impound speed","Impounding vehicles at impound lots pay more, tow them there to receive more of a reward"];
					};
				case 10:
					{
					_return =
					["Air Vehicles","Impound Air Vehicles","Unlimited Air Bags on all un-garaged land vehicles","Impound 10 Air Vehicles, the vehicles must be impounded on the spot, not towed"];
					};
				case 11:
					{
					_return =
					["Make repair kits","Make 10 repair kits","50% off repair kit created price + Instant creation speed","Simply create 10 repair kits through your scroll menu to complete this quest"];
					};
				case 12:
					{
					_return =
					["Athira Tow Truck","Tow 30 vehicles back to the Athira impound lot","+25% Tow Truck Impound Reward","Impounding vehicles at impound lots pay more, tow them there to receive more of a reward"];
					};
				case 13:
					{
					_return =
					["Make NOS kits","Make 10 nos kits","50% off NOS kit created price + Instant creation speed","Simply create 10 nos kits through your scroll menu to complete this quest"];
					};
				case 14:
					{
					_return =
					["Make a Profit","Charge for services","+30% payout for quick impounding vehicles","Collect $10k by offering your services to someone. Collect the money through the charge system"];
					};
				case 15:
					{
					_return =
					["Big Impounder","Quick Impound 50 vehicles","Taru Buyable At Vehicle Shop","Impound 50 vehicles through the quick impound system to complete this quest (Quick impound means not at a jobs depot)"];
					};
				case 16:
					{
					_return =
					["Tow Truck Driver","Tow and Impound 50 vehicles","Spawn with a PDW weapon for defence","Tow and Impound 50 vehicles at any impound lot"];
					};
				case 17:
					{
					_return =
					["Use NOS","Use NOS 50 times","The NOS kits your create become 10 use kits","Simply Use NOS 50 times to complete this quest"];
					};
				case 18:
					{
					_return =
					["Air Vehicle Impound","Tow and Impound 10 Air Vehicles","Vehicles repair very quickly + Ability to do mechanic missions","Tow 10 Air Vehicles and impound them at any impound lot"];
					};
				case 19:
					{
					_return =
					["Mechanic Missions (Small)","Complete 10 small mechanic missions","Mechanic Missions Promotion and Ability to use building box from vehicles","Mechanic missions are started at jobs depots, the mission size depends on your quest level"];
					};
				case 20:
					{
					_return =
					["Mechanic Missions (Medium)","Complete 10 medium mechanic missions","Mechanic Missions Promotion","Mechanic missions are started at jobs depots, the mission size depends on your quest level"];
					};
				case 21:
					{
					_return =
					["Mechanic Missions (Large)","Complete 10 large mechanic missions","Mechanic Missions Promotion","Mechanic missions are started at jobs depots, the mission size depends on your quest level"];
					};
				case 22:
					{
					_return =
					["Mechanic Missions (Military)","Complete 10 military mechanic missions","Ability to repair buildings from your vehicle","Mechanic missions are started at jobs depots, the mission size depends on your quest level"];
					};
				case 23:
					{
					_return =
					["Building Repairing","Repair 10 damaged buildings","Double Payment for all mechanic missions","Repair buildings by scrolling on your vehicle while near a damaged building"];
					};
				case 24:
					{
					_return =
					["Coming Soon","Coming Soon","Coming Soon","Coming Soon"];
					};
				};
			};
		if(player getVariable ["security",false])then
			{
			switch(_curQuest)do
				{
				case 0:
					{
					_return =
					["Gas Money","Remove a total of $50k from gas stations","Nearby civilian markers distance increased to 100m","Remove funds from gas stations to limit robberies (Remember you only remove a percent of what you receive)"];
					};
				case 1:
					{
					_return =
					["Hospital Money","Remove a total of $100k from hospitals","Nearby police markers distance increased to 500m","Remove funds from hospitals to limit robberies (Remember you only remove a percent of what you receive)"];
					};
				case 2:
					{
					_return =
					["Speed Boost","Use your vehicle boost 20 times","10 seconds off vehicle boost reload timer","Use your vehicle boost 20 times"];
					};
				case 3:
					{
					_return =
					["Close 5 Gas Stations","Close a Gas Station after it has been robbed 5 times","20% extra payments for protecting closed stores","A store can be closed within a 15 minutes period of being robbed, it remains closed for 15 minutes or until you reopen it"];
					};
				case 4:
					{
					_return =
					["Remove Bank Money","Remove 10 bags of money from the bank","20% faster bank door opening speed","You can remove money from the bank to prevent robberies"];
					};
				case 5:
					{
					_return =
					["Issue a Ticket","Issue a criminal with a Ticket","Ability to press 6 and see money value in shops","You can issue criminals with tickets in order to assist the police with their duties"];
					};
				case 6:
					{
					_return =
					["Jail A Criminal","Send a Criminal to Jail","Spawn in with stun gun rather than tazer gun","You are allowed to send minor criminals to the holding cell to free up police man power for more important task"];
					};
				case 7:
					{
					_return =
					["Big Criminal","Send a Criminal to a police HQ","Nearby police markers increased to 1km","You can capture big time criminals and send them to a police HQ and receive their bounty"];
					};
				case 8:
					{
					_return =
					["Protector","Protect closed stores","Nearby civilian markers increased to 150m","Receive 10 payments for protecting a close store"];
					};
				case 9:
					{
					_return =
					["Gas Money pt2","Remove money from Gas Stations","Other Security Contractors show up on your map","Remove $100k from Gas Stations (Remember you only remove a percent of what you receive)"];
					};
				case 10:
					{
					_return =
					["Hospital Money pt2","Remove money from Hospitals","20% Bonus of money removed from hospitals","Remove $200k from Hospitals (Remember you only remove a percent of what you receive)"];
					};
				case 11:
					{
					_return =
					["Close 3 Hospitals","Close a Hospital after it has been robbed three times","Nearby civilian markers increased to 200m","A store can be closed within a 15 minutes period of being robbed, it remains closed for 15 minutes or until you reopen it"];
					};
				case 12:
					{
					_return =
					["Big Criminal pt2","Send three Criminals to the police HQ for processing","20% Extra bounty received for sending a criminal to a police HQ","The Criminals you send must have a bounty greater than $5k to complete this quest"];
					};
				case 13:
					{
					_return =
					["Close five Gas Station","Close five Gas Stations after they've been robbed","50% extra payments for protecting closed stores","A store can be closed within a 15 minutes period of being robbed, it remains closed for 15 minutes or until you reopen it"];
					};
				case 14:
					{
					_return =
					["Remove Bank Money pt2","Remove 20 bags of money from the bank","50% faster bank door opening speed","You can remove money from the bank to prevent robberies"];
					};
				case 15:
					{
					_return =
					["Jail A Criminal pt2","Send a Criminal to Jail","Spawn in with a lethal pistol instead of the P07","You are allowed to send minor criminals to the holding cell to free up police man power for more important task"];
					};
				case 16:
					{
					_return =
					["Protector pt2","Protect closed stores","Nearby civilian markers increased to 250m","Receive 20 payments for protecting a close store"];
					};
				case 17:
					{
					_return =
					["Big Criminal pt3","Send five Criminals to a police HQ","Nearby police markers increased to 2km","You can capture big time criminals and send them to a police HQ and receive their bounty"];
					};
				case 18:
					{
					_return =
					["Speed Boost pt2","Use your vehicle boost 50 times","5 seconds off vehicle boost reload timer","Use your vehicle boost 50 times"];
					};
				case 19:
					{
					_return =
					["Close five Hospitals","Close five Hospitals after they've been robbed","100% extra payments for protecting closed stores","A store can be closed within a 15 minutes period of being robbed, it remains closed for 15 minutes or until you reopen it"];
					};
				case 20:
					{
					_return =
					["Massive Criminal","Jail a big time criminal","Spawn in with a Medikit and 3 gas grenades every time","Send a criminal with a bounty of over $50k to the police station for processing"];
					};
				case 21:
					{
					_return =
					["Protector pt3","Protect closed stores","Tear Gas does not affect you while wearing a helmet","Receive 30 payments for protecting a close store"];
					};
				case 22:
					{
					_return =
					["Gas Money pt3","Remove a total of $200k from gas stations","Extra 50% payments from removing funds from gas stations","Remove funds from gas stations to limit robberies (Remember you only remove a percent of what you receive)"];
					};
				case 23:
					{
					_return =
					["Remove Bank Money pt3","Remove 30 bags of money from the bank","75% faster bank door opening speed","You can remove money from the bank to prevent robberies"];
					};
				case 24:
					{
					_return =
					["Jail A Criminal pt3","Send a Criminal to Jail","50% extra bounty payout when your jail a criminal","You are allowed to send minor criminals to the holding cell to free up police man power for more important task"];
					};
				case 25:
					{
					_return =
					["Close ten Gas Station","Close ten Gas Stations after they've been robbed","Nearby police markers increased to 3km","A store can be closed within a 15 minutes period of being robbed, it remains closed for 15 minutes or until you reopen it"];
					};
				case 26:
					{
					_return =
					["Big Criminals","Send three Criminals with bountys over $25k to the police HQ","Nearby civilian markers increased to 300m","You can capture big time criminals and send them to a police HQ and receive their bounty"];
					};
				case 27:
					{
					_return =
					["Speed Boost pt3","Use your vehicle boost 100 times","30% faster speed boost","Use your vehicle boost 100 times"];
					};
				case 28:
					{
					_return =
					["Close 15 Gas Station","Close 15 Gas Stations after they've been robbed","unlimited Airbags in any land vehicle you retrieve","A store can be closed within a 15 minutes period of being robbed, it remains closed for 15 minutes or until you reopen it"];
					};
				case 29:
					{
					_return =
					["Protector pt4","Protect closed stores","All un-garaged vehicles will be fitted with an advanced security kit","Receive 40 payments for protecting a close store"];
					};
				case 30:
					{
					_return =
					["Bank Money Removal","Remove 40 bags of cash from the bank","MXSW and MXM Added to weapons shop","Remove bank money (Level 2 Security Only)"];
					};
				case 31:
					{
					_return =
					["Close 5 Hospitals","Close 10 recently robbed hospitals","Spawn in wearing a security helmet","A store can be closed within a 15 minutes period of being robbed, it remains closed for 15 minutes or until you reopen it (Level 2 Security Only)"];
					};
				case 32:
					{
					_return =
					["Jail 5 Criminals","Send 5 minor criminals to jail","Spawn in wearing a security vest","Captured criminals with a bounty of $5k or less can be sent straight to jail by security contractors"];
					};
				case 33:
					{
					_return =
					["Hospital Money pt3","Remove a total of $300k from hospitals","Spawn in with security kit auto-bought","Keep hospital robberies down by removing the money regularly (Remember you only remove a percent of what you receive)"];
					};
				case 34:
					{
					_return =
					["Big Criminals pt2","Send five Criminals to a police HQ","Spawn in with body armour already applied","You can capture big time criminals and send them to a police HQ and receive their bounty"];
					};
				case 35:
					{
					_return =
					["Protector pt5","Protect closed stores","Cooldown time between sirens halved","Receive 50 payments for protecting a close store"];
					};
				case 36:
					{
					_return =
					["Speed Boost pt4","Use NOS 200 times","Vehicle repair time halved","Use your speed boost 200 times"];
					};
				case 37:
					{
					_return =
					["Massive Criminal pt2","Jail three big time criminals","Spawn in with a Y inventory AK12 and some smoke shells","Send three criminal with a bounty of over $50k to the police station for processing"];
					};
				case 38:
					{
					_return =
					["Coming Soon","Coming Soon","Coming Soon","Coming Soon"];
					};
				};
			};
		if(playerSide isEqualTo west)then
			{
			switch(_curQuest)do
				{
				case 0:
					{
					_return =
					["Play for 10 hours","Play cop for 10 hours","$50k","After you have played cop for 10 hours, you may apply on the forums to become a whitelisted police officer"];
					};
				case 1:
					{
					_return =
					["Issue 20 Tickets","Issue at least 20 tickets","$50k","Tickets are issued to civilians for minor offences"];
					};
				case 2:
					{
					_return =
					["Impound 25 Vehicles","Impound at least 25 vehicles","25% Extra Payment for impounding vehicles","Abandoned vehicles must be impounded to keep areas safe and tidy"];
					};
				case 3:
					{
					_return =
					["Receive 2 Checkpoint Payments","Man a police checkpoint","20% extra payments from manning checkpoints","Man a static police checkpoint and receive 2 payments"];
					};
				case 4:
					{
					_return =
					["Play for 20 hours","Play cop for 20 hours","Improved speed and distance of police speed radar","Simply play as a cop for more than 20 hours to complete this quest"];
					};
				case 5:
					{
					_return =
					["Search A Vehicle","Search a civilian vehicle and find illegal goods or a convoy/bulletproof/carbomb vehicle","25% Extra rank bonus","Search a civilian vehicle, make sure it is a legal search"];
					};
				case 6:
					{
					_return =
					["Arrest 20 Criminals","Send 20 people to jail","50% extra bounty reward for arresting criminals","Arrest 20 civilians and send them to jail"];
					};
				case 7:
					{
					_return =
					["Play for 30 hours","player as a cop for 30 hours","50% extra rank bonus","Simply play as a cop for 30 hours to complete this quest"];
					};
				case 8:
					{
					_return =
					["Bomb Defuse","Use a defuse kit on C4","50% faster defuse kit usage","Defuse a bomb anywhere that civilians have planted C4"];
					};
				case 9:
					{
					_return =
					["Impound 100 Vehicles","Impound 100 vehicles","5 seconds off speed boost recharge","Impound 100 abandoned vehicles"];
					};
				case 10:
					{
					_return =
					["Arrest 50 Criminals","Arrest 50 criminals","100% extra bounty reward for arresting criminals","Send 50 criminals to jail"];
					};
				case 11:
					{
					_return =
					["Play for 60 hours","Play for at least 60 hours","200m Range added to fuel dart launchers","Simply play as a cop for 60 hours to complete this quest"];
					};
				case 12:
					{
					_return =
					["Set Up The MCU","Set up the MCU","150m Range added to MCU markers","Simply set up the MCU to complete this quest"];
					};
				case 13:
					{
					_return =
					["Clean Up 10 Skeletons","Clean up 10 Skeletons","100% extra payment for cleaning up human remains and Impounding vehicles","Clean up 10 human remains to complete this quest"];
					};
				case 14:
					{
					_return =
					["Remove One Dead Body","Put a dead body into your vehicle","All retrieved vehicles automatically come with unlimited Airbags","Remove a body of a dead criminal to prevent him being revived"];
					};
				case 15:
					{
					_return =
					["Destroy A Vehicle","Destroy a vehicle using the destroy vehicle option","Armed Strider, Armed Pawnee and Speedboat HMG added to your vehicle shop (For senior Sergeants and up)","Make sure the destruction of the vehicle is within the vehicle destruction rules"];
					};
				case 16:
					{
					_return =
					["Play for 100 hours","Play for at least 100 hours","MCU pack/unpack time 50% faster","Simply play for 100 hours to complete this quest"];
					};
				case 17:
					{
					_return =
					["Complete 5 Patrol Missions","Complete 5 of the police patrol missions","All retrieved vehicles come with a fuel upgrade","Patrol Missions are started at most police vehicle shops, have permission of the highest ranking officer before beginning these missions"];
					};
				case 18:
					{
					_return =
					["Arrest 75 Criminals","Arrest 75 criminals","Switch between lethal and stun 50% faster and ability to purchase the Neophron and Blackfish VTOL Air Craft","Arrest a total of 75 criminals"];
					};
				case 19:
					{
					_return =
					["Detain The Spy","Detain the spy","All retrieved vehicles come with a security upgrade","Detain the spy and receive his documents for the police"];
					};
				case 20:
					{
					_return =
					["Complete a Police Convoy","Complete a police convoy","25% extra payment from completing convoys","Be apart of the police force that completes a convoy mission"];
					};
				case 21:
					{
					_return =
					["Evict Tenants","Evict tenants","25% quicker tenant evicting","Evict a tenant from a gang hideout"];
					};
				case 22:
					{
					_return =
					["Impound 200 Vehicles","Impound 200 vehicles","another 5 seconds off speed boost recharge + 10% faster run speed","Impound 200 abandoned vehicles"];
					};
				case 23:
					{
					_return =
					["Complete 15 Patrol Missions","Complete 15 patrol missions","Bullet Proof SUV in your garage","Patrol Missions are started at most police vehicle shops, have permission of the highest ranking officer before beginning these missions"];
					};
				case 24:
					{
					_return =
					["Play for 200 hours","Play as cop for 200 hours","+100 Space in police locker","Simply play cop for 200 hours to complete this quest"];
					};
				case 25:
					{
					_return =
					["Hard Working Police Force","Hard working police force","Armed Orca in your vehicle shop (If you're the correct rank) plus the Shikra jet","Receive 10 payments for being part of a hard working police force"];
					};
				case 26:
					{
					_return =
					["Issue 100 Tickets","Issue 100 tickets","Gas Grenades no longer affect you even without headgear on","Simply issue 100 tickets for minor crimes to complete this quest"];
					};
				case 27:
					{
					_return =
					["Arrest 150 Criminals","Arrest 150 criminals","No animation when buying body armour and switching weapon state","Arrest a total of 150 criminals"];
					};
				case 28:
					{
					_return =
					["Bomb Defuse Part 2","Use a defuse kit on C4","75% faster defuse kit usage","Defuse a bomb anywhere that civilians have planted C4"];
					};
				case 29:
					{
					_return =
					["Impound 300 Vehicles","Impound 300 vehicles","Vehicles impound 50% faster (Get picked up quicker)","Impound 300 abandoned vehicles"];
					};
				case 30:
					{
					_return =
					["Complete A Police Convoy Part 2","Complete a police convoy","50% extra payment from completing convoys","Be apart of the police force that completes a convoy mission"];
					};
				case 31:
					{
					_return =
					["Evict Tenants Part 2","Evict three Tenants","3 Extra body armours in you police kit","Evict a tenant from a gang hideout three times"];
					};
				case 32:
					{
					_return =
					["Close Down A Clan Base","Close down a clan base","50% Faster reviving","Clan bases can be closed down when they are raided so long as there has been combat there. An MCU must be nearby to do this"];
					};
				case 33 :
					{
					_return =
					["Complete 20 Patrol Missions Part 2","Complete 20 patrol missions","Bullet Proof SUV with super security in your garage","Patrol Missions are started at most police vehicle shops, have permission of the highest ranking officer before beginning these missions"];
					};
				case 34:
					{
					_return =
					["Play for 300 hours","Play as cop for 300 hours","Body Armour value increased by 50%","Simply play cop for 300 hours to complete this quest"];
					};
				case 35:
					{
					_return =
					["Hard Working Police Force Part 2","Hard working police force part 2","100% extra rank bonus + 20% faster run speed","Receive 20 payments for being part of a hard working police force"];
					};
				case 36:
					{
					_return =
					["Coming Soon","Coming Soon","Coming Soon","Coming Soon"];
					};
				};
			};
		};
	};

if(_curQuest < _myCurQuest)then
		{
		_warning = (_return select 0);
		_warning = format ["%1  (Completed)",_warning];
		_return set [0,_warning];
		}
		else
		{
			if(_curQuest > _myCurQuest)then
				{
				_warning = (_return select 0);
				_warning = format ["%1  (Unavailable)",_warning];
				_return set [0,_warning];
				}
				else
				{
				_warning = (_return select 0);
				_warning = format ["%1  (Current)",_warning];
				_return set [0,_warning];
				};
		};
_return