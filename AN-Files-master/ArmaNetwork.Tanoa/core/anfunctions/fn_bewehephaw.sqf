#include <macro.h>
/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = parseNumber(ctrlText 1401);
if((lbCurSel 2101) isEqualTo -1) exitWith {hintSilent "No one was selected!";};
_unit = lbData [2101,lbCurSel 2101];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {closeDialog 0;};
if(_unit isEqualTo player) exitWith {closeDialog 0;};
if(isNull _unit) exitWith {closeDialog 0;};
if(!life_use_atm) exitWith {closeDialog 0; hintSilent "You recently robbed the bank! You can't give money away just yet.";};
if(!([str(_amount)] call life_fnc_spunetuwada)) exitWith {closeDialog 0; hintSilent "You didn't enter an actual number format.";};
if(_amount <= 0) exitWith {closeDialog 0; hintSilent "You need to enter an actual amount you want to give.";};
if(_amount > an_cash) exitWith {closeDialog 0; hintSilent "You don't have that much to give!";};
hintSilent format["You gave $%1 to %2",[_amount] call life_fnc_rupadudejat,_unit getVariable["realname",name _unit]];
[_amount,0,1] call life_fnc_sewawruk;
[_unit,_amount,player] remoteExecCall ["life_fnc_quthuvawruf",_unit];
[] call life_fnc_p_updateMenu;
