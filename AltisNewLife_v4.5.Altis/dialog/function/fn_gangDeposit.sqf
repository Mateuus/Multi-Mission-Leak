#include <macro.h>
private["_value"];
_value = parseNumber(ctrlText 2702);
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > compte_banque) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};
SUB(compte_banque,_value);
_gFund = GANG_FUNDS;
ADD(_gFund,_value);
grpPlayer SVAR ["gang_bank",_gFund,true];
hint format[localize "STR_ATM_DepositGang",[_value] call life_fnc_numberText];
[[player, player, _value, 6, compte_banque, argent_liquide],"TON_fnc_handleDBLog",false] spawn life_fnc_MP; 
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync
[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;