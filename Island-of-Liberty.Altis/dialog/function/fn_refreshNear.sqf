/*
	File: fn_refreshNear.sqf
	Author: RafiQuak for PlayGermany
	
	Desc: Refreshes the box containing the nearest players
*/
private["_dialog","_near","_near_units"];
disableSerialization;
_near_units = [];

{ if((player distance _x < 20) && {(_x in life_knownPersons)||(side _x == independent)||(_x in (units group player))}) then {_near_units pushBack _x};} foreach playableUnits;

_dialog = findDisplay 2001;
_near_m = _dialog displayCtrl 2022;
_near_i = _dialog displayCtrl 2023;
lbClear _near_m;
lbClear _near_i;

{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then {
		_near_i lbAdd format["%1",_x getVariable["realname",name _x]];
		_near_i lbSetData [(lbSize _near_i)-1,str(_x)];
		_near_m lbAdd format["%1",_x getVariable["realname",name _x]];
		_near_m lbSetData [(lbSize _near_m)-1,str(_x)];
	};
} foreach _near_units;