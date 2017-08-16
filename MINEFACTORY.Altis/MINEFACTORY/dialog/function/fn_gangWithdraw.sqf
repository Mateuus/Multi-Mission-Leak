#include "..\..\..\script_macros.hpp"
/*
	File: fn_gangWithdraw.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Withdraws money from the gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);
_gFund = GANG_FUNDS;
grpPlayer setVariable["gbank_in_use_by",player,true];

//Series of stupid checks
if(_value > 999999) exitWith {hint  "AbhebenMax";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint  "Die eingegebene Zahl ist keine richtige Zahl"};
if(_value > _gFund) exitWith {hint  "Du hast nicht so viel Geld auf deinem Bankkonto!G"};
if(_val < 100 && _gFund > 20000000) exitWith {hint  "AbhebenMin"}; //Temp fix for something.
if((grpPlayer getVariable ["gbank_in_use_by",player]) != player) exitWith {hint  "AbhebenInUseG"}; //Check if it's in use.

SUB(_gFund,_value);
ADD(CASH,_value);
grpPlayer setVariable ["gang_bank",_gFund,true];

if(life_HC_isActive) then {
	[1,grpPlayer] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
} else {
	[1,grpPlayer] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
};


hint format [ "AbhebenSuccessG",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
