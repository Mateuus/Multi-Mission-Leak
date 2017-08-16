#include "..\..\script_macros.hpp"
/*
    File: fn_vehInvSearch.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Searches the vehicle for illegal items.
*/
private["_vehicle","_vehicleInfo","_list","_vehicleItems","_vehicleOwner","_inv","_displayName","_var","_val","_str"];
_vehicle = cursorObject;
_list = ["Air","Ship","LandVehicle"];
if (isNull _vehicle || {!(KINDOF_ARRAY(_vehicle,_list))}) exitWith {};
if (!alive _vehicle || player distance _vehicle > 5) exitWith {};

_vehicleInfo = _vehicle getVariable ["Trunk",[[],0]];
_vehicleItems = itemCargo _vehicle;
_vehicleOwner = _vehicle getVariable "vehicle_info_owners";
_str = format["<br/><t color='#FFD700'><t size='1.5'><br/>" +(localize "STR_Cop_IllegalItems")+ "</t></t><br/>"];

if (count _vehicleInfo isEqualTo 0 && count _vehicleItems isEqualTo 0) exitWith {hint localize "STR_Cop_VehEmpty"};

_inv = [];
//vitems
if (count (_vehicleInfo select 0) > 0) then {
	{
		_var = _x select 0;
		_val = _x select 1;
		_displayName = M_CONFIG(getText,"VirtualItems",_var,"displayName");		
		_inv pushBackUnique [(localize _displayName),_val];
	} forEach (_vehicleInfo select 0);
};

if (count (weaponCargo _vehicle) > 0) then {
	//Guns
	{
		_item = _x;
		_val = {_x isEqualTo _item} count (weaponCargo _vehicle);
		_displayName = (getText(configFile >> "CfgWeapons" >> _x >> "displayName"));
		_inv pushBackUnique [_displayName,_val];
	} foreach (weaponCargo _vehicle);
};

if (count (itemCargo _vehicle) > 0) then {
	//Magazines
	{
		_item = _x;
		_val = {_x isEqualTo _item} count (magazineCargo _vehicle);
		_displayName = (getText(configFile >> "CfgMagazines" >> _x >> "displayName"));
		_inv pushBackUnique [_displayName,_val];
	} foreach (magazineCargo _vehicle);
};

if (count (magazineCargo _vehicle) > 0) then {
	//Items
	{
		_item = _x;
		_val = {_x isEqualTo _item} count (itemCargo _vehicle);
		_displayName = (getText(configFile >> "CfgWeapons" >> _x >> "displayName"));
		if (isNil "_displayName") then {
			_displayName = (getText(configFile >> "CfgGlasses" >> _x >> "displayName"));
		};
		_inv pushBackUnique [_displayName,_val];	
	} foreach (itemCargo _vehicle);
};

{
	_str = _str + format["<br/>%1x %2",(_x select 1),(_x select 0)];
} foreach _inv;

hint parseText format["%1",_str];
