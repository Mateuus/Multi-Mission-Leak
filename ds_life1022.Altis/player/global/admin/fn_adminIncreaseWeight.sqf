/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Increases/resets the weight of a player
*/

private ["_unit","_action"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};

if(_unit getVariable ["weightIncreased",false])then {
	_action = [
		"Are you sure you want to increase this player's carry weight? If you are a moderator you must get approval from an admin to do this.",
		"Increase Carry Weight",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{};

	hint format ["%1's weight has been reset",(name _unit)];
} else {
	_action = [
		"Are you sure you want to reset this player's carry weight? If you are a moderator you must get approval from an admin to do this.",
		"Reset Carry Weight",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{};

	hint format ["%1's weight has been increased",(name _unit)];
};

[true] remoteExecCall ["DS_fnc_increaseWeight",_unit];