/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens the wanted list
*/

private ["_display","_list","_wantedUids","_wantedPlayers","_index"];

disableSerialization;

closeDialog 0;
createDialog "wantedList";

_display = findDisplay 606606;
_list = _display displayCtrl 2666;

lbClear _list;

_wantedUids = [];
_wantedPlayers = [];

{
	_wantedUids pushBack (_x select 0);
} forEach DS_wantedList;

{
	if(((getPlayerUid _x) in _wantedUids)&&(!((side _x) isEqualTo west))&&(!(_x getVariable ["security",false]))&&(!(_x getVariable ["medic",false]))&&(!(_x getVariable ["mechanic",false])))then {
		_wantedPlayers pushBack (name _x);
	};
} forEach allPlayers;

{
	if((alive _x)&&(name _x in _wantedPlayers))then {
		_index = _list lbAdd format ["%1",name _x];
		_list lbSetData [_index,(_x call BIS_fnc_objectVar)];
	};
} forEach allPlayers;

lbSort [_list,"ASC"];
lbSetCurSel [2666,0];