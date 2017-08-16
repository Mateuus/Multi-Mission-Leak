/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Returns the players current quest log information
*/

private ["_return"];

_return = [];

if(DS_questFocus == 0)then
	{
	_return =
			[["Apple Picker","Pick 50 Apples"],["Peach Picker","Pick 50 Peach"],["Fishing Net","Catch 50 fish"],["Dive Fishing","Catch 20 Fish"],["PickAxe","Use a PickAxe 50 times"],["Public Transport","Use a Bus"],
			["Banking Insurance","Buy Bank Insurance"],["Factory","Craft any material"],["Get Treated","Treat yourself at a hospital"],["Fuel Delivery","Deliver fuel"],["Repair Kit","Repair a vehicle"],["Use Nos","Install and use nitro"],
			["Storage Upgrade","Install a vehicle storage upgrade"],["Legal Relics","Search for and collect legal relics"],["Legal Processor","Process Legal Goods"],
			["Truck Driver","Get promoted as a truck driver"],["Blueprints","Checkout a blueprint"],["Vehicle Refuel","Use a Jerry can to refuel your vehicle"],["SkyDiving","Go Skydiving"],
			["Crop Dusting","Complete a crop dusting mission"],["Fuel Upgrade","Install a fuel upgrade on your vehicle"],["Campfire Heal","Heal yourself on a camp fire"],["Auto Miner","Use the Auto Miner"],["Free Fuel","Learn how to get free fuel"],["Fuel Delivery Advanced","Complete two fuel missions"],
			["Vehicle Security","Install a security upgrade"],["Relics Advanced","Collect 200 relics"],["Item Crafting","Craft any item"],["Truck Driver Advanced","Complete two truck missions"],["Crop Duster Advanced","Complete three missions"]
			,["Fuel Delivery Advanced","Complete five missions"],["Big Time Trucker","Complete the final truck mission"],["Adv Vehicle Upgrade","Advanced vehicle upgrade"],["The Auctions","Win an Auction"],["Big Crop Duster","Dust some crops"],["Lotto Winner","Lotto Winner"]
			,["Chopper Missions","Chopper Missions"],["Chopper Missions Advanced","5 High Risk Chopper Missions"],["Crop Dusting Advanced pt2","Crop Dusting Advanced pt2"],["Fishing Advanced","Fishing Advanced"],["Animal Repellent","Animal Repellent"],["Nos pt2","Nos pt2"]
			,["Life Insurance","Life Insurance"],["Drink Up","Drink Up"],["Crafting Level","Crafting Level"],["Random Auction","Random Auction"],["Fuel Delivery Advanced pt2","Fuel Delivery Advanced pt2"]];
	};
if(DS_questFocus == 1)then
	{
	_return =
			[["Make a Gang","Form a Gang"],["Gas Station Robbery","Rob a Gas Station"],["Knock someone out","Knock out any player"],["Siphon Fuel","Siphon fuel from a vehicle"],["Drugs Convoy","Complete a drug convoy mission"],
			["Vehicle Lockpick","Lockpick somebodies vehicle"],["Rob Somebody","Steal somebodies money"],["Capture Gang Hideout","Capture a Hideout"],["Hospital Robbery","Steal Cash from a hospital"],
			["Weapons Convoy","Complete a weapons convoy"],["Chop Shop","Chop a vehicle"],["Pay Bail","Pay bail while in jail"],["Illegal Relics","Collect some illegal Relics"],["Strangle Someone","Strangle a downed player"],["Drug Harvester","Harvest Drugs"],
			["Rob a Cop","Cop a police officer"],["Hospital Robbery","Steal Chemicals from a hospital"],["Cop Killer","Murder a police officer"],["Gas Station Robbery Advanced","Steal $100k from gas stations"],
			["Drug Convoy Advanced","Complete three drug convoys"],["Meth Head","Process Meth"],["Siphon Kit Advanced","Siphon police fuel"],["Process Illegal Relics","Process 50 illegal relics"],
			["Weapons Convoy Advanced","Complete three weapons convoys"],["Drug Processor","Process 200 drugs"],["Hideout Owner","Own all three hideouts at once"],["Chop Shop Advanced","Chop three police vehicles"],
			["Capture Rebel KOS","Capture the rebel KOS point"],["Hospital Robbery Advanced","Steal money from hospitals"],["KOS payments","Receive four KOS payments"],["Gang Hideouts Advanced","Gang Hideouts Advanced"]
			,["Fake ID Convoy","Fake ID Convoy"],["Hostage Mission","Hostage Mission"],["Gas Mask","Gas Mask"],["Chop Shop Expert","Chop Shop Expert"],["Addict","Addict"],["Meth Head pt2","Meth Head pt2"]];
	};
if(DS_questFocus == 2)then
	{
	_return =
			[["Adv Rebel Training","Buy Adv Rebel Training"],["Revive","Revive a downed player"],["Lighter","Light a vehicles gas tank on fire"],["Use C4","Use a C4 explosive"],["Carbomb","Complete a Carbomb mission"]
			,["Checkpoint","Begin a checkpoint takeover"],["Ziptie","Ziptie Someone"],["IED","Use an IED"],["Armed Vehicle","Buy an Armed Vehicle"],["Power Station","Destroy the power station"],["Cop Killer","Kill a cop"]
			,["Vehicle Rearm","Rearm a vehicle"],["Safe Cracker","Use a Safe Cracker"],["Spy Docs","Steal the spy docs"],["Cop Restrain","Restrain a Cop"],["Big Jail","Get sent to jail for 30 minutes"]
			,["Money Bags","Steal a bag of money"],["Cop Killer Sofia","Kill a cop in Sofia"],["Capture Checkpoint","Capture police checkpoint"],["Steal Police Money","Steal policebanks money"]
			,["Blow the doors","Blow open the bank doors"],["Thermal Strider Convoy","Complete A Convoy"],["Car Bomber Advanced","Complete three carbomb missions"],["Sell Spy Docs","Sell Spy Documents"]
			,["Craft A Lynx","Craft a Lynx at a factory"],["Escape Jail","Escape from jail"],["Cop Killer Airfield","Kill a cop at the main airfield"],["Take Battery","Take a Thermal Battery"]
			,["IED Advanced","Set off three IED's at the main Airfield"],["Cop Killer Kore Gas","Kill a cop at Kore Gas"],["Thermal Hellcat Convoy","Complete the Hellcat Convoy"]
			,["Checkpoint Advanced","Capture and Hold a police checkpoint"],["Blow Jail Gates","Blow open the jail gates"],["Armed Thermal Strider Convoy","Complete the armed thermal strider convoy"]
			,["Spy Docs?","What's in those spy docs"],["Escape Jail Adv","Use an escape jail card 3 times"],["Dar Pawnee","Unpack a Dar Pawnee"],["Thermal Armed Vehicle","Buy a Thermal Enabled Armed vehicle"]
			,["Terrorist Mission","Complete a Terrorist Mission"]];
	};
if(DS_questFocus == 3)then
	{
	_return =
			[["Not available","These special quest are for whitelisted civilian jobs only"]];
	if(player getVariable ["security",false])then
		{
		_return =
			[["Gas Money","Remove $10k from gas stations"],["Hospital Money","Remove $10k from Hospitals"],["Vehicle Boost","Use your vehicle boost 20 times"],["Close Gas Station","Close a Gas Station"]
			,["Remove Bank Money","Remove a bag of Cash from the Bank"],["Issue Ticket","Issue a ticket and receive the money"],["Jail Criminal","Send a criminal to jail"],["Big Criminal","Send a criminal to the Police HQ"]
			,["Protector","Protect a closed store"],["Gas Money pt2","remove $30k from Gas Stations"],["Hospital Money pt2","remove $30k from Hospitals"],["Close a Hospital","Close a recently robbed Hospital"]
			,["Big Criminal pt2","Send a Criminal away for processing"],["Close two Gas Stations","Close two Gas Stations"],["Remove Bank Money pt2","Remove 5 bags of Cash from the Bank"],["Jail Criminal pt2","Send a criminal to jail"]
			,["Protector pt2","Protect a closed store"],["Big Criminal pt3","Send a Criminal away for processing"],["Vehicle Boost","Use your vehicle boost 50 times"],["Close two Hospitals","Close two recently robbed Hospitals"]
			,["Massive Criminal","Catch a big time criminal"],["Protector pt3","Protect a closed store"],["Gas Money pt3","Remove $100k from gas stations"],["Remove Bank Money","Remove 10 bags of Cash from the Bank"]
			,["Jail Criminal pt3","Send a criminal to jail"],["Close five Gas Stations","Close five Gas Stations"],["Big Criminals","Send three Criminals away for processing"],["Vehicle Boost pt2","Use your vehicle boost 100 times"]
			,["Close ten Gas Stations","Close ten Gas Stations"],["Protector pt3","Protector pt3"],["Bank Money Removal","Bank Money Removal"],["Close five Hospitals","Close five Hospitals"],["Jail five criminals","Jail five criminals"]
			,["Hospital Money pt3","Hospital Money pt3"],["Big Criminals pt2","Big Criminals pt2"],["Protector pt4","Protector pt4"],["Vehicle Boost","Use your vehicle boost 200 times"],["Massive Criminal pt2","Massive Criminal pt2"]];
		};
	if(player getVariable ["mechanic",false])then
		{
		_return =
			[["Clean Up Kavala","Clean Up Kavala"],["Clean Up Pyrgos","Clean Up Pyrgos"],["Repair Kits","Make Repair Kits"],["Make Money","Make some profit"],["Clean Up Sofia","Clean Up Sofia"],["Nos Kits","Make Nos Kits"]
			,["Force Locks","Force a vehicles locks"],["Clean Up Athira","Clean Up Athira"],["Police Vehicles","Police Vehicles"],["Kavala Tow Truck","Kavala Tow Truck"],["Air Vehicles","Impound Air Vehicles"]
			,["Repair Kits Pt2","Make More Repair Kits"],["Athira Tow Truck","Athira Tow Truck"],["Nos Kits Pt2","Make More Nos Kits"],["Make More Money","Make more profit"],["Big Impounder","Impound 50 vehicles"]
			,["Tow Truck Driver","Tow Truck Driver"],["Use Nos","Use Nos"],["Air Vehicles pt2","Impound Air Vehicles"],["Mechanic Missions (Small)","Mechanic Missions (Small)"],["Mechanic Missions (Medium)","Mechanic Missions (Medium)"]
			,["Mechanic Missions (Large)","Mechanic Missions (Large)"],["Mechanic Missions (Military)","Mechanic Missions (Military)"],["Building Repairer","Building Repairer"]];
		};
	if(player getVariable ["medic",false])then
		{
		_return =
			[["Clean Up Kavala","Clean Up Kavala"],["Clean Up Pyrgos","Clean Up Pyrgos"],["Make Medikits","Make Medikits"],["Revive Someone","Revive Someone"],["Force Locks","Force Locks"],["Deliver Human Remains","Deliver Human Remains"]
			,["Charge Someone","Charge Someone"],["Clean Up Athira","Clean Up Athira"],["Speed Boost","Speed Boost"],["Treat Sickness","Treat Sickness"],["Medic Missions","Medic Missions"],["Clean Up Pyrgos","Clean Up Pyrgos"]
			,["Cop Revive","Cop Revive"],["Human Remains","Human Remains"],["M900","M900"],["Clean up Cocaine","Clean up Cocaine"],["Make Medikits pt2","Make Medikits pt2"],["Charge Someone pt2","Charge Someone pt2"]
			,["Clean up the Airfield","Clean up the Airfield"],["Revive People","Revive People"],["Medic Missions","Medic Missions"],["Clean Up Weed","Clean Up Weed"],["Speed Boost pt2","Speed Boost pt2"]
			,["Deliver Human Remains pt3","Deliver Human Remains pt3"],["Revive Many People","Revive Many People"],["Clean up Heroin","Clean up Heroin"],["Air Crash Medic Missions","Air Crash Medic Missions"]
			,["Dedication","Dedication"],["Clean up KOS","Clean up KOS"],["Poison gas","Poison gas"]];
		};
	if(playerside == west)then
		{
		_return =
			[["Play 10 hours","Play Cop for 10 hours"],["Issue 10 tickets","Issue atleast 10 tickets"],["Impound 10 vehicles","Impound 10 vehicles"],["Police Checkpoints","Receive 2 checkpoint payments"],["Play 20 hours","Play Cop for 20 hours"]
			,["Search a vehicle","Search a civilian vehicle"],["Arrest 10 civilians","Send 10 civilians to jail"],["Play 30 hours","Play Cop for 30 hours"],["Bomb Defuse","Defuse Civilian C4"],["Impound 100 vehicles","Impound 100 vehicles"]
			,["Arrest 50 criminals","Arrest 50 criminals"],["Play 60 hours","Play Cop for 60 hours"],["Setup the MCU","Setup the MCU"],["Human Remains","Clean up 10 human remains"],["Dead Body","Move a dead body into your vehicle"]
			,["Destroy a vehicle","Destroy a vehicle using the destroy vehicle option"],["Play cop for 100 hours","Play cop for 100 hours"],["Complete 10 patrol missions","Complete 10 patrol missions"],["Arrest 75 Criminals","Arrest 75 Criminals"]
			,["Detain the spy","Detain the spy"],["Complete a police convoy","Complete a police convoy"],["Evict Tenants","Evict Tenants"],["Impound 200 vehicles","Impound 200 vehicles"],["Complete 50 patrol missions","Complete 50 patrol missions"]
			,["Play 200 hours","Play 200 hours"],["Hard working police force","Hard working police force"],["Issue 100 Tickets","Issue 100 Tickets"],["Arrest 150 Criminals","Arrest 150 Criminals"],["Coming Soon","Coming Soon"]];
		};
	};
_return