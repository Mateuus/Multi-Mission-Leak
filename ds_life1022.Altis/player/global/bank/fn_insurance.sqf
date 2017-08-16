/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Buys banking insurance
*/

private ["_balance","_cost","_action"];

if(DS_bankInsurance)exitwith{hint "You already have banking insurance"};

_balance = DS_atmCoin;
_cost = switch(true)do {
	case (_balance > 40000000): {60000};
	case (_balance > 25000000): {50000};
	case (_balance > 15000000): {40000};
	case (_balance > 7500000): {30000};
	case (_balance > 5000000): {20000};
	case (_balance > 2500000): {10000};
	default {500};
};

_action = [
	format ["With your bank balance banking insurance will cost you $%1",[_cost] call DS_fnc_numberText],
	"Price",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

if([_cost,true] call DS_fnc_checkMoney)exitWith{hint "You do not have enough funds in your bank to cover this cost"};
[_cost,true,false] call DS_fnc_handleMoney;

DS_bankInsurance = true;

hint "You have bought banking insurance";
systemChat "You have bought banking insurance";

closeDialog 0;
sleep 0.5;
[] spawn DS_fnc_menuAtm;

if((DS_infoArray select 13) == 5)then {
	[0] call DS_fnc_questCompleted;
};