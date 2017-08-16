#include <macro.h>
/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/

createDialog "taki_atm_deposit";

CONTROL(27005,2400) ctrlSetStructuredText parseText format["<t color='#000000' t align='center' size='1' shadow='0'>Deposit</t>"];
CONTROL(27005,2401) ctrlSetStructuredText parseText format["<t color='#000000' size='1' shadow='0'>$%1</t>",[BANK] call life_fnc_numberText];
CONTROL(27005,2402) ctrlSetStructuredText parseText format["<t color='#000000' t align='center' size='1' shadow='0'>Amount:</t>"];
CONTROL(27005,2403) ctrlSetStructuredText parseText format["<t color='#000000' size='1' shadow='0'>$%1</t>",[CASH] call life_fnc_numberText];
CONTROL(27005,2404) ctrlSetStructuredText parseText format["<t color='#000000' t align='right' size='1' shadow='0'>Confirm</t>"];
