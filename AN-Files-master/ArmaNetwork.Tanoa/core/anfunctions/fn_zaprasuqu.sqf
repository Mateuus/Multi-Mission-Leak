/*
	File: fn_zaprasuqu.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
if((lbCurSel 1500) isEqualTo -1) exitWith {hint localize "STR_ATM_NoneSelected"};
_val = parseNumber(ctrlText 1401);
_unit = call compile format["%1",(lbData[1500,(lbCurSel 1500)])];
if(isNull _unit) exitWith {};
if(isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if(_val > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if(_val <= 0) exitwith {};
if(!([str(_val)] call life_fnc_spunetuwada)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > an_bank) exitWith {hint localize "STR_ATM_NotEnough"};
_tax = [_val] call life_fnc_chejafruwet;
if((_val + _tax) > an_bank) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_val,_tax]};
[(_val + _tax),1,1] call life_fnc_sewawruk;
[_val,profileName] remoteExecCall ["life_fnc_jugukupha",_unit];
(findDisplay 2700) displayRemoveAllEventHandlers "KeyDown";
closeDialog 0;
ATMSeach = nil;
_message = format["You've sent %1 with a %2% tax",[_val] call life_fnc_rupadudejat,[_tax] call life_fnc_rupadudejat];
[_message,true,[0,1,0,1]] call life_fnc_notificationHandler;
