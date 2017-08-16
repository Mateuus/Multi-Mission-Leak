#include "..\..\script_macros.hpp"
/*
	File: fn_bankMenu.sqf
	Author: Larry
	License: Only Hawaii-life.net is allowed to use this Script
*/
private["_near","_near_units","_mstatus","_mstatusBank","_mstatusCash","_total"];
disableSerialization;

_near = CONTROL(7124,2022);
_mstatus = CONTROL(7124,2015);
_mstatusBank = CONTROL(7124,2016);
_mstatusCash = CONTROL(7124,2017);
lbClear _near;

//Near players
_near_units = [];
{ if(player distance _x < 10) then {_near_units pushBack _x};} foreach playableUnits;
{
	if(!isNull _x) then {
		if(alive _x) then {
			if(player distance _x < 10) then {
				if(_x != player) then {
					_near lbAdd format["%1 - %2",_x GVAR ["realname",name _x], side _x];
					_near lbSetData [(lbSize _near)-1,str(_x)];lbSetColor[2022,(lbSize _near)-1,[0.353,0.353,0.353,1]];
				};
			};
		};
	};
} foreach _near_units;

_total = BANK + CASH;
_mstatus ctrlSetStructuredText parseText format["<t color='#5A5A5A' align='center' size='1px'>$ %1",[_total] call life_fnc_numberText];
_mstatusBank ctrlSetStructuredText parseText format["<t color='#5A5A5A' size='1px'>$ %1",[BANK] call life_fnc_numberText];
_mstatusCash ctrlSetStructuredText parseText format["<t color='#5A5A5A' size='1px'>$ %1",[CASH] call life_fnc_numberText];