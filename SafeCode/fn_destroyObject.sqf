#include <macro.h>
/*
	File: fn_destroyObject.sqf
	Author: Michael Francis
	
	Description:
	Destroys useless objects
*/
private["_item","_index"];

_item = cursorTarget;
if(isNull _item) then
{
	_item = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
	if(isNull _item) exitWith {};
};

_index = [typeOf _item, life_placeable] call TON_fnc_index;
if(__GETC__(life_coplevel) < 3) exitWith { hint "You are not allowed to destroy this object!";};
if(_index < 0) exitWith {hint "This item cannot be destroyed.";};

_placeable = life_placeable select _index;
hint "The item has been destroyed.";
deleteVehicle _item;