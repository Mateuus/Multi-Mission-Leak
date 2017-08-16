#include <macro.h>
/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
disableSerialization;
createDialog "taki_atm_withdraw";

CONTROL(27004,2400) ctrlSetStructuredText parseText format["<t color='#000000' t align='center' size='1' shadow='0'>Withdraw</t>"];
CONTROL(27004,2401) ctrlSetStructuredText parseText format["<t color='#000000' size='1' shadow='0'>$%1</t>",[BANK] call life_fnc_numberText];
CONTROL(27004,2402) ctrlSetStructuredText parseText format["<t color='#000000' t align='center' size='1' shadow='0'>Amount:</t>"];
CONTROL(27004,2403) ctrlSetStructuredText parseText format["<t color='#000000' size='1' shadow='0'>$%1</t>",[CASH] call life_fnc_numberText];
CONTROL(27004,2404) ctrlSetStructuredText parseText format["<t color='#000000' t align='right' size='1' shadow='0'>Confirm</t>"];
