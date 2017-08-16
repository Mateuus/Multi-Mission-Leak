/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens the compensation menu for a target player
*/

private ["_unit","_exit","_action"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};

[] spawn {
	_exit = false;
	if(DS_adminLevel < 3)then {
		_action = [
			"Before using the menu you must have the permission of an admin or above",
			"Warning for Mods",
			"Understood",
			"Cancel"
		] call BIS_fnc_guiMessage;
		if(!_action)exitWith{_exit = true};
	};
	if(_exit)exitWith{closeDialog 0;};
};

DS_cmUnit = _unit;
[] spawn DS_fnc_cmMain;