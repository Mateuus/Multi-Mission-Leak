#include "..\..\script_macros.hpp"
/*
	File: fn_tieAction.sqf

	Description:
	Tie the target.
*/
private["_unit"];
_unit = cursorObject;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit GVAR "restrained")) exitWith {};
if((_unit GVAR "tied")) exitWith {};
if(side _unit == independent) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(life_inv_ziptie < 1) exitWith {};
//Broadcast!

_unit SVAR["tied",true,true];
[player] remoteExec ["life_fnc_tie",_unit];
