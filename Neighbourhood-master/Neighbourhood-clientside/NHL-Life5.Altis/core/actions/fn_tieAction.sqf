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
if((_unit getVariable "tied")) exitWith {};
//if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};

if(!isPlayer _unit) exitWith {};
//Broadcast!
player say3D "cuff"; 	//cuff sound

_unit setVariable["tied",true,true];
_unit setVariable["Incapitated",false,true];
[[player], "life_fnc_tie", _unit, false] spawn life_fnc_MP;
//[[0,format["%1 was restrained by %2",_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;