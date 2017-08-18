/*
	File: fn_adminArrest.sqf
	
	Description:
	assists with the functionality of admin arrest.
*/
private["_unit","_id"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(isNull _unit) exitWith {}; //Not valid

detach _unit;
[_unit,false] call life_fnc_adminJailDialog;