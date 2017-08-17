/*
    Author: !TS JORDAN
    File Name: fn_JailBreakHandle.sqf
*/

params [
	["_prisonvault", objNull, [objNull]],
	["_prisonvaultVariables", objNull, [objNull]]
];
private ["_bomb","_time"];
_time = time + (60 * 7);
waitUntil{(round(_time - time) < 1)};
sleep 0.9;
if (!(_prisonvaultVariables getVariable["pchargeplaced",false])) exitWith {};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL _prisonvault select 0, getPosATL _prisonvault select 1, (getPosATL _prisonvault select 2)+0.5];
_prisonvaultVariables setVariable ["pchargeplaced",false,true];
_prisonvaultVariables setVariable ["prison_open",true,true];
[_prisonvault, _prisonvaultVariables] remoteExec ["life_fnc_JailBreakRemove", 2];

