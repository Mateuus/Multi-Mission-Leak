#include <macro.h>
/*
  Author: ArmA.Network
  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private["_gangBank","_gangName"];
disableSerialization;
createDialog "taki_atm_gang";

_gangName = (group player) getVariable "gangName";
_gangBank = (group player) getVariable "gangBank";

CONTROL(27006,2400) ctrlSetStructuredText parseText format["<t color='#000000' t align='center' size='1' shadow='0'>Gang Transactions</t>"];
CONTROL(27006,2401) ctrlSetStructuredText parseText format["<t color='#000000' size='1'>%1</t>",_gangName];
CONTROL(27006,2402) ctrlSetStructuredText parseText format["<t color='#000000' t align='center' size='1' shadow='0'>Amount:</t>"];
CONTROL(27006,2404) ctrlSetStructuredText parseText format["<t color='#000000' size='1'>$%1</t>",[_gangBank] call life_fnc_numberText];
CONTROL(27006,2405) ctrlSetStructuredText parseText format["<t color='#000000' t align='left' size='1' shadow='0'>Withdraw</t>"];
CONTROL(27006,2406) ctrlSetStructuredText parseText format["<t color='#000000' t align='right' size='1' shadow='0'>Deposit</t>"];
