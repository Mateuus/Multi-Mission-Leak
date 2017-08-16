/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Figure it out.
*/
private _value = parseNumber(ctrlText 1401);
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value <= 0) exitWith {};
if(!([str(_value)] call life_fnc_spunetuwada)) exitWith {hintSilent localize "STR_ATM_notnumeric"};
if(_value > an_cash) exitWith {hint localize "STR_ATM_NotEnoughCash"};
[_value,0,1] call life_fnc_sewawruk;
[_value,1,0] call life_fnc_sewawruk;
(findDisplay 2700) displayRemoveAllEventHandlers "KeyDown";
closeDialog 0;
ATMSeach = nil;
private _message = format ["You've deposited $%1",[_value] call life_fnc_rupadudejat];
[_message,true,[0,1,0,1]] call life_fnc_notificationHandler;
[6] call life_fnc_maphuwres;
