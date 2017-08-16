/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Updates the gang members list
*/

disableSerialization;

private _dialog = findDisplay 666672;
private _gangList = _dialog displayCtrl 1500;
private _memberList = _dialog displayCtrl 1501;
private _index = lbCurSel _gangList;
private _gangName = _gangList lbData _index;

private _group = [_gangName] call DS_civ_gangGetGroup;
if(isNull _group)exitWith{};

lbClear _memberList;

{
	if(isPlayer _x)then {
		_memberList lbAdd (name _x);
	};
} forEach (units _group);