/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Gives money to a nearby player
*/

private ["_value","_unit","_parsedValue"];

_value = ctrlText 2018;
_parsedValue = (parseNumber(_value));
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "You have not selected anybody";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//Check for people doing stupid things
if(_parsedValue < 1)exitwith{hint "You have not entered a valid amount"};
if(_parsedValue > 999999)exitwith{hint "You can not give more than $999,999 at once"};
if([_parsedValue,false] call DS_fnc_checkMoney)exitwith{hint "You do not have this amount of money"};
if(isNull _unit)exitwith{ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "The selected player is not within range";};
[_parsedValue,false,false] call DS_fnc_handleMoney;
hint format ["You have given %1 $%2",(name _unit),[_parsedValue] call DS_fnc_numberText];

[[_parsedValue,player,(name _unit)],"DS_fnc_getMoney",_unit,false] spawn BIS_fnc_mp;
[] call DS_fnc_compileData;
closeDialog 0;
sleep 0.3;
[] spawn DS_fnc_menuPlayer;























