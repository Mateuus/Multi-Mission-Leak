#include <macro.h>

/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
if(!life_use_atm) exitWith {
	hint localize "STR_Shop_ATMRobbed";
};

if(!dialog) then {
	if(!(createDialog "taki_atm_menu")) exitWith {};
};

disableSerialization;
CONTROL(2700,2400) ctrlSetStructuredText parseText format["<t color='#000000' t align='center' size='1' shadow='0'>Welcome to the Takistan National Bank</t>"];
CONTROL(2700,2411) ctrlSetStructuredText parseText format["<t color='#000000' t align='left' size='1' shadow='0'>Quick Deposit</t>"];
CONTROL(2700,2412) ctrlSetStructuredText parseText format["<t color='#000000' t align='left' size='1' shadow='0'>Deposit</t>"];
CONTROL(2700,2413) ctrlSetStructuredText parseText format["<t color='#000000' t align='left' size='1' shadow='0'>Gang Transactions</t>"];
CONTROL(2700,2414) ctrlSetStructuredText parseText format["<t color='#000000' t align='left' size='1' shadow='0'>Transaction Log</t>"];
CONTROL(2700,2415) ctrlSetStructuredText parseText format["<t color='#000000' t align='right' size='1' shadow='0'>Wire Transfer</t>"];
CONTROL(2700,2401) ctrlSetStructuredText parseText format["<t color='#000000' t align='right' size='1' shadow='0'>Quick Withdraw</t>"];
CONTROL(2700,2416) ctrlSetStructuredText parseText format["<t color='#000000' t align='right' size='1' shadow='0'>Withdraw</t>"];
CONTROL(2700,2417) ctrlSetStructuredText parseText format["<t color='#000000' t align='right' size='1' shadow='0'>Insurance Plans</t>"];
if(isNil {(grpPlayer GVAR "gangBank")}) then {
	(CONTROL(2700,2407)) ctrlShow false;
};
