/*
	File: fn_bankWithdraw.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Withdraws money from the players account
*/
private["_val"];
_val = parseNumber(ctrlText 1401);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val <= 0) exitwith {};
if(!([str(_val)] call life_fnc_spunetuwada)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > an_bank) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && an_bank > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"};
[_val,0,0] call life_fnc_sewawruk;
[_val,1,1] call life_fnc_sewawruk;
(findDisplay 2700) displayRemoveAllEventHandlers "KeyDown";
closeDialog 0;
ATMSeach = nil;
["Withdraw"] call life_fnc_notificationHandler;
