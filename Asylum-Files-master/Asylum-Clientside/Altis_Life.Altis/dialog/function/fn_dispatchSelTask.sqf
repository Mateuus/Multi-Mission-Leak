/*
	File: fn_dispatchSelTask.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Player has selected a task for dispatch dispatch.
	Please ask for permission to use this and stop stealing my stuff.
*/

disableSerialization;

private ["_task","_taskList"];

if (isNull (findDisplay 39500)) exitWith {};
if (playerSide != west) exitWith {};

ctrlEnable [39512, false];
ctrlEnable [39520, false];
ctrlEnable [39522, false];
ctrlEnable [39526, false];
ctrlEnable [39528, false];

_taskList = (findDisplay 39500) displayCtrl 39514;
_feed = (findDisplay 39500) displayCtrl 39524;

if ((lbCurSel 39514) < 0) exitWith { _feed ctrlSetStructuredText parseText "Feed Disconnected."; };
if ((lbCurSel 39510) > -1) then { ctrlEnable [39512, true] };
ctrlEnable [39526, true];

_task = call compile (_taskList lbData (lbCurSel 39514));
ctrlEnable [39522, ((_task select 6) != "")];
ctrlEnable [39528, ((_task select 6) != "")];
ctrlEnable [39520, (count (_task select 4) > 0) ];

[(findDisplay 39500) displayCtrl 39501, 1, 0.1, _task select 5] call life_fnc_setMapPosition;
_feed ctrlSetStructuredText parseText (_task select 1);

_label = "911 Add Chan";
_unit = objNull;
if ((_task select 6) != "") then
{
	{ if (getPlayerUID _x == (_task select 6)) then { _unit = _x; } } forEach allPlayers;
};
if (!isNull _unit && (getPlayerUID _unit) in life_dispatchUsers) then { _label = "911 Rem Chan" };
((findDisplay 39500) displayCtrl 39528) ctrlSetText _label;