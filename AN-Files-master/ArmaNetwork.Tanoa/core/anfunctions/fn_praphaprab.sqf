/*
	File: fn_robAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the robbing process?
*/
private["_target"];
_target = cursorObject;
//Error checks
if(isNull _target OR {!isPlayer _target}) exitWith {};
if(_target getVariable["robbed",false]) exitWith {};
[player] remoteExecCall ["life_fnc_kakeswanas",_target];
_target setVariable["robbed",TRUE,TRUE];
