#include "..\..\script_macros.hpp"
/*
	file: fn_takeOrgans.sqf
	author: [midgetgrimm] - www.grimmlife.com
	
	taken from the same idea of robbing script by tonic
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //if unit is null, than NO
if((_unit GVAR ["missingOrgan",FALSE])) exitWith {};
if((player GVAR ["hasOrgan",FALSE])) exitWith {};
if(player isEqualTo _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(life_inv_kidney >= 2) exitWith {hint "Nie potrzebujesz tyle!"};
if(!([true,"kidney",1] call life_fnc_handleInv)) exitWith {hint "Nie masz miejsca na ten organ!"};
life_action_inUse = true;
player SVAR["hasOrgan",true,true];
player playMove "AinvPknlMstpSnonWnonDnon_medic";
sleep 3;
_unit SVAR["missingOrgan",true,true];
life_action_inUse = false;
[player] remoteExec ["life_fnc_hasOrgan", _unit]; 