#include <macro.h>
/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens and manages the bank menu.
*/
private["_display","_text","_units","_type"];

if(!lhm_use_atm) exitWith
{
	hint localize "STR_Shop_ATMRobbed";
};

if(!dialog) then
{
	if(!(createDialog "lhm_atm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;

if(side player == civilian) then {
	(getControl(2700,2704)) ctrlEnable true;
} else {
	(getControl(2700,2704)) ctrlEnable false;
};

//if (!isNil "LHM_VAR_ENABLE_ATM_TRANSFER") then {
//	if (LHM_VAR_ENABLE_ATM_TRANSFER) then {
//		(getControl(2700,2704)) ctrlEnable true;
//	};
//};

lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.7' image='core\textures\icons\misc\bank.paa'/> $%1<br/><img size='1.6' image='core\textures\icons\misc\money.paa'/> $%2",[lhm_atmcash] call lhm_fnc_numberText,[lhm_cash] call lhm_fnc_numberText];

{
	if(alive _x) then
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "EMS"};
			case east: {_type = "Sec"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [2703,0];

if(isNil {(grpPlayer getVariable "gang_bank")}) then {
	(getControl(2700,2705)) ctrlEnable false;
};