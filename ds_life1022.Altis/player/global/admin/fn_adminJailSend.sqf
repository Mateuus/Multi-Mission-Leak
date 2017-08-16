/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sends target to jail (by admins)
*/

private ["_unit","_action"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};

_action = [
	"Are you sure you want to send this player to jail?",
	"Send to Jail",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

[] remoteExec ["DS_fnc_toJailPlayer",_unit];