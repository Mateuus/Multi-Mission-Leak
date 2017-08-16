#include "..\..\script_macros.hpp"
/*
	Author: Larry

	Description:
	Blast Wall.
*/
if(playerSide isEqualTo independent) exitWith {hint "Du kannst das als THW nicht tun!"};
if(serverTime < 1800) exitWith {hint "Du kannst die Wand erst 30min nach Serverstart sprengen!"};
if({side _x isEqualTo west} count playableUnits < (LIFE_SETTINGS(getNumber,"cops_online_min"))) exitWith {
 	hint format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"cops_online_min"))]
};

private["_wall","_true"];
_true = param [0,false,[false]];
if (_true) then {
	if (playerSide isEqualTo civilian) exitWith {hint "Das kann nur ein Polizist tun!"};
	_wall = fed_wall_0;
} else {
	_wall = fed_wall_1;
};
_action = [_this,2] call BIS_fnc_param;
_wall removeAction _action;

if(_wall GVAR ["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
_wall SVAR ["chargeplaced",true,true];
hint localize "STR_ISTR_Blast_KeepOff";
sleep 10;
_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL _wall select 0, getPosATL _wall select 1, (getPosATL _wall select 2)-2];
sleep 0.5;
deleteVehicle _wall;