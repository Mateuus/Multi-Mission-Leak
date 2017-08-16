#include <macro.h>
private["_value"];
_value = parseNumber(ctrlText 2702);
_gFund = GANG_FUNDS;
if(_value > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > _gFund) exitWith {hint localize "STR_ATM_NotEnoughFundsG"};
if(_value < 100 && _gFund > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.
SUB(_gFund,_value);
argent_liquide = argent_liquide + _value;
grpPlayer SVAR ["gang_bank",_gFund,true];
hint format [localize "STR_ATM_WithdrawSuccessG",[_value] call life_fnc_numberText];
[[player, player, _value, 5, compte_banque, argent_liquide],"TON_fnc_handleDBLog",false] spawn life_fnc_MP; 
[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequest; //Silent Sync
[6] call SOCK_fnc_updatePartial;
[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;