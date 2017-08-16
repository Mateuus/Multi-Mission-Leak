#include "..\..\script_macros.hpp"
/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens and manages the bank menu.
*/
private["_units","_type"];

if(!life_use_atm) exitWith {
	hint format [ "Da du die Bank ausgeraubt hast, kannst du für %1 Minuten keine Bankomaten benutzen.",(LIFE_SETTINGS(getNumber,"noatm_timer"))];
};

if(!dialog) then {
	if(!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;
_units = CONTROL(2700,2703);
_bar = [CASH] call life_fnc_numberText;
_atm = [BANK] call life_fnc_numberText;
ctrlSetText[1000,Format["%1",_atm]];
ctrlSetText[1001,Format["%1",_bar]];

lbClear _units;
{
	_name = _x GVAR ["realname",name _x];
	if(alive _x && (!(EQUAL(_name,profileName)))) then {
		switch (side _x) do {
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "EMS"};
		};
		_units lbAdd format["%1 (%2)",_x GVAR ["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [2703,0];

if(isNil {(grpPlayer GVAR "gang_bank")}) then {
	(CONTROL(2700,2705)) ctrlEnable false;
	(CONTROL(2700,2706)) ctrlEnable false;
};
