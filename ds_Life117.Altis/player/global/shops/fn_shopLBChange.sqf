/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Checks what shop the player is trying to access and displays the data needed
*/
disableSerialization;
private["_index","_display","_list","_dialog","_shopType"];

if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

_display = _this select 0;
_index = _this select 1;

_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1500;

_shopType = _list lbData _index;
_index = (parseNumber(_shopType));

DS_shopIndex = _index;

[0] call DS_fnc_checkBaseClosed;

switch(_index)do
	{
	case 666://ATM Menu
		{
		[_index] spawn DS_fnc_menuAtm;
		};
	case 0://Civ Car Shop
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 1://Civ Truck Shop
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 2://Civ Air Shop
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 3://Civ Boat Shop
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 4://Civ item Shop
		{
		[_index] spawn DS_fnc_setupVirtshops;
		};
	case 5://Civ hitech Shop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 6://Civ weapons Shop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 7://Civ adv weapons Shop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 8://Main License Shop
		{
		[_index] spawn DS_fnc_setupLicenseshops;
		};
	case 9://Civ clothing
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 10://Civ hats
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 11://Civ Glasses
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 12://Civ Backpacks
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 13://Civ Diving
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 14://Cadet weapons Shop cop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 15://PO weapons Shop cop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 16://S weapons Shop cop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 17://SS weapons Shop cop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 18://L weapons Shop cop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 19://SI weapons Shop cop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 20://Chief weapons Shop cop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 21://Attach weapons Shop cop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 22://Police item shop
		{
		[_index] spawn DS_fnc_setupVirtshops;
		};
	case 23://Police quickbuy
		{
		[_index] spawn DS_fnc_setupQuickBuyshops;
		};
	case 24://Police clothing cadet
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 25://Police clothing po
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 26://Police clothing s
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 27://Police clothing ss
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 28://Police clothing l
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 29://Police clothing si
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 30://Police vehicles pub
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 31://Police vehicles C
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 32://Police vehicles p0
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 33://Police vehicles S
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 34://Police vehicles SS
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 35://Police vehicles L
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 36://Police air low
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 37://Police body armour
		{
		[_index] spawn DS_fnc_setupQuickBuyshops;
		};
	case 38://process Oil
		{
		[_index] spawn DS_civ_processMenu;
		};
	case 39://resource trainings
		{
		[_index] spawn DS_fnc_setupLicenseshops;
		};
	case 40://process Sand
		{
		[_index] spawn DS_civ_processMenu;
		};
	case 41://process salt
		{
		[_index] spawn DS_civ_processMenu;
		};
	case 42://process Rocks
		{
		[_index] spawn DS_civ_processMenu;
		};
	case 43://process Iron
		{
		[_index] spawn DS_civ_processMenu;
		};
	case 44://process Diamond
		{
		[_index] spawn DS_civ_processMenu;
		};
	case 45://process Copper
		{
		[_index] spawn DS_civ_processMenu;
		};
	case 46://Raw Item selling
		{
		[_index] spawn DS_fnc_setupVirtshops;
		};
	case 47://processed Item selling
		{
		[_index] spawn DS_fnc_setupVirtshops;
		};
	case 48://Capture gang hideout
		{
		[_index] spawn DS_civ_captureHideout;
		};
	case 49://Process weed
		{
		[_index] spawn DS_civ_processMenu;
		};
	case 50://Process heroin
		{
		[_index] spawn DS_civ_processMenu;
		};
	case 51://Process cocaine
		{
		[_index] spawn DS_civ_processMenu;
		};
	case 52://Drug trainings
		{
		[_index] spawn DS_fnc_setupLicenseshops;
		};
	case 53://Drug Dealer
		{
		[_index] spawn DS_fnc_setupVirtshops;
		};
	case 54://Gang Item Shop
		{
		[_index] spawn DS_fnc_setupVirtshops;
		};
	case 55://Car Garage
		{
		[_index,true,"Car"] spawn DS_fnc_setupGarage;
		};
	case 56://Store vehicle
		{
		[_index,true,"Car"] spawn DS_fnc_storeVehicle;
		};
	case 57://Rebel Small Arms
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 58://Rebel trainings
		{
		[_index] spawn DS_fnc_setupLicenseshops;
		};
	case 59://Rebel Large Arms
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 60://Rebel Large Arms Main
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 61://Rebel Vehicle Shop
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 62://Armed Rebel Vehicle Shop
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 63://Rebel attachments shop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 64://Gang Weapons shop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 65://Gang Vehicles
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 66://Process illegal relics
		{
		[_index] spawn DS_civ_processMenu;
		};
	case 67://Gas Station Shop
		{
		[_index] spawn DS_fnc_setupVirtshops;
		};
	case 68://Rob Gas Station
		{
		[_index] spawn DS_civ_robGasStation;
		};
	case 69://Treat Sickness
		{
		[_index] spawn DS_fnc_treatSickness;
		};
	case 70://Rob Hospital//chemicals
		{
		[_index,true] spawn DS_civ_robHospital;
		};
	case 71://Rob Hospital//Cash
		{
		[_index,false] spawn DS_civ_robHospital;
		};
	case 72://Rebel Item Shop
		{
		[_index] spawn DS_fnc_setupVirtshops;
		};
	case 73://Rebel clothing
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 74://Rebel Hats
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 75://Rebel Glasses
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 76://Rebel Vest
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 77://Rebel Backpacks
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 78://Process Meth
		{
		[_index] spawn DS_civ_processMeth;
		};
	case 79://Drug Convoy
		{
		[_index] spawn DS_civ_drugConvoy;
		};
	case 80://Weapon Convoy
		{
		[_index] spawn DS_civ_gunsConvoy;
		};
	case 81://Rebel Trader
		{
		[_index] spawn DS_fnc_setupVirtshops;
		};
	case 82://Police transport
		{
		[_index] spawn DS_cop_setupPoliceTransport;
		};
	case 83://Police air high
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 84://Air Garage
		{
		[_index,true,"Air"] spawn DS_fnc_setupGarage;
		};
	case 85://RealEstate
		{
		[_index] spawn DS_fnc_setupRealEstate;
		};
	case 86://Boat Garage
		{
		[_index,true,"Ship"] spawn DS_fnc_setupGarage;
		};
	case 87://Crop Dusting
		{
		[_index] spawn DS_civ_cropDusting;
		};
	case 88://Jobs Depot
		{
		[_index] spawn DS_civ_setupJobs;
		};
	case 89://Cop claim gang hideout
		{
		[_index] spawn DS_cop_captureHideout;
		};
	case 90://Police convoys
		{
		[_index] spawn DS_cop_convoysNew;
		};
	case 91://Vehicle upgrades
		{
		[_index] spawn DS_fnc_setupUpgrades;
		};
	case 92://Locker
		{
		[_index] spawn DS_cop_vehLocker;
		};
	case 93://Gun Liceses
		{
		[_index] spawn DS_fnc_setupLicenseshops;
		};
	case 94://GET MCU
		{
		[_index] spawn DS_fnc_setupMCU;
		};
	case 95://Medic Vehicles
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 96://Mechanic Vehicles
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 97://Rebel Kits (Sniper)
		{
		[_index] spawn DS_fnc_setupQuickBuyshops;
		};
	case 98://Rebel Kits (General)
		{
		[_index] spawn DS_fnc_setupQuickBuyshops;
		};
	case 99://Store MCU
		{
		[5,false] spawn DS_cop_MCU;
		};
	case 100://Chop shop
		{
		[_index] spawn DS_fnc_chopShop;
		};
	case 101://Bus Stop
		{
		[_index] spawn DS_fnc_setupBusstops;
		};
	case 102://Rebel Jobs
		{
		[_index] spawn DS_civ_setupRebelMissions;
		};
	case 103://Pod Shop
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 104://factory (Blue prints)
		{
		[_index] spawn DS_fnc_setupVirtshops;
		};
	case 105://process Lumber
		{
		[_index] spawn DS_civ_processMenu;
		};
	case 106://Vehicle Upgrades
		{
		[_index] spawn DS_civ_setupCrafting;
		};
	case 107://Ingredients
		{
		[_index] spawn DS_civ_setupCrafting;
		};
	case 108://Sell Ingredients
		{
		[_index] spawn DS_fnc_setupVirtshops;
		};
	case 109://Sell crafted items
		{
		[_index] spawn DS_fnc_setupVirtshops;
		};
	case 110://Cops check drug prices
		{
		[_index] spawn DS_cop_copsBribe;
		};
	case 111://Craft weapons
		{
		[_index] spawn DS_civ_setupCrafting;
		};
	case 112://Lower Truck Rank
		{
		[_index] spawn DS_civ_lowerTruckRank;
		};
	case 113://Vehicle Repainting
		{
		[_index] spawn DS_fnc_setupRepaint;
		};
	case 114://Lotto
		{
		[_index] spawn DS_fnc_lottoBuy;
		};
	case 115://Building Box
		{
		[_index] spawn DS_fnc_setupBuilding;
		};
	case 116://Pack Building Box
		{
		[_index] spawn DS_fnc_packBuilding;
		};
	case 117://vehicle rearm
		{
		[_index] spawn DS_fnc_vehRearm;
		};
	case 118://Insurance broaker
		{
		[_index] spawn DS_fnc_setupInsurance;
		};
	case 119://Sec Virt Shop
		{
		[_index] spawn DS_fnc_setupVirtshops;
		};
	case 121://Sec weapons Shop
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 120://Sec Vehicles
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 122://Sec weapons lvl3
		{
		[_index] spawn DS_fnc_setupWeaponshops;
		};
	case 123://Sec Vehicles lvl3
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 124://Sec clothing
		{
		[_index] spawn DS_fnc_setupClothingShops;
		};
	case 125://Security kit 1
		{
		[_index] spawn DS_fnc_setupQuickBuyshops;
		};
	case 126://Lawyer
		{
		[_index] spawn DS_fnc_setupLawyer;
		};
	case 127://Cop Boat Shop
		{
		[_index] spawn DS_fnc_setupCarshops;
		};
	case 128://Clothing retexture
		{
		[_index] spawn DS_fnc_setupClothingRetexture;
		};
	case 129://vehicle retexture
		{
		[_index] spawn DS_fnc_setupVehicleRetexture;
		};
	case 130://Rebel Token Shop
		{
		[_index] spawn DS_fnc_setupRebelTokenShop;
		};
	case 131://process Wheat
		{
		[_index] spawn DS_civ_processMenu;
		};
	case 132://Cop Lives
		{
		[_index] spawn DS_fnc_setupQuickBuyshops;
		};
	case 133://Cop Patrol
		{
		[_index] spawn DS_cop_policePatrol;
		};
	case 134://Base Upgrades
		{
		[_index] spawn DS_civ_setupBaseUpgrades;
		};
	case 135://Plane Missions
		{
		[_index] spawn DS_civ_setupPlaneMissions;
		};
	case 136://ID Convoy
		{
		[_index] spawn DS_civ_idConvoy;
		};
	case 137://Mechanic Mission
		{
		[_index] spawn DS_mech_mechanicMissions;
		};
	case 138://Deliver Remains
		{
		[_index] spawn DS_med_deliverBones;
		};
	case 139://Medic Missions
		{
		[_index] spawn DS_med_medicMissions;
		};
	case 140://Medic Transport
		{
		[_index] spawn DS_med_setupMedicTransport;
		};
	};

DS_doingStuff = false;