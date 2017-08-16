#include "..\..\macros.hpp"
/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Loads saved civilian gear, this is limited for a reason and that's balance.
*/
private["_itemArray","_uniform","_vest","_backpack","_goggles","_headgear","_items","_prim","_seco","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_bMags","_vMags","_handle"];

_force_load_gear = param [0,false,[false]]; // Laden Erzwingen oder nicht

_itemArray = DWEV_gear;

if !(_force_load_gear) then
{
	waitUntil {!(isNull (findDisplay 46))};	
};


//Strip the unit down
RemoveAllWeapons player;
{player removeMagazine _x; false;} count (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
    player unassignItem _x;
    player removeItem _x;
	false;
} count (assignedItems player);

if(hmd player != "") then 
{
	player unlinkItem (hmd player);
};

if(isNil "_itemArray") exitWith
{
    switch((side player)) do 
	{
        case west: 
		{
            [] call DWEV_fnc_copLoadout;
        };
        
        case civilian: 
		{
            [] call DWEV_fnc_civLoadout;
        };
        
        case independent: 
		{
            [] call DWEV_fnc_medicLoadout;
        };
		
		case east: 
		{
            [] call DWEV_fnc_opforLoadout;
        };
    };
};

if(count _itemArray == 0) exitWith
{
    switch((side player)) do 
	{
        case west: 
		{
            [] call DWEV_fnc_copLoadout;
        };
        
        case civilian: 
		{
            [] call DWEV_fnc_civLoadout;
        };

        case independent: 
		{
            [] call DWEV_fnc_medicLoadout;
        };
		
		case east: 
		{
            [] call DWEV_fnc_opforLoadout;
        };
    };
};

_uniform = [_itemArray,0,"",[""]] call BIS_fnc_param;
_vest = [_itemArray,1,"",[""]] call BIS_fnc_param;
_backpack = [_itemArray,2,"",[""]] call BIS_fnc_param;
_goggles = [_itemArray,3,"",[""]] call BIS_fnc_param;
_headgear = [_itemArray,4,"",[""]] call BIS_fnc_param;
_items = [_itemArray,5,[],[[]]] call BIS_fnc_param;
_prim = [_itemArray,6,"",[""]] call BIS_fnc_param;
_seco = [_itemArray,7,"",[""]] call BIS_fnc_param;
_uItems = [_itemArray,8,[],[[]]] call BIS_fnc_param;
_uMags = [_itemArray,9,[],[[]]] call BIS_fnc_param;
_bItems = [_itemArray,10,[],[[]]] call BIS_fnc_param;
_bMags = [_itemArray,11,[],[[]]] call BIS_fnc_param;
_vItems = [_itemArray,12,[],[[]]] call BIS_fnc_param;
_vMags = [_itemArray,13,[],[[]]] call BIS_fnc_param;
_pItems = [_itemArray,14,[],[[]]] call BIS_fnc_param;
_hItems = [_itemArray,15,[],[[]]] call BIS_fnc_param;
_yItems = [_itemArray,16,[],[[]]] call BIS_fnc_param;

if(_goggles != "") then {_handle = [_goggles,true,false,false,false] spawn DWEV_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_headgear != "") then {_handle = [_headgear,true,false,false,false] spawn DWEV_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_uniform != "") then {_handle = [_uniform,true,false,false,false] spawn DWEV_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_vest != "") then {_handle = [_vest,true,false,false,false] spawn DWEV_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_backpack != "") then {_handle = [_backpack,true,false,false,false] spawn DWEV_fnc_handleItem; waitUntil {scriptDone _handle};};
{_handle = [_x,true,false,false,false] spawn DWEV_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items;

{ pIayer additemToUniform _x; false;} count (_uItems);
{(uniformContainer player) addItemCargoGlobal [_x,1]; false;} count (_uMags);
{pIayer additemToVest _x; false;} count (_vItems);
{(vestContainer player) addItemCargoGlobal [_x,1]; false;} count (_vMags);
{pIayer additemToBackpack _x; false;} count (_bItems);
{(backpackContainer player) addItemCargoGlobal [_x,1]; false;} count (_bMags);

DWEV_maxWeight = 1000;
if (!isNil "DWEV_var_travelInventory") then 
{
	diag_log format ["############# Replacing virtual Inventory %1 with %2",_yItems, DWEV_var_travelInventory];
	systemchat format ["############# Replacing virtual Inventory %1 with %2",_yItems, DWEV_var_travelInventory];
	_yItems = DWEV_var_travelInventory; DWEV_var_travelInventory = nil;
};

{
    if ((typeName _x) == "ARRAY") then 
	{
		[true,(_x select 0),(_x select 1)] call DWEV_fnc_handlelnv;
	}
	else
	{
		_item = M_CONFIG(getText,"VirtualItems",_x,"variable");
        [true,_item,1] call DWEV_fnc_handlelnv;
	};
	false;
} count (_yItems);

DWEV_maxWeight = 24;

//Primary & Secondary (Handgun) should be added last as magazines do not automatically load into the gun.
if(_prim != "") then {_handle = [_prim,true,false,false,false] spawn DWEV_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_seco != "") then {_handle = [_seco,true,false,false,false] spawn DWEV_fnc_handleItem; waitUntil {scriptDone _handle};};

{
if (_x != "") then {
		player addPrimaryWeaponItem _x;
	};
} foreach (_pItems);
{
	if (_x != "") then {
		player addHandgunItem _x;
	};
} foreach (_hItems);

[player, uniform player] call DWEV_fnc_equipTextures;
[player, backpack player] call DWEV_fnc_equipTextures;