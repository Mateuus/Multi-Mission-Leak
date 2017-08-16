/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Gives money to a nearby player
*/

private ["_value","_parsedValue","_unit"];

_value = ctrlText 2018;
_parsedValue = (parseNumber (_value));

ctrlShow [2001,false];

if((lbCurSel 2022) isEqualTo -1)exitWith{hint "You have not selected anybody";ctrlShow[2001,true];};

_unit = lbData [2022,lbCurSel 2022];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{ctrlShow[2001,true];};

//Check for people doing stupid things
if(_parsedValue < 1)exitWith{hint "You have not entered a valid amount"};
if(_parsedValue > 999999)exitWith{hint "You can not give more than $999,999 at once"};
if([_parsedValue,false] call DS_fnc_checkMoney)exitWith{hint "You do not have this amount of money"};

[_parsedValue,false,false] call DS_fnc_handleMoney;
hint format ["You have given %1 $%2",(name _unit),[_parsedValue] call DS_fnc_numberText];

[_parsedValue,player] remoteExec ["DS_fnc_getMoney",_unit];
[] call DS_fnc_compileData;
closeDialog 0;
sleep 0.3;
[] spawn DS_fnc_menuPlayer;