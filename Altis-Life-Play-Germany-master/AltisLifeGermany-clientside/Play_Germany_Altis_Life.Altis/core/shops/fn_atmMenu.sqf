#include <macro.h>
/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens and manages the bank menu.
*/
private["_units","_type"];

if(!life_use_atm) exitWith {
	hint localize "STR_Shop_ATMRobbed";
};

if(!dialog) then {
	if(!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;
_units = CONTROL(2700,2703);

lbClear _units;
CONTROL(2700,2701) ctrlSetStructuredText parseText format["<img size='1.7' image='icons\bank.paa'/> $%1<br/><img size='1.6' image='icons\money.paa'/> $%2",[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];

{
	_name = _x GVAR ["realname",name _x];
	if(alive _x && (!(EQUAL(_name,profileName)))) then {
		switch (side _x) do {
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "Medic"};
            case east: {_type = "ASF"};
		};
		_units lbAdd format["%1 (%2)",_x GVAR ["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [2703,0];

if(isNil {(grpPlayer GVAR "gang_bank")}) then {
	(CONTROL(2700,2705)) ctrlEnable false;
};

if(PG_atmMonitoring) exitWith {};
PG_atmMonitoring = true;
waitUntil{!isNull (findDisplay 2700)};
waitUntil {sleep 1; isNull (findDisplay 2700)};
[6] call SOCK_fnc_updatePartial;
PG_atmMonitoring = false;
