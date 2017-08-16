/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Allows the player to break NLR
*/

private ["_unit","_action","_targets"];

if((DS_adminLevel != 1)&&(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};

_action = [
    "Are you sure you want to remove this player's NLR?",
    "Remove NLR",
    "Yes",
    "No"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

{
    DS_nlr_time = 0;
    sleep 0.1;
    hint "An admin has removed your NLR timer and allowed you to enter your NLR zone";
} remoteExec ["BIS_fnc_call",_unit];

hint format ["You have removed %1's NLR timer",(name _unit)];

_alert = format ["%1 has removed %2's NLR timer",(name player),(name _unit)];
_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
[0,_alert] remoteExecCall ["DS_fnc_globalMessage",_targets];