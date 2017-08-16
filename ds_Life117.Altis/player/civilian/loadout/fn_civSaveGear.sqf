/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Saves all civilian items to an array
*/
private ["_fuelDart","_masterArray","_uniformItems","_uniformMags","_backpackItems","_backpackMags","_vestItems","_vestMags","_primaryItems","_handgunItems","_inventory","_primaryMags","_done"];

_masterArray = [];
//Quick loop to save simple stuff
{
	_masterArray pushBack _x;
}forEach [uniform player,vest player,backpack player,goggles player,headgear player,assignedItems player,primaryWeapon player,handgunItems player];
_uniformItems = [];
_uniformMags = [];
_backpackItems = [];
_backpackMags = [];
_vestItems = [];
_vestMags = [];
_primaryItems = [];
_handgunItems = [];
_inventory = [];
_fuelDart = secondaryWeapon player;
//Full the above arrays... yeah it looks like someone elses work but there isn't exactly many other ways to write this stuff :/
if(!(uniform player isEqualTo ""))then
	{
		{
			if(_x in (magazines player))then
				{
				_uniformMags = _uniformMags + [_x];
				}
				else
				{
				_uniformItems = _uniformItems + [_x];
				};
		}forEach (uniformItems player);
	};
if(!(backpack player isEqualTo ""))then
	{
		{
			if(_x in (magazines player))then
				{
				_backpackMags = _backpackMags + [_x];
				}
				else
				{
				_backpackItems = _backpackItems + [_x];
				};
		}forEach (backpackItems player);
	};
if(!(vest player isEqualTo ""))then
	{
		{
			if(_x in (vestItems player))then
				{
				_vestMags = _vestMags + [_x];
				}
				else
				{
				_vestItems = _vestItems + [_x];
				};
		}forEach (vestItems player);
	};
if(count(primaryWeaponMagazine player) > 0)then
	{
	_primaryMags = ((primaryWeaponMagazine player) select 0);
	if(!(_primaryMags isEqualTo ""))then
		{
		_uniform = player canAddItemToUniform _primaryMags;
		_vest = player canAddItemToVest _primaryMags;
		_backpack = player canAddItemToBackpack _primaryMags;
		_done = false;
		if(_vest)then
			{
			_vestMags = _vestMags + [_primaryMags];
			_done = true;
			};
		if((!_done)&&(_uniform))then
			{
			_uniformMags = _uniformMags + [_primaryMags];
			_done = true;
			};
		if((!_done)&&(_backpack))then
			{
			_backpackMags = _backpackMags + [_primaryMags];
			_done = true;
			};
		};
	};
if(count(handgunMagazine player) > 0)then
	{
	_handgunMags = ((handgunMagazine player) select 0);
	if(!(_handgunMags isEqualTo ""))then
		{
		_uniform = player canAddItemToUniform _handgunMags;
		_vest = player canAddItemToVest _handgunMags;
		_backpack = player canAddItemToBackpack _handgunMags;
		_done = false;
		if(_vest)then
			{
			_vestMags = _vestMags + [_handgunMags];
			_done = true;
			};
		if((!_done)&&(_uniform))then
			{
			_uniformMags = _uniformMags + [_handgunMags];
			_done = true;
			};
		if((!_done)&&(_backpack))then
			{
			_backpackMags = _backpackMags + [_handgunMags];
			_done = true;
			};
		};
	};
if(count(primaryWeaponItems player) > 0)then
	{
		{
			_primaryItems = _primaryItems + [_x];
		}forEach (primaryWeaponItems player);
	};
if(count(handgunItems player) > 0)then
	{
		{
			_handgunItems = _handgunItems + [_x];
		}forEach (handgunItems player);
	};
{
	_str = (_x select 0);
	_amount = (_x select 1);
	if(!(_amount isEqualTo 0))then
		{
		for "_i" from 1 to _amount do
			{
			_inventory = _inventory + [_str];
			};
		};
}forEach
[["DS_item_water",DS_item_water],["DS_item_donut",DS_item_donut],["DS_item_repairKit",DS_item_repairKit],["DS_item_refuelKit",DS_item_refuelKit],["DS_item_lockpick",DS_item_lockpick],["DS_item_lighter",DS_item_lighter],
   ["DS_item_siphonKit",DS_item_siphonKit],["DS_item_nitro",DS_item_nitro],["DS_item_goKart",DS_item_goKart],["DS_item_coffee",DS_item_coffee],["DS_item_pepsi",DS_item_pepsi],
   ["DS_item_apple",DS_item_apple],["DS_item_rabbit",DS_item_rabbit],["DS_item_salema",DS_item_salema],["DS_item_ornate",DS_item_ornate],["DS_item_mackerel",DS_item_mackerel],
   ["DS_item_tuna",DS_item_tuna],["DS_item_mullet",DS_item_mullet],["DS_item_catshark",DS_item_catshark],["DS_item_turtle",DS_item_turtle],["DS_item_tbacon",DS_item_tbacon],
   ["DS_item_peach",DS_item_peach],["DS_item_pie",DS_item_pie],["DS_item_burger",DS_item_burger],["DS_item_chips",DS_item_chips],["DS_item_doritos",DS_item_doritos],
   ["DS_item_mediKit",DS_item_mediKit],["DS_item_heroinp",DS_item_heroinp],["DS_item_weedp",DS_item_weedp],["DS_item_cocainep",DS_item_cocainep],["DS_item_heroinu",DS_item_heroinu],
   ["DS_item_weedu",DS_item_weedu],["DS_item_cocaineu",DS_item_cocaineu],["DS_item_illegalRelicu",DS_item_illegalRelicu],["DS_item_illegalRelicp",DS_item_illegalRelicp],["DS_item_hydro",DS_item_hydro],
   ["DS_item_sodium",DS_item_sodium],["DS_item_hydroPack",DS_item_hydroPack],["DS_item_sodiumPack",DS_item_sodiumPack],["DS_item_meth",DS_item_meth],
   ["DS_item_spyDocs",DS_item_spyDocs],["DS_item_pickAxe",DS_item_pickAxe],["DS_item_oilu",DS_item_oilu],["DS_item_diamondu",DS_item_diamondu],["DS_item_copperu",DS_item_copperu],
   ["DS_item_rocku",DS_item_rocku],["DS_item_saltu",DS_item_saltu],["DS_item_ironu",DS_item_ironu],["DS_item_sandu",DS_item_sandu],["DS_item_oilp",DS_item_oilp],
   ["DS_item_diamondp",DS_item_diamondp],["DS_item_rockp",DS_item_rockp],["DS_item_saltp",DS_item_saltp],["DS_item_ironp",DS_item_ironp],["DS_item_sandp",DS_item_sandp],["DS_item_copperp",DS_item_copperp],
   ["DS_item_battery",DS_item_battery],["DS_item_vodka",DS_item_vodka],["DS_item_bourbon",DS_item_bourbon],["DS_item_bpVehSecurity",DS_item_bpVehSecurity],["DS_item_bpVehWeight",DS_item_bpVehWeight],
   ["DS_item_bpVehFuel",DS_item_bpVehFuel],["DS_item_mattBronze",DS_item_mattBronze],["DS_item_mattCrystalGlass",DS_item_mattCrystalGlass],["DS_item_mattCircuitBoard",DS_item_mattCircuitBoard],
   ["DS_item_mattSmallBattery",DS_item_mattSmallBattery],["DS_item_mattCpu",DS_item_mattCpu],["DS_item_woodp",DS_item_woodp],["DS_item_woodu",DS_item_woodu],["DS_item_vehSecurity",DS_item_vehSecurity],
   ["DS_item_vehWeight",DS_item_vehWeight],["DS_item_vehFuel",DS_item_vehFuel],["DS_item_vehSecurityAdv",DS_item_vehSecurityAdv],["DS_item_vehWeightAdv",DS_item_vehWeightAdv],["DS_item_vehFuelAdv",DS_item_vehFuelAdv],
   ["DS_item_mattSteel",DS_item_mattSteel],["DS_item_mattTreatedLumber",DS_item_mattTreatedLumber],["DS_item_chute",DS_item_chute],["DS_item_fire",DS_item_fire],["DS_item_ziptie",DS_item_ziptie],["DS_item_bpGunLynx",DS_item_bpGunLynx]
   ,["DS_item_gunLynx",DS_item_gunLynx],["DS_item_gunLynxAdv",DS_item_gunLynxAdv],["DS_item_bpAmmoLynx",DS_item_bpAmmoLynx],["DS_item_ammoLynx",DS_item_ammoLynx],["DS_item_ammoLynxAdv",DS_item_ammoLynxAdv],["DS_item_bpAmmoRpg",DS_item_bpAmmoRpg]
   ,["DS_item_ammoRpg",DS_item_ammoRpg],["DS_item_ammoRpgAdv",DS_item_ammoRpgAdv],["DS_item_c4",DS_item_c4],["DS_item_vehNos",DS_item_vehNos],["DS_item_vehNosAdv",DS_item_vehNosAdv],["DS_item_houseItemUpgrade",DS_item_houseItemUpgrade],
   ["DS_item_jail10",DS_item_jail10],["DS_item_safeCrackerAdv",DS_item_safeCrackerAdv],["DS_item_jailBreak",DS_item_jailBreak],["DS_item_steriods",DS_item_steriods],["DS_item_noRecoil",DS_item_noRecoil],["DS_item_quickCap",DS_item_quickCap],
   ["DS_item_pawnee",DS_item_pawnee],["DS_item_convoy",DS_item_convoy],["DS_item_wheatu",DS_item_wheatu],["DS_item_wheatp",DS_item_wheatp],["DS_item_vehAmmo",DS_item_vehAmmo],["DS_item_bpVehSUV",DS_item_bpVehSUV]
   ,["DS_item_bpGunRpg",DS_item_bpGunRpg],["DS_item_gunRpg",DS_item_gunRpg],["DS_item_bpGun3gl",DS_item_bpGun3gl],["DS_item_gun3gl",DS_item_gun3gl],["DS_item_bpGunNavid",DS_item_bpGunNavid],["DS_item_gunNavid",DS_item_gunNavid]
   ,["DS_item_thermal",DS_item_thermal],["DS_item_weaponsAir",DS_item_weaponsAir],["DS_item_weaponsLand",DS_item_weaponsLand],["DS_item_blackfoot",DS_item_blackfoot],["DS_item_bpThermal",DS_item_bpThermal],["DS_item_bpWeaponsAir",DS_item_bpWeaponsAir]
   ,["DS_item_bpWeaponsLand",DS_item_bpWeaponsLand],["DS_item_bpBlackfoot",DS_item_bpBlackfoot],["DS_item_armour",DS_item_armour],["DS_item_packSteel",DS_item_packSteel],["DS_item_packBronze",DS_item_packBronze],["DS_item_packGlass",DS_item_packGlass]
   ,["DS_item_packCircuitBoard",DS_item_packCircuitBoard],["DS_item_packBattery",DS_item_packBattery],["DS_item_packCPU",DS_item_packCPU],["DS_item_idChanger",DS_item_idChanger]];
{
	_masterArray pushBack _x;
}forEach [_uniformItems,_uniformMags,_backpackItems,_backpackMags,_vestItems,_vestMags,_primaryItems,_handgunItems,_inventory];
_masterArray pushBack (handGunWeapon player);
_masterArray pushBack _fuelDart;
civ_gear = _masterArray;
