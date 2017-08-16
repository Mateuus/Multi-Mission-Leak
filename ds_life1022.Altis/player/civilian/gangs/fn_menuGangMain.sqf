/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens and updates the main gang menu (Menu you see when you are in a gang)
*/

closeDialog 0;
createDialog "gangMenuMain";

disableSerialization;

private _dialog = findDisplay 666674;
private _playerList = _dialog displayCtrl 1500;
private _unlockBtn = _dialog displayCtrl 2400;
private _kickBtn = _dialog displayCtrl 2401;
private _leaveBtn = _dialog displayCtrl 2403;
private _closeBtn = _dialog displayCtrl 2402;
private _optionsButton = _dialog displayCtrl 2407;
private _title = _dialog displayCtrl 1100;
private _areasHeld = _dialog displayCtrl 1101;

//Add members to the listbox
lbClear _playerList;

{
	if(isPlayer _x)then {
		private _index = _playerList lbAdd format ["%1",(_x getVariable["name",name _x])];
		_playerList lbSetData [_index,(_x call BIS_fnc_objectVar)];
	};
} forEach (units (group player));

//Gang Title
_title ctrlSetStructuredText parseText format ["<t size='1' color='#848484'>%1</t>",(group player) getVariable "gangName"];

//Disabled till set Up
private _gangAreas = [] call DS_civ_returnAreas;
if((_gangAreas select 1) isEqualTo "No hideouts currently held")then {
	_gangAreas = "No areas held";
} else {
	_gangAreas = (_gangAreas select 1);
};

_areasHeld ctrlSetStructuredText parseText format ["<t size='1' color='#848484'>%1</t>",_gangAreas];

_unlockBtn ctrlSetText "Lock/Unlock";
_unlockBtn buttonSetAction "[] spawn DS_civ_gangLock;";
_unlockBtn ctrlSetTooltip "Unlock or lock your gang to allow or prevent people from joining it";

_kickBtn ctrlSetText "Kick Player";
_kickBtn buttonSetAction "[] spawn DS_civ_gangKick;";
_kickBtn ctrlSetTooltip "Kick the selected player from your gang, when the last player is kicked the gang is disbanded";

_leaveBtn ctrlSetText "Leave";
_leaveBtn buttonSetAction "[] spawn DS_civ_gangLeave;";
_leaveBtn ctrlSetTooltip "Leave the gang";

_optionsButton ctrlSetText "Gang Options";
_optionsButton buttonSetAction "[] spawn DS_civ_gangOptions;";
_optionsButton ctrlSetTooltip "Opens a menu of gang related controls";

_closeBtn ctrlSetText "Close";
_closeBtn buttonSetAction "closeDialog 0;";
_closeBtn ctrlSetTooltip "Close Menu";