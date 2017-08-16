/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens and updates the gang options menu
*/

disableSerialization;

closeDialog 0;
sleep 0.2;
createDialog "gangMenuList";

private _dialog = findDisplay 666672;
private _gangList = _dialog displayCtrl 1500;
private _playerList = _dialog displayCtrl 1501;
private _createBtn = _dialog displayCtrl 2400;
private _joinBtn = _dialog displayCtrl 2401;
private _closeBtn = _dialog displayCtrl 2402;
private _gangs = false;

//Populate the gang list first
lbClear _gangList;

{
	_x params [
		["_gangName","",[""]],
		["_group",grpNull,[grpNull]]
	];

	if(!isNull _group)then {
		private _index = _gangList lbAdd format ["%1",_gangName];
		_gangList lbSetData [_index,_gangName];

		_gangs = true;
	};
} forEach DS_gangList;

if(!_gangs)then {
	_index = _gangList lbAdd "There are currently no gangs";
	_gangList lbSetData [_index,"There are currently no gangs"];
};

_createBtn ctrlSetText "Message Gang";
_createBtn buttonSetAction "[] spawn DS_civ_gangMessage;";
_createBtn ctrlSetTooltip "Message all members of this gang";

_joinBtn ctrlShow false;

_closeBtn ctrlSetText "Close";
_closeBtn buttonSetAction "closeDialog 0;";
_closeBtn ctrlSetTooltip "Close Menu";