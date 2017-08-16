/*
	file: fn_giveOrgans.sqf
	author: Division-wolf.de
	
	taken from the same idea of robbing script by tonic
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {hint "isnull unit";};
if(!(_unit getVariable ["missingOrgan",false])) exitWith {hint "Es Fehlte keine Niere. Es wurde keine Niere eingesetzt.";};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(!([false,"kidney",1] call DWEV_fnc_handlelnv)) exitWith {hint "Du hast keine Niere dabei";};
DWEV_action_inUse = true;;
player playMove "AinvPknlMstpSnonWnonDnon_medic";
_unit setVariable["missingOrgan",false,true];
DWEV_action_inUse = false;
[1,player] remoteExec ["DWEV_fnc_hasOrgan", _unit];