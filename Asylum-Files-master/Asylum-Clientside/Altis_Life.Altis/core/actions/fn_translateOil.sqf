/*
	File: fn_translateOil.sqf
	Author: Alan

	Description:
	Change oil barrel to a virtual item
*/
//Setup
_amount = 20;

if(isNull life_holding_barrel) exitWith {};

_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vendor || (player distance _vendor > 6)) exitWith {};

detach life_holding_barrel;
deleteVehicle life_holding_barrel;
life_inv_oilb = _amount;
life_holding_barrel = objNull;
player forceWalk false;

[_vendor, true, true, "oil"] spawn life_fnc_processAction;