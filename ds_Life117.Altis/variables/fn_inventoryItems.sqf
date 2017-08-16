/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Fulls the array and sets up variables for inventory items
*/

private ["_items","_ItemArray"];
//Array of all items
DS_itemArray = [
"DS_item_water","DS_item_donut","DS_item_repairKit","DS_item_refuelKit","DS_item_lockpick","DS_item_lighter","DS_item_siphonKit","DS_item_nitro","DS_item_goKart","DS_item_coffee",
"DS_item_pepsi","DS_item_apple","DS_item_rabbit","DS_item_salema","DS_item_ornate","DS_item_mackerel","DS_item_tuna","DS_item_mullet","DS_item_catshark","DS_item_turtle",
"DS_item_tbacon","DS_item_peach","DS_item_pie","DS_item_burger","DS_item_chips","DS_item_doritos","DS_item_mediKit","DS_item_heroinp","DS_item_weedp","DS_item_cocainep",
"DS_item_heroinu","DS_item_weedu","DS_item_cocaineu","DS_item_illegalRelicu","DS_item_illegalRelicp","DS_item_hydro","DS_item_sodium","DS_item_hydroPack","DS_item_sodiumPack","DS_item_meth",
"DS_item_goldBar","DS_item_spyDocs","DS_item_pickAxe","DS_item_oilu","DS_item_diamondu","DS_item_copperu","DS_item_rocku","DS_item_saltu","DS_item_ironu","DS_item_sandu",
"DS_item_oilp","DS_item_diamondp","DS_item_rockp","DS_item_saltp","DS_item_ironp","DS_item_sandp","DS_item_copperp","DS_item_relic","DS_item_c4","DS_item_defuse",
"DS_item_battery","DS_item_cracker","DS_item_spikeStrip","DS_item_UAV","DS_item_fuelDart","DS_item_vodka","DS_item_bourbon","DS_item_bpVehSecurity","DS_item_bpVehWeight","DS_item_bpVehFuel",
"DS_item_mattBronze","DS_item_mattCrystalGlass","DS_item_mattCircuitBoard","DS_item_mattSmallBattery","DS_item_mattCpu","DS_item_woodp","DS_item_woodu","DS_item_vehSecurity","DS_item_vehWeight","DS_item_vehFuel",
"DS_item_vehSecurityAdv","DS_item_vehWeightAdv","DS_item_vehFuelAdv","DS_item_mattSteel","DS_item_mattTreatedLumber","DS_item_chute","DS_item_fire","DS_item_ziptie","DS_item_bpGunLynx","DS_item_gunLynx",
"DS_item_gunLynxAdv","DS_item_bpAmmoLynx","DS_item_ammoLynx","DS_item_ammoLynxAdv","DS_item_bpAmmoRpg","DS_item_ammoRpg","DS_item_ammoRpgAdv","DS_item_ied","DS_item_buildingBox","DS_item_bpVehNos",
"DS_item_vehNos","DS_item_vehNosAdv","DS_item_houseItemUpgrade","DS_item_houseWeaponUpgrade","DS_item_jail10","DS_item_safeCrackerAdv","DS_item_jailBreak","DS_item_steriods","DS_item_noRecoil","DS_item_quickCap",
"DS_item_pawnee","DS_item_convoy","DS_item_wheatu","DS_item_wheatp","DS_item_vehAmmo","DS_item_ammoFlash","DS_item_ammoTear","DS_item_bpVehSUV","DS_item_bpGunRpg","DS_item_gunRpg",
"DS_item_bpGun3gl","DS_item_gun3gl","DS_item_bpGunNavid","DS_item_gunNavid","DS_item_thermal","DS_item_weaponsAir","DS_item_weaponsLand","DS_item_blackfoot","DS_item_bpThermal","DS_item_bpWeaponsAir",
"DS_item_bpWeaponsLand","DS_item_bpBlackfoot","DS_item_armour","DS_item_packSteel","DS_item_packBronze","DS_item_packGlass","DS_item_packCircuitBoard","DS_item_packBattery","DS_item_packCPU","DS_item_idChanger",
"DS_item_bones","DS_item_goldBarMedium","DS_item_goldBarLarge"
];
//Sets all items to zero by default
{
	missionNamespace setVariable[_x,0];
}forEach DS_itemArray;
//shortNames for index checks
DS_masterItemArray =
[
"water","donut","repairKit","refuelKit","lockpick","lighter","siphonKit","nitro","goKart","coffee",
"pepsi","apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle",
"tbacon","peach","pie","burger","chips","doritos","mediKit","heroinp","weedp","cocainep",
"heroinu","weedu","cocaineu","illegalRelicu","illegalRelicp","hydro","sodium","hydroPack","sodiumPack","meth",
"goldBar","spyDocs","pickAxe","oilu","diamondu","copperu","rocku","saltum","ironu","sandu",
"oilp","diamondp","copperp","rockp","saltp","ironp","sandp","relic","c4","defuse",
"battery","cracker","spikeStrip","UAV","fuelDart","vodka","bourbon","bpVehSecurity","bpVehWeight","bpVehFuel",
"mattBronze","mattCrystalGlass","mattCircuitBoard","mattSmallBattery","mattCpu","woodp","woodu","vehSecurity","vehWeight","vehFuel",
"vehSecurityAdv","vehWeightAdv","vehFuelAdv","mattSteel","mattTreatedLumber","chute","fire","ziptie","bpGunLynx","gunLynx",
"gunLynxAdv","bpAmmoLynx","ammoLynx","ammoLynxAdv","bpAmmoRpg","ammoRpg","ammoRpgAdv","ied","buildingBox","bpVehNos",
"vehNos","vehNosAdv","houseItemUpgrade","houseWeaponUpgrade","jail10","safeCrackerAdv","jailBreak","steriods","noRecoil","quickCap",
"pawnee","convoy","wheatu","wheatp","vehAmmo","ammoFlash","ammoTear","bpVehSUV","bpGunRpg","gunRpg",
"bpGun3gl","gun3gl","bpGunNavid","gunNavid","thermal","weaponsAir","weaponsLand","blackfoot","bpThermal","bpWeaponsAir",
"bpWeaponsLand","bpBlackfoot","armour","packSteel","packBronze","packGlass","packCircuitBoard","packBattery","packCPU",
"bones","goldBarMedium","goldBarLarge"
];

DS_illegalItemsArray = ["DS_item_heroinp","DS_item_weedp","DS_item_cocainep","DS_item_heroinu","DS_item_weedu","DS_item_cocaineu","DS_item_illegalRelicu","DS_item_illegalRelicp","DS_item_hydro","DS_item_sodium","DS_item_hydroPack","DS_item_sodiumPack","DS_item_meth",
"DS_item_goldBar","DS_item_goldBarMedium","DS_item_goldBarLarge","DS_item_c4","DS_item_spyDocs","DS_item_battery","DS_item_cracker","DS_item_bpGunLynx","DS_item_gunLynx","DS_item_gunLynxAdv","DS_item_bpAmmoLynx","DS_item_ammoLynx","DS_item_ammoLynxAdv","DS_item_bpAmmoRpg",
"DS_item_ammoRpg","DS_item_ammoRpgAdv","DS_item_ied","DS_item_bpGunRpg","DS_item_gunRpg","DS_item_bpGun3gl","DS_item_gun3gl","DS_item_bpGunNavid","DS_item_gunNavid","armour","idChanger"];

DS_gearfix = false;
DS_soldVehicle = 0;










