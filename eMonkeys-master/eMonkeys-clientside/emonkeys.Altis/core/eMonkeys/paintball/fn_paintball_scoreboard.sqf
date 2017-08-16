/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
	e-monkeys.com
*/


if(!dialog) then
{
	if(!(createDialog "paintball_scoreboard")) exitWith {};
};

disableSerialization;


_display = findDisplay 2900;
if(isNull _display) exitWith {};
_names = _display displayCtrl 1100;
_kills = _display displayCtrl 1101;
_deads = _display displayCtrl 1102;

//1100 name
//1101 kills
//1102 deads
lbClear 1100;
lbClear 1101;
lbClear 1102;
_list = "";
_list1 = "";
_list2 = "";



{
	_paintballk = _x select 0;
	_paintballd = _x select 1;
	_name = _x select 2;

		_list = _list + format["<t align='left' size='1'>%1</t><br/>",_name];
		_list1 = _list1 + format["<t align='left' size='1' color='#00FF00'>  %1</t><br/>",_paintballk];
		_list2 = _list2 + format["<t align='left' size='1' color='#F90F0F'>  %1</t><br/>",_paintballd];
} foreach eM_paintball_stats;


_names ctrlSetStructuredText parseText format["%1",_list];
_kills ctrlSetStructuredText parseText format["%1",_list1];
_deads ctrlSetStructuredText parseText format["%1",_list2];
