/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Fills the array and sets up variables for inventory items
*/

//Array of all items
DS_itemArray = [
	"water","donut","repairKit","refuelKit","lockpick","lighter","siphonKit","nitro","goKart","coffee",
	"pepsi","apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle",
	"tbacon","peach","pie","burger","chips","doritos","mediKit","heroinp","weedp","cocainep",
	"heroinu","weedu","cocaineu","illegalRelicu","illegalRelicp","hydro","sodium","hydroPack","sodiumPack","meth",
	"goldBar","spyDocs","pickAxe","oilu","diamondu","copperu","rocku","saltu","ironu","sandu",
	"oilp","diamondp","copperp","rockp","saltp","ironp","sandp","relic","c4","defuse",
	"battery","cracker","spikeStrip","UAV","fuelDart","vodka","bourbon","bpVehSecurity","bpVehWeight","bpVehFuel",
	"mattBronze","mattCrystalGlass","mattCircuitBoard","mattSmallBattery","mattCpu","woodp","woodu","vehSecurity","vehWeight","vehFuel",
	"vehSecurityAdv","vehWeightAdv","vehFuelAdv","mattSteel","mattTreatedLumber","chute","fire","ziptie","bpGunLynx","gunLynx",
	"gunLynxAdv","bpAmmoLynx","ammoLynx","ammoLynxAdv","bpAmmoRpg","ammoRpg","ammoRpgAdv","ied","buildingBox","bpVehNos",
	"vehNos","vehNosAdv","houseItemUpgrade","houseWeaponUpgrade","jail10","safeCrackerAdv","jailBreak","steroids","noRecoil","quickCap",
	"pawnee","convoy","wheatu","wheatp","vehAmmo","ammoFlash","ammoTear","bpVehSUV","bpGunRpg","gunRpg",
	"bpGun3gl","gun3gl","bpGunNavid","gunNavid","gunCyrus","weaponsAir","weaponsLand","blackfoot","bpCyrus","bpWeaponsAir",
	"bpWeaponsLand","bpBlackfoot","armour","packSteel","packBronze","packGlass","packCircuitBoard","packBattery","packCPU","idChanger",
	"bones","goldBarMedium","goldBarLarge","bpAmmoRpgHE","ammoRpgHE","ammoRpgHEAdv","bpGunRpg7","bpAirbags","bpInsurance",
	"bpArmourAdv","bpGunSpmg","gunRpg7","airBags","insurance","armourAdv","gunSpmg","bpAmmoRpg7","ammoRpg7","ammoRpg7Adv",
	"plane"
];

//Array of all items that can be saved
DS_itemArraySavable = [
	"water","donut","repairKit","refuelKit","lockpick","lighter","siphonKit","nitro","goKart","coffee",
	"pepsi","apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle",
	"tbacon","peach","pie","burger","chips","doritos","mediKit","heroinp","weedp","cocainep",
	"heroinu","weedu","cocaineu","illegalRelicu","illegalRelicp","hydro","sodium","meth",
	"spyDocs","pickAxe","oilu","diamondu","copperu","rocku","saltu","ironu","sandu",
	"oilp","diamondp","copperp","rockp","saltp","ironp","sandp","relic","c4","defuse",
	"battery","spikeStrip","UAV","fuelDart","vodka","bourbon","bpVehSecurity","bpVehWeight","bpVehFuel",
	"mattBronze","mattCrystalGlass","mattCircuitBoard","mattSmallBattery","mattCpu","woodp","woodu","vehSecurity","vehWeight","vehFuel",
	"vehSecurityAdv","vehWeightAdv","vehFuelAdv","mattSteel","mattTreatedLumber","chute","fire","ziptie","bpGunLynx","gunLynx",
	"gunLynxAdv","bpAmmoLynx","ammoLynx","ammoLynxAdv","bpAmmoRpg","ammoRpg","ammoRpgAdv","buildingBox","bpVehNos",
	"vehNos","vehNosAdv","houseItemUpgrade","houseWeaponUpgrade","jail10","safeCrackerAdv","jailBreak","steroids","noRecoil","quickCap",
	"pawnee","convoy","wheatu","wheatp","vehAmmo","ammoFlash","ammoTear","bpVehSUV","bpGunRpg","gunRpg",
	"bpGun3gl","gun3gl","bpGunNavid","gunNavid","gunCyrus","weaponsAir","weaponsLand","blackfoot","bpCyrus","bpWeaponsAir",
	"bpWeaponsLand","bpBlackfoot","armour","packSteel","packBronze","packGlass","packCircuitBoard","packBattery","packCPU","idChanger",
	"bones","bpAmmoRpgHE","ammoRpgHE","ammoRpgHEAdv","bpGunRpg7","bpAirbags","bpInsurance",
	"bpArmourAdv","bpGunSpmg","gunRpg7","airBags","insurance","armourAdv","gunSpmg","bpAmmoRpg7","ammoRpg7","ammoRpg7Adv",
	"plane"
];

//Sets all items to zero by default
{
	missionNamespace setVariable [format ["DS_item_%1",_x],0];
}forEach DS_itemArray;

//Array of all illegal items
DS_illegalItemsArray = [
	"heroinp","weedp","cocainep","heroinu","weedu","cocaineu","illegalRelicu","illegalRelicp","hydro","sodium","hydroPack","sodiumPack","meth",
	"goldBar","goldBarMedium","goldBarLarge","c4","spyDocs","battery","cracker","bpGunLynx","gunLynx","gunLynxAdv","bpAmmoLynx","ammoLynx","ammoLynxAdv","bpAmmoRpg",
	"ammoRpg","ammoRpgAdv","ied","bpGunRpg","gunRpg","bpGun3gl","gun3gl","bpGunNavid","gunNavid","armour","idChanger","bpAmmoRpgHE","ammoRpgHE","ammoRpgHEAdv","blackfoot",
	"pawnee","bpGunRpg7","bpArmourAdv","bpGunSpmg","gunRpg7","armourAdv","gunSpmg","bpAmmoRpg7","ammoRpg7","ammoRpg7Adv"
];

//Miscellaneous
DS_gearfix = false;
DS_soldVehicle = 0;