#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Deposits money into the players gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 1) exitWith {};
if(!([str(_value)] call tanoarpg_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > life_atmcash) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};

__SUB__(life_atmcash,_value);
_gFund = grpPlayer getVariable ["gang_bank",0];
_gFund = _gFund + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format[localize "STR_ATM_DepositGang",[_value] call tanoarpg_fnc_numberText];
[] call tanoarpg_fnc_atmMenu;
[6] call XAS_fnc_updatePartial; //Silent Sync
[1,grpPlayer] remoteExec ["TEX_fnc_updateGang", 2, false];
[player, player, _value, "GANGDEPOSITE", life_atmcash, life_cash] remoteExec ["TEX_fnc_handleDBLog", 2];
