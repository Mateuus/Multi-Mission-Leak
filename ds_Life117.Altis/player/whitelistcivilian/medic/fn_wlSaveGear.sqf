/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Saves your medic gear
*/
private ["_masterArray","_uniformItems","_uniformMags","_backpackItems","_backpackMags","_vestItems","_vestMags","_primaryItems","_handgunItems","_inventory","_primaryMags","_done"];

_masterArray = [];
//Quick loop to save simple stuff
{
	_masterArray pushBack _x;
}forEach [uniform player,vest player,backpack player,goggles player,headgear player,assignedItems player,primaryWeapon player,handgunItems player];
_uniformItems = [];
_uniformItems = [];
_uniformMags = [];
_backpackItems = [];
_backpackMags = [];
_vestItems = [];
_vestMags = [];
_primaryItems = [];
_handgunItems = [];
_inventory = [];
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
				_uniformItems = _uniformMags + [_x];
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
				_backpackItems = _backpackMags + [_x];
				};
		}forEach (backpackItems player);
	};
if(!(vest player isEqualTo ""))then
	{
		{
			if(_x in (magazines player))then
				{
				_vestMags = _vestMags + [_x];
				}
				else
				{
				_vestItems = _vestMags + [_x];
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
   ["DS_item_apple",DS_item_apple],["DS_item_rabbit",DS_item_rabbit],["DS_item_salema",DS_item_salema],["DS_item_ornate",DS_item_ornate],["DS_item_macherel",DS_item_macherel],
   ["DS_item_tuna",DS_item_tuna],["DS_item_mullet",DS_item_mullet],["DS_item_catshark",DS_item_catshark],["DS_item_turtle",DS_item_turtle],["DS_item_tbacon",DS_item_tbacon],
   ["DS_item_peach",DS_item_peach],["DS_item_pie",DS_item_pie],["DS_item_burger",DS_item_burger],["DS_item_chips",DS_item_chips],["DS_item_doritos",DS_item_doritos],
   ["DS_item_mediKit",DS_item_mediKit],["DS_item_heroinp",DS_item_heroinp],["DS_item_weedp",DS_item_weedp],["DS_item_cocainep",DS_item_cocainep],["DS_item_heroinu",DS_item_heroinu],
   ["DS_item_weedu",DS_item_weedu],["DS_item_cocaineu",DS_item_cocaineu],["DS_item_illegalRelicu",DS_item_illegalRelicu],["DS_item_illegalRelicp",DS_item_illegalRelicp],["DS_item_hydro",DS_item_hydro],
   ["DS_item_sodium",DS_item_sodium],["DS_item_hydroPack",DS_item_hydroPack],["DS_item_sodiumPack",DS_item_sodiumPack],["DS_item_meth",DS_item_meth],["DS_item_goldBar",DS_item_goldBar],
   ["DS_item_spyDocs",DS_item_spyDocs],["DS_item_pickAxe",DS_item_pickAxe],["DS_item_oilu",DS_item_oilu],["DS_item_diamondu",DS_item_diamondu],["DS_item_copperu",DS_item_copperu],
   ["DS_item_rocku",DS_item_rocku],["DS_item_saltu",DS_item_saltu],["DS_item_ironu",DS_item_ironu],["DS_item_sandu",DS_item_sandu],["DS_item_oilp",DS_item_oilp],
   ["DS_item_diamondp",DS_item_diamondp],["DS_item_rockp",DS_item_rockp],["DS_item_saltp",DS_item_saltp],["DS_item_ironp",DS_item_ironp],["DS_item_sandp",DS_item_sandp],["DS_item_copperp",DS_item_copperp]];
{
	_masterArray pushBack _x;
}forEach [_uniformItems,_uniformMags,_backpackItems,_backpackMags,_vestItems,_vestMags,_primaryItems,_handgunItems,_inventory];
wl_gear = _masterArray;
