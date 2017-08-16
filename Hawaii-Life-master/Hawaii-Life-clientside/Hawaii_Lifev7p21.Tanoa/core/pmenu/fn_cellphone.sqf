#include "..\..\script_macros.hpp"
/*
	File: fn_cellphone.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
private["_switch","_display","_units","_type"];
_switch = [_this,0,false,[false]] call BIS_fnc_param;

if (_switch) then {
	disableSerialization;
	waitUntil {!isNull findDisplay 3000};
	_display = findDisplay 3000;
	_cPlayerList = _display displayCtrl 3004;

	ctrlSetText [3003, ""];
	lbClear _cPlayerList;

	if((FETCH_CONST(life_adminlevel) < 1)) then {
		ctrlShow[3020,false];
	};
	{
		if(alive _x) then {
			if(_x != player) then {
				switch (side _x) do {
					case west: {_type = "Cop"};
					case civilian: {_type = "Civ"};
					case independent: {_type = "Med"};
				};
				_cPlayerList lbAdd format["%1 (%2)",_x GVAR ["realname",name _x],_type];
				_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];lbSetColor[3004,(lbSize _cPlayerList)-1,[0.353,0.353,0.353,1]];
			};
		};
	} foreach playableUnits;

	lbSetCurSel [3004,0];
} else {
	if((FETCH_CONST(life_adminlevel) < 1)) then {
		ctrlShow[3021,false];
	};
};