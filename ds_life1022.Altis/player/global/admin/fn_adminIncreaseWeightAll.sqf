/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Increases the carry weight of all players
*/

private ["_action"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

_action = [
	"Are you sure you want to increase everyone's carry weight? Only do this right before a restart so people can process etc faster.",
	"Increase Carry Weight",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

[] remoteExecCall ["DS_fnc_increaseWeight",-2];

hint "All player's weights have been increased";