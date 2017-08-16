#include "..\script_macros.hpp"
/*
	File: fn_cellphone.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
private["_display","_units","_name","_playableUnits","_playableUnitsName","_realName","_type","_Sorted"];

disableSerialization;
waitUntil {!isNull findDisplay 3000};
_display = findDisplay 3000;
_units = _display displayCtrl 3004;

ctrlSetText [3003, ""];
lbClear _units;

if((FETCH_CONST(ES_adminlevel) < 1)) then {
	ctrlShow[3020,false];
	ctrlShow[3021,false];
};

_playableUnits = [];
_playableUnitsName = [];
_name = "";
_realName = "";
_type = "";

{
	if (alive _x) then {
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "Med"};
		};
		_playableUnits pushBack [name _x, _x getVariable["realname",name _x],_type, _x];
		_playableUnitsName pushBack (name _x);
	};
} foreach playableUnits;

_Sorted = _playableUnitsName call BIS_fnc_sortAlphabetically;

{
	_indexUnits = [_x,_playableUnits] call ES_fnc_index;
	if(_indexUnits != -1) then {
		_name = (_playableUnits select _indexUnits) select 0;
		_realName = (_playableUnits select _indexUnits) select 1;
		_type = (_playableUnits select _indexUnits) select 2;
		_unit = (_playableUnits select _indexUnits) select 3;

		_units lbAdd format["%1",_realName];
		_units lbSetData [(lbSize _units)-1,str(_unit)];
	};
} foreach _Sorted;

if (_Sorted isEqualTo []) exitWith {
	_units lbAdd localize "STR_no_player_online";
	_units lbSetdata [(lbSize _units)-1,"Null"];
};

lbSetCurSel [3004,0];