/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks what shop the player is trying to access and displays the data needed
*/

private ["_display","_index","_dialog","_list","_shopType"];

disableSerialization;

if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

_display = _this select 0;
_index = _this select 1;

_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1500;

_shopType = _list lbData _index;
_index = (parseNumber (_shopType));

DS_shopIndex = _index;

[0] call DS_fnc_checkBaseClosed;

switch(_index)do {
	case 666: {[_index] spawn DS_fnc_menuAtm}; //ATM Menu
	case 0: {[_index] spawn DS_fnc_setupCarShops}; //Civ Car Shop
	case 1: {[_index] spawn DS_fnc_setupCarShops}; //Civ Truck Shop
	case 2: {[_index] spawn DS_fnc_setupCarShops}; //Civ Air Shop
	case 3: {[_index] spawn DS_fnc_setupCarShops}; //Civ Boat Shop
	case 4: {[_index] spawn DS_fnc_setupVirtShops}; //Civ Item Shop
	case 5: {[_index] spawn DS_fnc_setupWeaponShops}; //Civ Hi-Tech Shop
	case 6: {[_index] spawn DS_fnc_setupWeaponShops}; //Civ weapons Shop
	case 7: {[_index] spawn DS_fnc_setupWeaponShops}; //Civ Adv Weapons Shop
	case 8: {[_index] spawn DS_fnc_setupLicenseShops}; //Main License Shop
	case 9: {[_index] spawn DS_fnc_setupClothingShops}; //Civ Clothing
	case 10: {[_index] spawn DS_fnc_setupClothingShops}; //Civ Hats
	case 11: {[_index] spawn DS_fnc_setupClothingShops}; //Civ Glasses
	case 12: {[_index] spawn DS_fnc_setupClothingShops}; //Civ Backpacks
	case 13: {[_index] spawn DS_fnc_setupClothingShops}; //Civ Diving
	case 14: {[_index] spawn DS_fnc_setupWeaponShops}; //Cadet Weapons Shop Cop
	case 15: {[_index] spawn DS_fnc_setupWeaponShops}; //PO Weapons Shop Cop
	case 16: {[_index] spawn DS_fnc_setupWeaponShops}; //S Weapons Shop Cop
	case 17: {[_index] spawn DS_fnc_setupWeaponShops}; //SS Weapons Shop Cop
	case 18: {[_index] spawn DS_fnc_setupWeaponShops}; //L Weapons Shop Cop
	case 19: {[_index] spawn DS_fnc_setupWeaponShops}; //SI Weapons Shop Cop
	case 20: {[_index] spawn DS_fnc_setupWeaponShops}; //Chief Weapons Shop Cop
	case 21: {[_index] spawn DS_fnc_setupWeaponShops}; //Attach Weapons Shop Cop
	case 22: {[_index] spawn DS_fnc_setupVirtShops}; //Police Item Shop
	case 23: {[_index] spawn DS_fnc_setupQuickBuyShops}; //Police Quick Buy
	case 24: {[_index] spawn DS_fnc_setupClothingShops}; //Police Clothing cadet
	case 25: {[_index] spawn DS_fnc_setupClothingShops}; //Police Clothing po
	case 26: {[_index] spawn DS_fnc_setupClothingShops}; //Police Clothing po
	case 27: {[_index] spawn DS_fnc_setupClothingShops}; //Police Clothing ss
	case 28: {[_index] spawn DS_fnc_setupClothingShops}; //Police Clothing l
	case 29: {[_index] spawn DS_fnc_setupClothingShops}; //Police Clothing si
	case 30: {[_index] spawn DS_fnc_setupCarShops}; //Police Vehicles pub
	case 31: {[_index] spawn DS_fnc_setupCarShops}; //Police Vehicles C
	case 32: {[_index] spawn DS_fnc_setupCarShops}; //Police Vehicles p0
	case 33: {[_index] spawn DS_fnc_setupCarShops}; //Police Vehicles S
	case 34: {[_index] spawn DS_fnc_setupCarShops}; //Police Vehicles SS
	case 35: {[_index] spawn DS_fnc_setupCarShops}; //Police All
	case 36: {[_index] spawn DS_fnc_setupCarShops}; //Police Air Low
	case 37: {[_index] spawn DS_fnc_setupQuickBuyShops}; //Police Body Armour
	case 38: {[_index] spawn DS_civ_processMenu}; //Process Oil
	case 39: {[_index] spawn DS_fnc_setupLicenseShops}; //Resource Trainings
	case 40: {[_index] spawn DS_civ_processMenu}; //Process Sand
	case 41: {[_index] spawn DS_civ_processMenu}; //Process salt
	case 42: {[_index] spawn DS_civ_processMenu}; //Process Rocks
	case 43: {[_index] spawn DS_civ_processMenu}; //Process Iron
	case 44: {[_index] spawn DS_civ_processMenu}; //Process Diamond
	case 45: {[_index] spawn DS_civ_processMenu}; //Process Copper
	case 46: {[_index] spawn DS_fnc_setupVirtShops}; //Raw Item Selling
	case 47: {[_index] spawn DS_fnc_setupVirtShops}; //Processed Item Selling
	case 48: {[_index] spawn DS_civ_captureHideout}; //Capture Gang Hideout
	case 49: {[_index] spawn DS_civ_processMenu}; //Process Weed
	case 50: {[_index] spawn DS_civ_processMenu}; //Process Heroin
	case 51: {[_index] spawn DS_civ_processMenu}; //Process Cocaine
	case 52: {[_index] spawn DS_fnc_setupLicenseShops}; //Drug Trainings
	case 53: {[_index] spawn DS_fnc_setupVirtShops}; //Drug Dealer
	case 54: {[_index] spawn DS_fnc_setupVirtShops}; //Gang Item Shop
	case 55: {[_index,true,"Car"] spawn DS_fnc_setupGarage}; //Car Garage
	case 56: {[false] spawn DS_fnc_storeVehicle}; //Store Vehicle
	case 57: {[_index] spawn DS_fnc_setupWeaponShops}; //Rebel Small Arms
	case 58: {[_index] spawn DS_fnc_setupLicenseShops}; //Rebel Trainings
	case 59: {[_index] spawn DS_fnc_setupWeaponShops}; //Rebel Large Arms
	case 60: {[_index] spawn DS_fnc_setupWeaponShops}; //Rebel Large Arms Main
	case 61: {[_index] spawn DS_fnc_setupCarShops}; //Rebel Vehicle Shop
	case 62: {[_index] spawn DS_fnc_setupCarShops}; //Armed Rebel Vehicle Shop
	case 63: {[_index] spawn DS_fnc_setupWeaponShops}; //Rebel Attachments Shop
	case 64: {[_index] spawn DS_fnc_setupWeaponShops}; //Gang Weapons Shop
	case 65: {[_index] spawn DS_fnc_setupCarShops}; //Gang Vehicles
	case 66: {[_index] spawn DS_civ_processMenu}; //Process Illegal Relics
	case 67: {[_index] spawn DS_fnc_setupVirtShops}; //Gas Station Shop
	case 68: {[_index] spawn DS_civ_robGasStation}; //Rob Gas Station
	case 69: {[_index] spawn DS_fnc_treatSickness}; //Treat Sickness
	case 70: {[_index,true] spawn DS_civ_robHospital}; //Rob Hospital - Chemicals
	case 71: {[_index,false] spawn DS_civ_robHospital}; //Rob Hospital - Cash
	case 72: {[_index] spawn DS_fnc_setupVirtShops}; //Rebel Item Shop
	case 73: {[_index] spawn DS_fnc_setupClothingShops}; //Rebel Clothing
	case 74: {[_index] spawn DS_fnc_setupClothingShops}; //Rebel Hats
	case 75: {[_index] spawn DS_fnc_setupClothingShops}; //Rebel Glasses
	case 76: {[_index] spawn DS_fnc_setupClothingShops}; //Rebel Vest
	case 77: {[_index] spawn DS_fnc_setupClothingShops}; //Rebel Backpacks
	case 78: {[_index] spawn DS_civ_processMeth}; //Process Meth
	case 79: {[_index] spawn DS_civ_drugConvoy}; //Drug Convoy
	case 80: {[_index] spawn DS_civ_gunsConvoy}; //Weapon Convoy
	case 81: {[_index] spawn DS_fnc_setupVirtShops}; //Rebel Trader
	case 82: {[_index] spawn DS_cop_setupPoliceTransport}; //Police Transport
	case 83: {[_index] spawn DS_fnc_setupCarShops}; //Police Air High
	case 84: {[_index,true,"Air"] spawn DS_fnc_setupGarage}; //Air Garage
	case 85: {[_index] spawn DS_fnc_setupRealEstate}; //Real Estate
	case 86: {[_index,true,"Ship"] spawn DS_fnc_setupGarage}; //Boat Garage
	case 87: {[_index] spawn DS_civ_cropDusting}; //Crop Dusting
	case 88: {[_index] spawn DS_civ_setupJobs}; //Jobs Depot
	case 89: {[_index] spawn DS_cop_captureHideout}; //Cop Capture Hideout
	case 90: {[_index] spawn DS_cop_convoys}; //Police Convoys
	case 91: {[_index] spawn DS_fnc_setupUpgrades}; //Vehicle Upgrades
	case 92: {[_index] spawn DS_cop_vehLocker}; //Locker
	case 93: {[_index] spawn DS_fnc_setupLicenseShops}; //Gun Liceses
	case 94: {[_index] spawn DS_fnc_setupMCU}; //Get MCU
	case 95: {[_index] spawn DS_fnc_setupCarShops}; //Medic Vehicles
	case 96: {[_index] spawn DS_fnc_setupCarShops}; //Mechanic Vehicles
	case 97: {[_index] spawn DS_fnc_setupQuickBuyShops}; //Rebel Kits (Sniper)
	case 98: {[_index] spawn DS_fnc_setupQuickBuyShops}; //Rebel Kits (General)
	case 99: {[5,false] spawn DS_cop_MCU}; //Store MCU
	case 100: {[_index] spawn DS_fnc_chopShop}; //Chop Shop
	case 101: {[_index] spawn DS_fnc_setupBusStops}; //Bus Stop
	case 102: {[_index] spawn DS_civ_setupRebelMissions}; //Rebel Jobs
	case 103: {[_index] spawn DS_fnc_setupCarShops}; //Pod Shop
	case 104: {[_index] spawn DS_fnc_setupVirtShops}; //Factory (Blueprints)
	case 105: {[_index] spawn DS_civ_processMenu}; //Process Lumber
	case 106: {[_index] spawn DS_civ_setupCrafting}; //Vehicle Upgrades
	case 107: {[_index] spawn DS_civ_setupCrafting}; //Ingredients
	case 108: {[_index] spawn DS_fnc_setupVirtShops}; //Sell Ingredients
	case 109: {[_index] spawn DS_fnc_setupVirtShops}; //Sell Crafted Items
	case 110: {[_index] spawn DS_cop_copsBribe}; //Cops Check Drug Prices
	case 111: {[_index] spawn DS_civ_setupCrafting}; //Craft Weapons
	case 112: {[_index] spawn DS_civ_lowerTruckRank}; //Lower Truck Rank
	case 113: {[_index] spawn DS_fnc_setupRepaint}; //Vehicle Repainting
	case 114: {[_index] spawn DS_fnc_lottoBuy}; //Lotto
	case 115: {[_index] spawn DS_fnc_setupBuilding}; //Building Box
	case 116: {[_index] spawn DS_fnc_packBuilding}; //Pack Building Box
	case 117: {[_index] spawn DS_fnc_vehRearm}; //Vehicle Rearm
	case 118: {[_index] spawn DS_fnc_setupInsurance}; //Insurance Broker
	case 119: {[_index] spawn DS_fnc_setupVirtShops}; //Security Virt Shop
	case 121: {[_index] spawn DS_fnc_setupWeaponShops}; //Security Weapons Shop
	case 120: {[_index] spawn DS_fnc_setupCarShops}; //Security Vehicles
	case 122: {[_index] spawn DS_fnc_setupWeaponShops}; //Security Weapons Level 3
	case 164: {[_index] spawn DS_fnc_setupWeaponShops}; //Security Attachments
	case 123: {[_index] spawn DS_fnc_setupCarShops}; //Security Vehicles Level 3
	case 124: {[_index] spawn DS_fnc_setupClothingShops}; //Security Clothing
	case 125: {[_index] spawn DS_fnc_setupQuickBuyShops}; //Security Kit 1
	case 126: {[_index] spawn DS_fnc_setupLawyer}; //Lawyer
	case 127: {[_index] spawn DS_fnc_setupCarShops}; //Cop Boat Shop
	case 128: {[_index] spawn DS_fnc_setupClothingRetexture}; //Clothing Retexture
	case 129: {[_index] spawn DS_fnc_setupVehicleRetexture}; //Vehicle Retexture
	case 130: {[_index] spawn DS_fnc_setupRebelTokenShop}; //Rebel Token Shop
	case 131: {[_index] spawn DS_civ_processMenu}; //Process Wheat
	case 132: {[_index] spawn DS_fnc_setupQuickBuyShops}; //Cop Lives
	case 133: {[_index] spawn DS_cop_policePatrol}; //Cop Patrol
	case 134: {[_index] spawn DS_civ_setupBaseUpgrades}; //Base Upgrades
	case 135: {[_index] spawn DS_civ_setupPlaneMissions}; //Plane Missions
	case 136: {[_index] spawn DS_civ_idConvoy}; //ID Convoy
	case 137: {[_index] spawn DS_mech_mechanicMissions}; //Mechanic Mission
	case 138: {[_index] spawn DS_med_deliverBones}; //Deliver Remains
	case 139: {[_index] spawn DS_med_medicMissions}; //Medic Missions
	case 140: {[_index] spawn DS_med_setupMedicTransport}; //Medic Transport
	case 141: {[_index] spawn DS_civ_setupTokenMissions}; //Token Missions
	case 142: {[_index] spawn DS_civ_setupPlaneMissions}; //Air Taxi Missions
	case 143: {[_index] spawn DS_civ_setupBoatMissions}; //Water Taxi Missions
	case 144: {[_index] spawn DS_civ_drugConvoyWater}; //Water Drug Convoy
	case 145: {[_index] spawn DS_civ_weaponsConvoyWater}; //Water Weapons Convoy
	case 146: {[_index] spawn DS_fnc_setupMCUWater}; //Get MCU Water
	case 147: {[_index] spawn DS_fnc_setupClothingShops}; //Mech - Med clothes
	case 148: {[_index] spawn DS_fnc_setupCarShops}; //WL/Civ Boat Shop
	case 149: {}; //House garage
	case 155: {[_index] spawn DS_civ_randomLoadout}; //Random Loadout
	case 156: {[_index] spawn DS_fnc_setupWeaponShops}; //Extra Attachments
	case 157: {[_index] spawn DS_fnc_setupClothingShops}; //Extra Facegear
	case 158: {[_index] spawn DS_fnc_setupWeaponShops}; //Token Weapons Shop
	case 159: {[_index] spawn DS_fnc_questPrestige}; //Quest Line Prestige
	case 160: {[_index] spawn DS_fnc_realMode}; //Switch to/from real mode
	case 161: {[_index] spawn DS_fnc_setupWeaponShops}; //Token Weapons Shop Adv
	case 162: {[_index] spawn DS_fnc_setupRebelTokenShop}; //Token Items Shop Adv
	case 163: {[_index,true] spawn DS_fnc_setupImpoundLot}; //Vehicle Impounding
	case 165: {[_index] spawn DS_fnc_setupClothingShops}; //All Headgear
	case 166: {[_index] spawn DS_fnc_setupCarShops}; //Special rental kos vehicles
};

DS_doingStuff = false;