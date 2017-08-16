/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Queries a player
*/

private ["_display","_text","_unit"];

disableSerialization;

_display = findDisplay 2900;
_text = _display displayCtrl 1100;

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if(isNil "_unit")exitWith{_text ctrlSetText "Player no longer exists";};
if(isNull _unit)exitWith{_text ctrlSetText "Query failed (Either you or the players unit is bugged";};

[player] remoteExec ["DS_fnc_playerQuery",_unit];
_text ctrlSetText "Querying...";