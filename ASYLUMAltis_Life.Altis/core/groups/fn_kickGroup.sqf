/*
	File: fn_kickGroup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Kicks the selected player out of the group.
	*Needs revised, complete mess*
*/
private["_dialog","_index","_members","_sel","_user"];
disableSerialization;

_dialog = findDisplay 2620;
_members = _dialog displayCtrl 2621;
_sel = lbCurSel 2621;
_data = _members lbData _sel;
_data = call compile format["%1", _data];

_index = [life_my_group,life_group_list] call life_fnc_index;
if(_index == -1) exitWith {};
if(_data == player) exitWith {hint "You can't kick yourself"};

_gang = life_group_list select _index;
_name = _gang select 0;
_group = _gang select 1;
_locked = _gang select 2;
_owner = _gang select 3;
_ownerID = _gang select 4;

switch (true) do
{
	case (_data == (call compile format["%1",_owner])) :
	{
		life_group_list set [_index,[_name,_group,_locked,str(player),getPlayerUID player]];
		publicVariable "life_group_list";
	};
	
	case ((getPlayerUID _data) == _ownerID) :
	{
		life_group_list set [_index,[_name,_group,_locked,str(player),getPlayerUID player]];
		publicVariable "life_group_list";
	};
};
[[_data,_group], "life_fnc_clientGroupKick",_data,false] spawn BIS_fnc_MP;

[false] spawn life_fnc_groupManagement;