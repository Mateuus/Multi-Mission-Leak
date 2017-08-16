/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Locks or unlocks the player's gang
*/

private _gang = (group player);

if(_gang getVariable ["gangLocked",false])then {
	private _action = [
		"Unlocking your gang allows anybody to join, continue?",
		"Warning!",
		"Continue",
		"No Thanks"
	] call BIS_fnc_guiMessage;
	if(!_action)exitWith{};

	_gang setVariable ["gangLocked",false,true];
	hint "Your gang has been unlocked";
} else {
	_gang setVariable ["gangLocked",true,true];
	hint "Your gang has been locked";
};