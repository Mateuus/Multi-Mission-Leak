/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Leaves your current gang
*/

private _action = [
	"Are you sure you want to leave? You wont be able to rejoin the gang unless it is unlocked",
	"Warning!",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

private _group = (group player);
private _gangName = _group getVariable ["gangName",""];

[_group,_gangName,player] remoteExec ["HUNT_fnc_removePlayer",2];
[player] joinSilent (createGroup civilian);

closeDialog 0;
hint "You have left your gang";