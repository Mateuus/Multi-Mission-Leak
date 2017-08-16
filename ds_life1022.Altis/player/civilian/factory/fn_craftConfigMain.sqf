/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	returns config information for crafting
*/

private ["_shop","_returnList","_return"];

_shop = _this select 0;

switch(_shop)do
	{
	case 106:
		{
			_return = [[
			"Land Vehicle Security Upgrade",
			"Apply this to a vehicle to enhance the vehicles security, allowing you to unlock it via remote at a distance, adds GPS marker of the vehicle and making the vehicle difficult to lockpick",
			"Super Security Upgrade",
			"Enhances a vehicles security system to a point where lock picking is impossible",
			3,
			[["mattCpu",1],["mattSmallBattery",1],["mattCrystalGlass",1],["mattCircuitBoard",1]],
			"bpVehSecurity",
			"vehSecurity"
			],
			[
			"Land Vehicle Capacity Upgrade",
			"Apply this to a vehicle to increase that vehicles carry weight, allowing you to store more inside of the vehicles boot",
			"Super Capacity Upgrade",
			"Rather than a 50% increase this doubles the vehicles carry weight",
			3,
			[["mattSteel",5],["mattTreatedLumber",3]],
			"bpVehWeight",
			"vehWeight"
			],
			[
			"Land Vehicle Fuel Upgrade",
			"Apply this to a vehicle to decrease its fuel consumption",
			"Super Vehicle Fuel Upgrade",
			"The vehicle will use half the fuel amount and fuel darts will have a much higher miss rate",
			3,
			[["mattSteel",12],["oilp",20]],
			"bpVehFuel",
			"vehFuel"
			],
			[
			"Land Vehicle Nos Upgrade",
			"Apply this to a vehicle to give it a temporary nitro boost",
			"10 Use Nos Kit",
			"A Nos kit that can be used 10 times",
			3,
			[["hydro",4],["oilp",5],["mattSteel",3]],
			"bpVehNos",
			"vehNos"
			],
			[
			"Bulletproof SUV (SINGLE USE ITEM)",
			"An SUV with a bulletproof cabin (SINGLE USE ITEM)",
			"",
			"",
			3,
			[["mattSteel",200],["mattCrystalGlass",20],["mattBronze",100],["mattSmallBattery",20],["mattCircuitBoard",50],["mattCpu",40],["oilp",20]],
			"bpVehSUV",
			"bpVehSUV"
			],
			[
			"Air Vehicle Ammo Upgrade (SINGLE USE ITEM)",
			"Apply this to an air vehicle to enhance its weapons (SINGLE USE ITEM)",
			"",
			"",
			3,
			[["vehAmmo",2],["mattCrystalGlass",1],["mattSteel",100],["mattCircuitBoard",10],["mattCpu",10]],
			"bpWeaponsAir",
			"bpWeaponsAir"
			],
			[
			"Land Vehicle Ammo Upgrade (SINGLE USE ITEM)",
			"Apply this to a land vehicle to enhance its weapons (SINGLE USE ITEM)",
			"",
			"",
			3,
			[["cracker",10],["mattCrystalGlass",1],["mattSteel",50],["mattCircuitBoard",1],["mattCpu",1]],
			"bpWeaponsLand",
			"bpWeaponsLand"
			],
			[
			"Blackfoot Chopper",
			"Armed Blackfoot chopper (Can not insure)",
			"",
			"",
			3,
			[["mattSteel",300],["mattCrystalGlass",50],["battery",5],["pawnee",2],["mattCircuitBoard",20],["mattCpu",20]],
			"bpBlackfoot",
			"bpBlackfoot"
			],
			[
			"Airbags",
			"Installs 100 Airbags onto a vehicle",
			"",
			"",
			3,
			[["chute",30],["mattSteel",10]],
			"bpAirbags",
			"airbags"
			],
			[
			"Insurance",
			"Adds 1 insurance life onto a vehicle (Total of 2 lives possible)",
			"",
			"",
			3,
			[["repairKit",290],["spyDocs",1]],
			"bpInsurance",
			"insurance"
			]];
		};
	case 111:
		{
			_return = [[
			"Lynx",
			"Long Ranged Sniper Rifle",
			"LRPS Lynx",
			"Long Ranged Sniper Rifle with default LRPS Attachment",
			3,
			[["mattSteel",20],["mattBronze",5],["mattCrystalGlass",2]],
			"bpGunLynx",
			"gunLynx"
			],
			[
			"APDS Lynx Rounds",
			"Armour Penetrating Lynx Ammo",
			"5 APDS Lynx Rounds",
			"5 Armour Penetrating Lynx Ammo",
			5,
			[["mattSteel",1],["mattBronze",1]],
			"bpAmmoLynx",
			"ammoLynx"
			],
			[
			"RPG AT Rocket",
			"AT Rocket fired from an RPG",
			"3x RPG AT Rockets",
			"Pack of 3 Armour Penetrating RPG Rockets",
			2,
			[["mattSteel",2],["mattBronze",1]],
			"bpAmmoRpg",
			"ammoRpg"
			],
			[
			"RPG HE Rocket",
			"HE Rocket fired from an RPG",
			"3x RPG HE Rockets",
			"Pack of 3 HE RPG Rockets",
			2,
			[["mattSteel",2],["mattBronze",1]],
			"bpAmmoRpgHE",
			"ammoRpgHE"
			],
			[
			"RPG Launcher",
			"Launcher used to fire RPG's",
			"",
			"",
			0,
			[["mattSteel",10],["mattBronze",5],["mattCircuitBoard",2],["mattCrystalGlass",4]],
			"bpGunRpg",
			"gunRpg"
			],
			[
			"AK12 Grenade Launcher",
			"AK12 Automatic Rifle, Also able to fire grenades",
			"",
			"",
			0,
			[["mattSteel",10],["mattBronze",6],["oilp",10],["mattCrystalGlass",4]],
			"bpGun3gl",
			"gun3gl"
			],
			[
			"Navid 9.3mm",
			"Navid Medium Machine Gun",
			"",
			"",
			0,
			[["mattSteel",2],["mattBronze",10],["oilp",6]],
			"bpGunNavid",
			"gunNavid"
			],
			[
			"Cyrus 9.3mm",
			"A 10 shot sharpshooters rifle",
			"",
			"",
			0,
			[["mattSteel",6],["mattBronze",6],["oilp",4]],
			"bpCyrus",
			"bpCyrus"
			],
			[
			"No Recoil Item",
			"A no recoil buff that can be applied to a player",
			"",
			"",
			0,
			[["meth",10]],
			"mattnorecoil",
			"noRecoil"
			],
			[
			"RPG-7 Launcher",
			"Launcher used to fire an RPG",
			"",
			"",
			0,
			[["mattSteel",8],["mattBronze",4],["mattCircuitBoard",2],["mattCrystalGlass",2]],
			"bpGunRpg7",
			"gunRpg7"
			],
			[
			"Advanced Body Armour",
			"Body Armour with 50% extra protection from stun rounds",
			"",
			"",
			0,
			[["armour",1],["diamondp",2]],
			"bpArmourAdv",
			"armourAdv"
			],
			[
			"SPMG",
			"An SPMG LMG",
			"",
			"",
			0,
			[["mattSteel",10],["mattBronze",7],["oilp",2]],
			"bpGunSpmg",
			"gunSpmg"
			],
			[
			"RPG7 Rocket",
			"Rocket fired from an RPG7",
			"3x RPG7 Rockets",
			"Pack of 3 RPG7 Rockets",
			2,
			[["mattSteel",2],["mattBronze",1]],
			"bpAmmoRpg7",
			"ammoRpg7"
			]];
		};
	case 107:
		{
			_return = [[
			"CPU",
			"A computer chip required to make technical equipment",
			"",
			"",
			0,
			[["mattCircuitBoard",2],["mattCrystalGlass",1],["copperp",10]],
			"mattCpu",
			"mattCpu"
			],
			[
			"Small Battery",
			"A battery used inside electronic items",
			"",
			"",
			0,
			[["hydro",10],["mattBronze",1],["ironp",2]],
			"mattSmallBattery",
			"mattSmallBattery"
			],
			[
			"Circuit Board",
			"A vital part required for items involving electricity",
			"",
			"",
			0,
			[["copperp",10],["oilp",3],["hydro",4]],
			"mattCircuitBoard",
			"mattCircuitBoard"
			],
			[
			"Crystal Glass",
			"A high grade glass used in construction",
			"",
			"",
			0,
			[["sandp",3],["copperp",2]],
			"mattCrystalGlass",
			"mattCrystalGlass"
			],
			[
			"Bronze",
			"A copper alloy",
			"",
			"",
			0,
			[["ironp",2],["copper",3]],
			"mattBronze",
			"mattBronze"
			],
			[
			"Steel",
			"Hardened Steel",
			"",
			"",
			0,
			[["ironp",3],["oilp",1]],
			"mattSteel",
			"mattSteel"
			],
			[
			"Hardened Lumber",
			"Hardened Lumber",
			"",
			"",
			0,
			[["woodp",3],["oilp",1]],
			"mattTreatedLumber",
			"mattTreatedLumber"
			]];
		};
	};
_return;