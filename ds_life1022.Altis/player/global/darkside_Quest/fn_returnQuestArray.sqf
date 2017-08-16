/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns the players current quest log information
*/

private ["_return"];

_return = [];

if(DS_questFocus == 0)then
	{
	_return =
			[["Apple Picker","Pick 250 Apples"],["Truck Driver","Truck Driver"],["Vehicle Repair","Vehicle Repair"],["Catch a Bus","Catch a Bus"],["Sky Diving","Sky Diving"],["Bank Insurance","Bank Insurance"],["Vehicle Storage","Vehicle Storage"]
			,["Taxi Driver","Taxi Driver"],["Factory Crafting","Factory Crafting"],["Dive Fishing","Dive Fishing"],["PickAxe","PickAxe"],["Use Nos","Use Nos"],["Fuel Delivery","Fuel Delivery"],["Vehicle Fuel Upgrade","Vehicle Fuel Upgrade"]
			,["Life Insurance","Life Insurance"],["Toll Booth","Toll Booth"],["Jerry can","Jerry can"],["Chopper Cargo Missions","Chopper Cargo Missions"],["Realistic Mode","Realistic Mode"],["Lotto Winner","Lotto Winner"],["Vehicle Insurance","Vehicle Insurance"]
			,["Fishing Net","Fishing Net"],["Mineral Processor","Mineral Processor"],["Truck driver promotion","Truck driver promotion"],["Blueprints","Blueprints"],["Auto-Miner","Auto-Miner"],["Taxi driver promotion","Taxi driver promotion"]
			,["Legal Relics","Legal Relics"],["Get Treated","Get Treated"],["Deliver Fuel Advanced","Deliver Fuel Advanced"],["Special vehicle upgrades","Special vehicle upgrades"],["Air Taxi","Air Taxi"],["Use Nos Advanced","Use Nos Advanced"]
			,["Crop Dusting","Crop Dusting"],["Chopper Cargo Advanced","Chopper Cargo Advanced"],["Life Insurance","Life Insurance"],["Big Auction Spender","Big Auction Spender"],["Airbags Vehicle Upgrade","Airbags Vehicle Upgrade"]
			,["Big Time Trucker","Big Time Trucker"],["Crafting Level","Crafting Level"],["Air Taxi Advanced","Air Taxi Advanced"],["Deliver Fuel Advanced pt2","Deliver Fuel Advanced pt2"],["Animal Repellent","Animal Repellent"]
			,["Fishing Advanced","Fishing Advanced"],["Pro Taxi Driver","Pro Taxi Driver"],["Drink Up","Drink Up"],["Crop Dusting Advanced","Crop Dusting Advanced"],["Pro Air Taxi Pilot","Pro Air Taxi Pilot"],["Pro Truck Driver","Pro Truck Driver"],["Pro Chopper Cargo Pilot","Pro Chopper Cargo Pilot"]
			,["Random Auction","Random Auction"],["Win $1m from Lotto","Win $1m from Lotto"],["Custom Realestate","Custom Realestate"]];
	};
if(DS_questFocus == 1)then
	{
	_return =
			[["Make a Gang","Form a Gang"],["Gas Station Robbery","Rob a Gas Station"],["Knock someone out","Knock out any player"],["Siphon Fuel","Siphon fuel from a vehicle"],["Drugs Convoy","Complete a drug convoy mission"],
			["Vehicle Lockpick","Lockpick somebodies vehicle"],["Rob Somebody","Steal somebodies money"],["Capture Gang Hideout","Capture a Hideout"],["Hospital Robbery","Steal Cash from a hospital"],
			["Weapons Convoy","Complete a weapons convoy"],["Chop Shop","Chop a vehicle"],["Pay Bail","Pay bail while in jail"],["Illegal Relics","Collect some illegal Relics"],["Strangle Someone","Strangle a downed player"],
			["Lockpick Advanced","Lockpick Advanced"],["Drug Harvester","Harvest Drugs"],["Rob a Cop","Rob a police officer"],["Hospital Robbery","Steal Chemicals from a hospital"],["Cop Killer","Murder a police officer"],
			["Capture a Gang Hideout Part 2","Capture a Gang Hideout Part 2"],["Gas Station Robbery Advanced","Steal $100k from gas stations"],["Drug Convoy Advanced","Complete three drug convoys"],["Meth Head","Process Meth"],
			["Siphon Kit Advanced","Siphon police fuel"],["Fake ID Convoy","Fake ID Convoy"],["Process Illegal Relics","Process 50 illegal relics"],["Weapons Convoy Advanced","Complete three weapons convoys"],
			["Drug Processor","Process 200 drugs"],["Hideout Owner","Own all three hideouts at once"],["Cop Killer Gang Hideout","Cop Killer Gang Hideout"],["Chop Shop Advanced","Chop three police vehicles"],
			["Capture Rebel KOS","Capture the rebel KOS point"],["Hospital Robbery Advanced","Steal money from hospitals"],["Chop Shop Expert","Chop Shop Expert"],["Gangster Killer","Gangster Killer"],
			["KOS Token payments","Complete 4 KOS Token Missions"],["Gang Hideouts Advanced","Gang Hideouts Advanced"],["Fake ID Convoy Advanced","Fake ID Convoy Advanced"],["Weapons Convoy Advanced","Weapons Convoy Advanced"],
			["Hostage Mission","Hostage Mission"],["Addict","Addict"],["Meth Head Part 2","Meth Head Part 2"],["Strangle Three People","Strangle Three People"],["Process Illegal Relics","Process Illegal Relics"],["Land Weapons Convoy Expert","Land Weapons Convoy Expert"],
			["Cop Killer Hospitals","Cop Killer Hospitals"],["Chop Shop Armoured","Chop Shop Armoured"],["KOS Token missions","KOS Token missions"],["Hostage Mission (Cop)","Hostage Mission (Cop)"]];
	};
if(DS_questFocus == 2)then
	{
	_return =
			[["Adv Rebel Training","Buy Adv Rebel Training"],["Revive","Revive a downed player"],["Lighter","Light a vehicles gas tank on fire"],["Use C4","Use a C4 explosive"],["Carbomb","Complete a Carbomb mission"]
			,["Checkpoint","Begin a checkpoint takeover"],["Ziptie","Ziptie Someone"],["IED","Use an IED"],["Armed Vehicle","Buy an Armed Vehicle"],["Power Station","Destroy the power station"],["Cop Killer","Kill a cop"]
			,["Vehicle Rearm","Rearm a vehicle"],["Buy a Safe Cracker","Buy a Safe Cracker"],["Spy Docs","Steal the spy docs"],["Cop Restrain","Restrain a Cop"],["Big Jail","Get sent to jail for 30 minutes"]
			,["Money Bags","Steal a bag of money"],["Cop Killer Bank","Kill a cop at the Bank"],["Capture Checkpoint","Capture police checkpoint"],["Steal Police Money","Steal police bank's money"]
			,["Blow the doors","Blow open the bank doors"],["Thermal Strider Convoy","Complete A Convoy"],["Research Facility","Research Facility"],["Sell Spy Docs","Sell Spy Documents"]
			,["Craft A Lynx","Craft a Lynx at a factory"],["Escape Jail","Escape from jail"],["Cop Killer Fort Knox","Kill a cop in Fort Knox"],["Take Battery","Take a Thermal Battery"]
			,["IED Advanced","Set off three IED's in Athira"],["Cop Killer Jail","Kill a cop at Jail"],["Thermal Hellcat Convoy","Complete the Hellcat Convoy"]
			,["Checkpoint Advanced","Capture and Hold a police checkpoint"],["Blow Jail Gates","Blow open the jail gates"],["Armed Strider Convoy","Complete the armed strider convoy"]
			,["Spy Docs?","What's in those spy docs"],["Escape Jail Adv","Use an escape jail card 3 times"],["DAR Pawnee","Unpack a DAR Pawnee"],["Money Bags Advanced","Money Bags Advanced"]
			,["Terrorist Mission","Complete a Terrorist Mission"],["Carbomber Expert","Carbomber Expert"],["Extreme Arsonist","Extreme Arsonist"],["Vehicle Rearm Advanced","Vehicle Rearm Advanced"]
			,["Steal spy docs advanced","Steal spy docs advanced"],["Steal Police Money (Advanced)","Steal Police Money (Advanced)"]];
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
			,["Big Criminal pt2","Send a Criminal away for processing"],["Close five Gas Stations","Close five Gas Stations"],["Remove Bank Money pt2","Remove 5 bags of Cash from the Bank"],["Jail Criminal pt2","Send a criminal to jail"]
			,["Protector pt2","Protect a closed store"],["Big Criminal pt3","Send a Criminal away for processing"],["Vehicle Boost","Use your vehicle boost 50 times"],["Close two Hospitals","Close two recently robbed Hospitals"]
			,["Massive Criminal","Catch a big time criminal"],["Protector pt3","Protect a closed store"],["Gas Money pt3","Remove $100k from gas stations"],["Remove Bank Money","Remove 10 bags of Cash from the Bank"]
			,["Jail Criminal pt3","Send a criminal to jail"],["Close five Gas Stations","Close five Gas Stations"],["Big Criminals","Send three Criminals away for processing"],["Vehicle Boost pt2","Use your vehicle boost 100 times"]
			,["Close ten Gas Stations","Close ten Gas Stations"],["Protector pt4","Protector pt4"],["Bank Money Removal","Bank Money Removal"],["Close five Hospitals","Close five Hospitals"],["Jail five criminals","Jail five criminals"]
			,["Hospital Money pt3","Hospital Money pt3"],["Big Criminals pt2","Big Criminals pt2"],["Protector pt5","Protector pt5"],["Vehicle Boost","Use your vehicle boost 200 times"],["Massive Criminal pt2","Massive Criminal pt2"]];
		};
	if(player getVariable ["mechanic",false])then
		{
		_return =
			[["Clean Up Kavala","Clean Up Kavala"],["Clean Up Anywhere","Clean Up Anywhere"],["Repair Kits","Make Repair Kits"],["Make Money","Make some profit"],["Clean Up Athira","Clean Up Athira"],["NOS Kits","Make NOS Kits"]
			,["Force Locks","Force a vehicles locks"],["Clean Up Pyrgos","Clean Up Pyrgos"],["Police Vehicles","Police Vehicles"],["Kavala Tow Truck","Kavala Tow Truck"],["Air Vehicles","Impound Air Vehicles"]
			,["Repair Kits Pt2","Make More Repair Kits"],["Athira Tow Truck","Athira Tow Truck"],["NOS Kits Part 2","Make More NOS Kits"],["Make More Money","Make more profit"],["Big Impounder","Impound 50 vehicles"]
			,["Tow Truck Driver","Tow Truck Driver"],["Use NOS","Use NOS"],["Air Vehicles pt2","Impound Air Vehicles"],["Mechanic Missions (Small)","Mechanic Missions (Small)"],["Mechanic Missions (Medium)","Mechanic Missions (Medium)"]
			,["Mechanic Missions (Large)","Mechanic Missions (Large)"],["Mechanic Missions (Military)","Mechanic Missions (Military)"],["Building Repairer","Building Repairer"]];
		};
	if(player getVariable ["medic",false])then
		{
		_return =
			[["Clean Up Kavala","Clean Up Kavala"],["Clean Up The Bank","Clean Up The Bank"],["Make Medikits","Make Medikits"],["Revive Someone","Revive Someone"],["Force Locks","Force Locks"],["Deliver Human Remains","Deliver Human Remains"]
			,["Charge Someone","Charge Someone"],["Clean Up Athira","Clean Up Athira"],["Speed Boost","Speed Boost"],["Treat Sickness","Treat Sickness"],["Medic Missions","Medic Missions"],["Clean Up Pyrgos","Clean Up Pyrgos"]
			,["Revive Someone pt2","Revive Someone pt2"],["Human Remains","Human Remains"],["M900","M900"],["Clean up Gang Hideouts","Clean up Gang Hideouts"],["Make Medikits pt2","Make Medikits pt2"],["Charge Someone pt2","Charge Someone pt2"]
			,["Clean up Sofia","Clean up Sofia"],["Revive People","Revive People"],["Medic Missions","Medic Missions"],["Clean Up Gang Hideouts","Clean Up Gang Hideouts"],["Speed Boost pt2","Speed Boost pt2"]
			,["Deliver Human Remains pt3","Deliver Human Remains pt3"],["Revive Many People","Revive Many People"],["Clean up Gang Hideouts","Clean up Gang Hideouts"],["Air Crash Medic Missions","Air Crash Medic Missions"]
			,["Dedication","Dedication"],["Clean up KOS","Clean up KOS"],["Poison gas","Poison gas"]];
		};
	if(playerSide isEqualTo west)then
		{
		_return =
			[["Play 10 hours","Play Cop for 10 hours"],["Issue 20 Tickets","Issue at least 20 tickets"],["Impound 25 Vehicles","Impound 25 vehicles"],["Police Checkpoints","Receive 2 checkpoint payments"],["Play 20 hours","Play Cop for 20 hours"]
			,["Search A Vehicle","Search a civilian vehicle"],["Arrest 20 Civilians","Send 20 civilians to jail"],["Play 30 hours","Play Cop for 30 hours"],["Bomb Defuse","Defuse Civilian C4"],["Impound 100 Vehicles","Impound 100 vehicles"]
			,["Arrest 50 Criminals","Arrest 50 Criminals"],["Play 60 hours","Play Cop for 60 hours"],["Setup the MCU","Setup the MCU"],["Human Remains","Clean up 10 human remains"],["Dead Body","Move a dead body into your vehicle"]
			,["Destroy A Vehicle","Destroy a vehicle using the destroy vehicle option"],["Play cop for 100 hours","Play cop for 100 hours"],["Complete 5 Patrol Missions","Complete 5 patrol missions"],["Arrest 75 Criminals","Arrest 75 criminals"]
			,["Detain The Spy","Detain the spy"],["Complete A Police Convoy","Complete a police convoy"],["Evict Tenants","Evict tenants"],["Impound 200 Vehicles","Impound 200 vehicles"],["Complete 15 Patrol Missions","Complete 15 patrol missions"]
			,["Play 200 hours","Play 200 hours"],["Hard Working Police Force","Hard working police force"],["Issue 100 Tickets","Issue 100 tickets"],["Arrest 150 Criminals","Arrest 150 criminals"],["Bomb Defuse Part 2","Defuse Civilian C4"],
			["Impound 300 Vehicles","Impound 300 vehicles"],["Complete A Police Convoy Part 2","Complete a police convoy"],["Evict Tenants Part 2","Evict Tenants Part 2"],["Close Down A Clan Base","Close down a clan base"],["Complete 15 Patrol Missions","Complete 15 patrol missions"],
			["Play 300 hours","Play 300 hours"],["Hard Working Police Force Part 2","Hard working police force part 2"],["Coming Soon","Coming Soon"]];
		};
	};
_return