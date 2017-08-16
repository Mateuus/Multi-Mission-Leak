/*
	File: fn_joinGang.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Joins the selected gang if it is open.
*/
private["_dialog","_sel","_gangs","_gang","_group","_locked"];
disableSerialization;

_dialog = findDisplay 2520;
_gangs = _dialog displayCtrl 2521;
_sel = lbCurSel _gangs;
_data = _gangs lbData _sel;

_index = [_data,EMonkeys_gang_list] call TON_fnc_index;
if(_index == -1) exitWith {hint "Gang nicht gefunden"};
_gang = EMonkeys_gang_list select _index;
_group = _gang select 1;
_locked = _gang select 2;

if(!isNull _group) then
{
	if(!_locked) then
	{
		[player] join _group;
		eM_my_gang = _group;
		hint format["Du bist der Gang %1 beigetreten",_gang select 0];
		
		closeDialog 0;
	}
		else
	{
		hint "Diese Gang ist gesperrt!";
	};
}
	else
{
	hint "Gang is not valid";
};