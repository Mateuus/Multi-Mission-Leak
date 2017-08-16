#include "..\..\script_macros.hpp"
/*
    File: fn_seizeVeh.sqf
    Author: Sinbane
	Based off fn_vehInvSearch and fn_copSeize

    Description:
    Removes illegal items from vehicle
*/
private ["_vehicle","_vehicleInfo","_vehicleCargo","_exempt","_headgear","_vest","_uniform","_safe","_seized","_str","_var","_val","_isIllegalItem","_inv","_itemWeight"];
_vehicle = cursorObject;
_vehicleInfo = _vehicle getVariable ["Trunk",[[],0]];
_vehicleCargo = (itemCargo _vehicle);
_exempt = LIFE_SETTINGS(getArray,"seize_exempt");
_headgear = LIFE_SETTINGS(getArray,"seize_headgear");
_vest = LIFE_SETTINGS(getArray,"seize_vest");
_uniform = LIFE_SETTINGS(getArray,"seize_uniform");
_safe = [];
_seized = [];
_str = (localize "STR_NOTF_SeizedItems");
//_str = [0,"STR_NOTF_VehContraband",true,[[_value] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

if (!alive _vehicle || player distance _vehicle > 5) exitWith {};

//illegal vItems
if (count _vehicleInfo > 0) then {
	{
		_var = _x select 0;
		_val = _x select 1;
		_isIllegalItem = M_CONFIG(getNumber,"VirtualItems",_var,"illegal");
		if (_isIllegalItem isEqualTo 0) then {
			_safe pushBackUnique [_var,_val];
		};
		if (_isIllegalItem isEqualTo 1) then {
			_seized pushBackUnique [_var,_val];
		};
	} forEach (_vehicleInfo select 0);
};
_vehicle setVariable ["Trunk",[[],0],true];

//return legal vitems
_vehicleInfo = _vehicle getVariable ["Trunk",[[],0]];
_inv = _vehicleInfo select 0;
 {
	_itemWeight = ([(_x select 0)] call life_fnc_itemWeight) * (_x select 1); 
	_inv pushBack [(_x select 0),(_x select 1)];
} forEach _safe;
_vehicle setVariable["Trunk",[_inv,(_vehicleInfo select 1) + _itemWeight],true];

{
	_str = _str + format["<br/>%1x %2",(_x select 1),(_x select 0)];
} foreach _seized;

hint parseText format["%1",_str];		//Uncomment to display a hint of seized items
