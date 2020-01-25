#include <macro.h>
/*
	File: fn_atmMenu.sqf
	
	
	Description:
	Opens and manages the bank menu.
*/
private["_display","_text","_units","_type"];

if(!life_use_atm) exitWith
{
	[localize "STR_Shop_ATMRobbed", false] spawn domsg;
};

if(!dialog) then
{
	if(!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;

lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.7' image='\cg_sndimg\icons\bank.paa'/> $%1<br/><img size='1.6' image='\cg_sndimg\icons\money.paa'/> $%2",[cash_in_bank] call life_fnc_numberText,[cash_in_hand] call life_fnc_numberText];

{
	if(!(_x getVariable["dead",FALSE])) then
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case east: {_type = "Civ"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "EMS"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [2703,0];

if(isNil {(grpPlayer getVariable "gang_bank")}) then {
	(getControl(2700,2705)) ctrlEnable false;
};