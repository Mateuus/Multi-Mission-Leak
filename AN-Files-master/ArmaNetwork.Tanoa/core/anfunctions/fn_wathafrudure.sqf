#include <macro.h>
/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
_vehicle = cursorObject;
_list = ["Air","Ship","LandVehicle"];
if(isNull _vehicle OR {!(KINDOF_ARRAY(_vehicle,_list))}) exitWith {};

createDialog "vehiclecargo";

{
	_item = _x;
	_itemName = [_x] call life_fnc_thagawrepru;
	_itemName = format["%1",(_itemName select 2)]
	lbAdd [1500, _itemName];
} forEach (getWeaponCargo _vehicle select 0);

{
	_item = _x;
	_itemName = [_x] call life_fnc_thagawrepru;
	_itemName = format["%1",(_itemName select 2)]
	lbAdd [1500, _itemName];
} forEach (getMagazineCargo _vehicle select 0);

{
	_item = _x;
	_itemName = [_x] call life_fnc_thagawrepru;
	_itemName = format["%1",(_itemName select 2)]
	lbAdd [1500, _itemName];
} forEach (getItemCargo _vehicle select 0);
{
	_item = _x;
	_itemName = [_x] call life_fnc_thagawrepru;
	_itemName = format["%1",(_itemName select 2)]
	lbAdd [1500, _itemName];
} forEach (getBackPackCargo _vehicle select 0);
