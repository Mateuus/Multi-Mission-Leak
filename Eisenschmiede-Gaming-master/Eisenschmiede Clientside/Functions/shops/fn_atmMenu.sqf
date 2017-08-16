#include "..\script_macros.hpp"
/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens and manages the bank menu.
*/
private["_units","_type","_gangBank"];

if(!ES_use_atm) exitWith {
	hint localize "STR_Shop_ATMRobbed";
};

if(ES_ATMhacked == 1) exitWith { hint format["Da die Zentralbank gehakt wurde, steht dieser Service im Moment nicht zur Verfügung"]; };

if(!dialog) then {
	if(!(createDialog "ES_atm_management")) exitWith {};
};

disableSerialization;
_units = CONTROL(2700,2703);

_gangBank = group player getVariable ["gang_bank",0];

lbClear _units;
CONTROL(2700,2701) ctrlSetStructuredText parseText format["<img size='1.7' image='Images\Icons\bank.paa'/> $%1<br/><img size='1.6' image='Images\Icons\money.paa'/> $%2<br/><br/>Gang:<br/><img size='1.7' image='Images\Icons\bank.paa'/> %3",[ES_atmbank] call ES_fnc_numberText,[ES_cash] call ES_fnc_numberText,[_gangBank] call ES_fnc_numberText];

{
	_name = _x getVariable ["realname",name _x];
	if(alive _x && (!(EQUAL(_name,profileName)))) then {
		switch (side _x) do {
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "EMS"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable ["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [2703,0];

if(isNil {(group player getVariable "gang_bank")}) then {
	(CONTROL(2700,2705)) ctrlEnable false;
	(CONTROL(2700,9999)) ctrlEnable false;
};