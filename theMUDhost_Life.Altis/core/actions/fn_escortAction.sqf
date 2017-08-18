/*
	File: fn_escortAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles escorting of objects and players.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNil "_unit" OR isNull _unit) exitWith {};

_unit attachTo [player,[0.1,1.1,0]];
if(typeOf _unit == "IG_supplyCrate_F") then
{
	_unit attachTo [player,[0.1,1.1,0.9]];
};

_unit setVariable["transporting",false,true];
_unit setVariable["Escorting",true,true];

player reveal _unit;