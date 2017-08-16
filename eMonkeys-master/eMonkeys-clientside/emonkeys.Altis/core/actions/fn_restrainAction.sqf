/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!
player say3D "cuff"; //Handschellensound
_unit setVariable["restrainedciv",false,true];
_unit setVariable["restrained",true,true];
[[player], "EMonkeys_fnc_restrain", _unit, false] call EMonkeys_fnc_mp;
[[0,format["%1 wurde von %2 verhaftet",_unit getVariable["realname", name _unit], profileName]],"EMonkeys_fnc_broadcast",west,false] call EMonkeys_fnc_mp;