/*
	File: fn_speedtrapAdd.sqf
	Author: Wolfgang Bahmüller

	Description:
	speedtrap is a speedtrap and sometimes a speedtrap

    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!
*/
if(isNil "king_speedtrap") then {king_speedtrap = ObjNull;};

private["_speedtrap","_var_speedtrap","_value_speedtrap"];

if(playerSide != west) exitWith {Hint "Du kannst das nicht benutzen"};
if(vehicle player != player) exitWith {};
if(!isNull king_speedtrap) exitWith {};

_var_speedtrap = ["LHM_Speedtrap",0] call lhm_fnc_varHandle;
_value_speedtrap = missionNamespace getVariable _var_speedtrap;
if(_value_speedtrap <= 0) exitWith {};

_speedtrap = "Land_Runway_PAPI_4" createVehicle (position player);
_speedtrap setpos  (player modelToWorld [0,1,0]);
_speedtrap setDir ([_speedtrap, player] call BIS_fnc_dirTo);
_speedtrap allowdamage false;
_speedtrap attachTo[player,[0,1.5,0.5]];
_speedtrap setDir 180;

lhm_action_speedtrapDeploy = player addAction["Place Speedtrap",{if(!isNull king_speedtrap) then {detach king_speedtrap; king_speedtrap = ObjNull;}; player removeAction lhm_action_speedtrapDeploy; lhm_action_speedtrapDeploy = nil;},"",999,false,false,"",'!isNull king_speedtrap'];
king_speedtrap = _speedtrap;
waitUntil {isNull king_speedtrap};
if(!isNil "lhm_action_speedtrapDeploy") then {player removeAction lhm_action_speedtrapDeploy;};
if(isNull _speedtrap) exitWith {};
_speedtrap setPos [(getPos _speedtrap select 0),(getPos _speedtrap select 1),0];

_speedtrap setVariable ["speedtrap_registered", true, true];
_speedtrap setVariable ["speedtrap_active", true, true];
_speedtrap setVariable ["speedtrap_speedlimit", 50, true];
_speedtrap setVariable ["speedtrap_photos", [], true];

if(!([false,"LHM_Speedtrap",1] call lhm_fnc_handleInv)) exitWith
{
    deleteVehicle _speedtrap;
};

[["", _speedtrap, "Speedtrap", 9999999],"lhm_fnc_addTrackingInfosToPlayers",west,false] call lhm_fnc_mp;

//diag_log format ["::King:: speedtrap id=%1 pos=%2 add...", _speedtrap, position _speedtrap];
