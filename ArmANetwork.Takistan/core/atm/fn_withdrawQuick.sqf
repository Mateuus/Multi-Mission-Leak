#include <macro.h>
/*
  Author: ArmA.Network
  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_amount = param [0,0,[0]];

if(_amount > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};

ADD(CASH,_amount);
SUB(BANK,_amount);

hint format [localize "STR_ATM_WithdrawSuccess",[_amount] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
