#include "..\..\script_macros.hpp"
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
if((_unit GVAR "restrained")) exitWith {};
if(player isEqualTo _unit) exitWith {};
if(!isPlayer _unit) exitWith {};


if(playerSide isEqualTo west) then {
	_unit say3D "handcuffs";
	_unit SVAR["restrained",true,true];
	[player] remoteExec ["life_fnc_restrain",_unit];
	[0,"STR_NOTF_Restrained",true,[_unit GVAR["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
} else {
	if(life_inv_handcuffs > 0) then {
		_unit say3D "handcuffs";
		_unit SVAR["restrained",true,true];
		[player] remoteExec ["life_fnc_restrain",_unit];
		[0,"STR_NOTF_Restrained",true,[_unit GVAR["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
	} else {
		hint "Du hast keine Handschellen!";
	};
};