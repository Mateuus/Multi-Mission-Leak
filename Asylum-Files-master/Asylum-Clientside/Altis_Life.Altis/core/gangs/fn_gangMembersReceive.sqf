/*
	File: fn_gangMembersReceive.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Player received initial listing of own gang members from server
*/

private["_members","_dialog","_list"];

_members = _this;

if(isNil "_members") exitWith {};
if(typeName _members == "STRING") exitWith {};
if(count _members == 0) exitWith {};

disableSerialization;

if (isNull (findDisplay 9620)) exitWith {};

if (life_gang_rank < 3) then
{
	ctrlEnable [9622, true];
	ctrlEnable [9624, true];
	ctrlEnable [9625, true];
	ctrlEnable [9630, true];
	if (life_gang_rank < 2) then {
		ctrlEnable [1337, true];
	};
};

_dialog = findDisplay 9620;
_list = _dialog displayCtrl 9621;
lbClear _list;

{
	_list lbAdd format["%1 [%2]",(_x select 1), (_x select 2)];
	_list lbSetData [(lbSize _list)-1, str([(_x select 0),parseNumber(_x select 2)])];
} foreach _members;

lbSetCurSel [9621, 0];