#include "..\..\macros.hpp"
/*
	file: fn_takeOrgans.sqf
	author: [midgetgrimm]
	
	taken from the same idea of robbing script by tonic
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};
if((_unit getVariable ["missingOrgan",FALSE])) exitWith {};
if((player getVariable ["hasOrgan",FALSE])) exitWith {};
if((animationState _unit != "Incapacitated")) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(!([false,"skalpell",1] call DWEV_fnc_handlelnv)) exitWith {hint "Du hast kein Skalpell"};
if(DWEV_inv_kidney >= 1) exitWith {hint "Du kannst nicht mehr als 1 Nieren Tragen"};
if(!([true,"kidney",1] call DWEV_fnc_handlelnv)) exitWith {hint "Dein Inventar ist Voll, daher kannst du nicht noch eine Niere nehmen."};
DWEV_action_inUse = true;
player setVariable["hasOrgan",true,true];
player playMove "AinvPknlMstpSnonWnonDnon_medic";
_unit setVariable["missingOrgan",true,true];
[getPlayerUID _unit,1, side _unit] remoteExec ["DWF_fnc_saveCombatlog",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Den Flag aus der Datenbank Löschen
DWEV_action_inUse = false;
[0,player] remoteExec ["DWEV_fnc_hasOrgan", _unit]; // Kein remoteExec