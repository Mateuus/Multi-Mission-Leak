/*
	File: fn_robAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the robbing process?
*/
private["_target"];
_target = cursorTarget;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

if(_target getVariable["robbed", false]) exitWith {};
_target setVariable["robbed", true, true];

[player] remoteExec ["XY_fnc_robPerson", _target];

if( !([player] call XY_fnc_playerMasked) ) then {
    [getPlayerUID player, "122"] remoteExec ["XY_fnc_wantedAdd", 2];
};