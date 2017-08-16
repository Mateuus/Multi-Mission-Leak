/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Quick kicks the player from the server
*/

private ["_unit","_action","_value","_note"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};

_value = ctrlText 1401;
if(_value == "")exitWith{hint "You have not entered a kick reason"};

_action = [
	format ["Are you sure you want to kick this player for %1",_value],
	"Quick Kick",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(_unit getVariable ["beingKicked",false])exitWith{hint "This player is currently already being kicked";};

if(_value == "")then{_value = "No reason added"};

_note = format ["Quick Kicked for (%1)",_value];

[_value] remoteExec ["DS_fnc_adminQuickKickPlayer",_unit];
[(getPlayerUID _unit),"1",_note,(getPlayerUID player)] remoteExec ["HUNT_fnc_adminNotes",2];
