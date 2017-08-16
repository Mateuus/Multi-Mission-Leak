/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Releases a player from jail
*/

private ["_unit","_action"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};

_action = [
	"Are you sure you want to release this player from jail?",
	"Release from Jail",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

[_unit,true] remoteExec ["DS_civ_releaseme",_unit];