#include "..\..\script_macros.hpp"
/*
	File: fn_medicInteractionMenu.sqf
	Author: BlackScaryZ

	Description:
	Nouvel fonction médic (Injecter de la morphine)
*/
private["_unit","_player"];
_unit = param [0,ObjNull,[ObjNull]];
_player = param [1,ObjNull,[ObjNull]];

//Encore un check on ne sait jamais ^^
if(isNull _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(speed _unit > 1) exitWith {hint "Il bouge trop";};

//Go
if(life_inv_morphine != 0) then {
	_player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	[] remoteExec ["life_fnc_morphine",_unit];
} else {hint "Il vous faut de la morphine";};
