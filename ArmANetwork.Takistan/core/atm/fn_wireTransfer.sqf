#include <macro.h>

/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/

private ["_people","_name","_type"];
disableSerialization;

createDialog "taki_atm_wire";

_people = CONTROL(27001,2100);
CONTROL(27001,2400) ctrlSetStructuredText parseText format["<t color='#000000' t align='center' size='1' shadow='0'>Wire Transfer</t>"];
CONTROL(27001,2401) ctrlSetStructuredText parseText format["<t color='#000000'>$%1</t>",[BANK] call life_fnc_numberText];
CONTROL(27001,2402) ctrlSetStructuredText parseText format["<t color='#000000'>$%1</t>",[CASH] call life_fnc_numberText];
CONTROL(27001,2403) ctrlSetStructuredText parseText format["<t color='#000000' t align='right' size='1' shadow='0'>Confirm</t>"];
CONTROL(27001,2411) ctrlSetStructuredText parseText format["<t color='#000000' t align='center' size='1' shadow='0'>Amount:</t>"];
CONTROL(27001,2412) ctrlSetStructuredText parseText format["<t color='#000000' t align='center' size='1' shadow='0'>To:</t>"];

lbClear _people;

{
	_name = _x GVAR ["realname",name _x];
	if(alive _x && (!(EQUAL(_name,profileName)))) then {
		switch (side _x) do {
			case west: {_type = "TSF/UN"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "EMS"};
		};
		_people lbAdd format["%1 (%2)",_x GVAR ["realname",name _x],_type];
		_people lbSetData [(lbSize _people)-1,str(_x)];
	};
} forEach playableUnits;

lbSetCurSel [2100,0];
