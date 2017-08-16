/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "restrained")) exitWith {};
if((_unit getVariable "restrainedciv")) exitWith {};
if(playerSide == west) exitWith {};

if((player distance _unit > 3)) exitWith {};
//if(side player in [east,civilian]) && !license_civ_rebel ) exitWith {}; //no rebel license => nono
if((playerside in [east,civilian]) && !license_civ_rebel) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!
player say3D "cuff"; //Handschellensound

_unit setVariable["restrainedciv",true,true];
[[player], "EMonkeys_fnc_restrainciv", _unit, false] call EMonkeys_fnc_mp;
[[0,format["%1 wurde von %2 gefesselt.",_unit getVariable["realname", name _unit], player getVariable["realname",name player]]],"EMonkeys_fnc_broadcast",west,false] call EMonkeys_fnc_mp;