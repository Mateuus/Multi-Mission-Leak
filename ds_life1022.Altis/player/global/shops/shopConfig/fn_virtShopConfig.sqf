/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Fills the array and sets up variables for shop items
*/

params ["_shop"];

private _return = [];

switch(_shop)do {
	case 4: { //Market
		_return = ["pepsi","repairKit","refuelKit","mediKit","nitro","goKart","burger","pickAxe","apple","peach","chute","vodka","bourbon","salema","ornate","mackerel","tuna","mullet","catshark","turtle","wheatp","water"];
	};
	case 22: { //Cop items
		_return = ["coffee","donut","mediKit","repairKit","defuse","spikeStrip","UAV","fuelDart","refuelKit","chute","buildingBox"];
	};
	case 46: { //Virt items sell
		_return = ["saltu","sandu","diamondu","copperu","oilu","rocku","ironu","woodu","wheatu"];
	};
	case 47: { //Virt items sell processed
		_return = ["saltp","sandp","diamondp","copperp","oilp","rockp","ironp","relic","woodp","wheatp"];
	};
	case 53: { //illegal goods dealer
		_return = ["weedp","heroinp","cocainep","illegalRelicp","meth"];
	};
	case 54: { //Gang Virt Shops
		_return = ["pepsi","doritos","refuelKit","mediKit","repairKit","lockpick","lighter","siphonKit","goKart","vodka","bourbon","nitro","chute","fire","ziptie"];
	};
	case 67: { //Gas Station Shops
		_return = ["pepsi","burger","refuelKit","mediKit","repairKit","siphonKit","goKart","vodka","bourbon","nitro"];
	};
	case 72: { //Rebel Items Shops
		_return = ["pepsi","doritos","refuelKit","mediKit","repairKit","lockpick","siphonKit","lighter","goKart","c4","cracker","vodka","bourbon","nitro","chute","fire","ziptie","ied"];

		if((DS_infoArray select 17) > 26)then {
			_return pushBack "armour";
		};
	};
	case 81: { //Rebel Items sell
		_return = ["goldBar","goldBarMedium","goldBarLarge","spyDocs"];
	};
	case 104: { //Factory blueprints
		_return = ["bpVehSecurity","bpVehWeight","bpVehFuel","bpVehNos","bpGunLynx","bpCyrus","bpAmmoLynx","bpAmmoRpg","bpAmmoRpgHE","bpGunRpg","bpGun3gl","bpGunNavid","bpVehSUV","bpWeaponsLand","bpWeaponsAir","bpGunRpg7","bpAirbags","bpInsurance","bpArmourAdv","bpGunSpmg","bpAmmoRpg7"];
	};
	case 108: { //Factory sell ingredients
		_return = ["mattBronze","mattCrystalGlass","mattCircuitBoard","mattSmallBattery","mattCpu","mattSteel","mattTreatedLumber"];
	};
	case 109: { //Factory sell items
		_return = ["vehSecurity","vehWeight","vehFuel","vehSecurityAdv","vehWeightAdv","vehFuelAdv","gunLynx","gunLynxAdv","ammoLynx","ammoLynxAdv","gunRPG","gun3gl","gunNavid"];
	};
	case 119: { //Sec Virt Items
		_return = ["water","burger","refuelKit","repairKit","mediKit","goKart","chute","spikeStrip","buildingBox"];
	};
};

_return;