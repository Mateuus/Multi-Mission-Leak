#include "..\..\script_macros.hpp"
/*
	File: fn_vAH_select.sqf
	Author: Fresqo
	Description: mainly to restrict duping, cant remember what it does but it works
*/
disableSerialization;
private["_control","_index","_data","_shoppe","_cnt","_id","_units"];
_control = SEL(_this,0);
_index = SEL(_this,1);
_data = _control lbData _index; _data = call compile format["%1",_data];
_cnt = count _data;
_units = [];
if (EQUAL(_cnt,1)) exitWith {};
switch (_cnt) do {
	case 5: {_id = SEL(_data,4)};
	case 7: {_id = SEL(_data,0)};
	default {_id = 0};
};

if (_id != 0) then 
{
{if (_x GVAR ["ahID",0] == _id) then {_units pushBack _x};}forEach playableUnits;

	if (count _units == 0) then 
	{
		player SVAR ["ahID",_id,true];
		SVAR_MNS [format["ahItem_%1",_id],true,true];
	}

};

waitUntil{isNull (findDisplay 15600) && isNull (findDisplay 15100) OR (player GVAR["ahID",0] != _id)};
SVAR_MNS [format["ahItem_%1",_id],false,true];