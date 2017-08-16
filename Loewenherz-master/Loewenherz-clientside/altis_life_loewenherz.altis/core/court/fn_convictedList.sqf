
/*
	File: fn_convictedList.sqf
	Author: Blackd0g

	Description:
	Displays convicted crimes
*/
private ["_info","_display","_list","_entry","_header","_crimes","_mylist","_crime","_text"];
_info = param [0,[],[[]]];
_convicted = param [1,"",[""]];
_header = format ["Strafdelikte von %1",((_info select 0) select 0)];
_crimes = ((_info select 0) select 2);

if(count _info == 0) then {
_header = format ["Strafdelikte von %1",_convicted];
_list = format["Es konnten keine Straftaten festgestellt werden"];
} else {

_list = [];
_mylist = [];

{
	_crime = _x;
	if(!(_crime in _mylist)) then
	{
		_text = format["%1 x %2",{_x == _crime} count _crimes,_crime];
		_mylist pushBack _crime;
		_list pushBack _text;
	};

} foreach _crimes;

};

sleep 0.1;
_header hintC _list;
