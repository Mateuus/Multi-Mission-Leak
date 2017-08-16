#include "..\..\script_macros.hpp"
/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorObject;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit GetVariable "restrainedCiv")) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(life_inv_ziptie < 1) exitWith {hint "You need zipties!"};
if((animationState _unit != "Incapacitated")) exitWith { hint "Victim must first be knocked out"; };

_unit setVariable["restrainedCiv",true,true];
[player] remoteExec ["life_fnc_restrainCiv",_unit];
[0,"STR_NOTF_ziptied",true,[_unit GetVariable["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

life_inv_ziptie = life_inv_ziptie - 1;