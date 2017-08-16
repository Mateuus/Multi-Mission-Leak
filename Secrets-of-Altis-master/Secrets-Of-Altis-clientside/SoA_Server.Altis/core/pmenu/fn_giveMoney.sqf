#include <macro.h>
/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 1010;
ctrlShow[1008,false];
if((lbCurSel 1009) == -1) exitWith {hint "Du hast nichts ausgewählt!";ctrlShow[1008,true];};
_unit = lbData [1009,lbCurSel 1009];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[1008,true];};
if(_unit == player) exitWith {ctrlShow[1008,true];};
if(isNull _unit) exitWith {ctrlShow[1008,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "Du hast gerade die Bank ausgeraubt, du kannst jetzt kein Geld vergeben.";ctrlShow[1008,true];};
if(!([_amount] call SOA_fnc_isnumber)) exitWith {hint "Du hast keine Ziffer eingegeben.";ctrlShow[1008,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "Du musst schon einen Wert eingeben.";ctrlShow[1008,true];};
if(parseNumber(_amount) > life_beatgeld) exitWith {hint "Du hast nicht so viel Geld!";ctrlShow[1008,true];};
if(isNull _unit) exitWith {ctrlShow[1008,true];};
if(isNil "_unit") exitWith {ctrlShow[1008,true]; hint "Der Spieler ist nicht in Reichweite!";};
hint format["Du hast %1€ vergeben.",[(parseNumber(_amount))] call life_fnc_numberText];
life_beatgeld = life_beatgeld - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[_unit,_amount,player] remoteExecCall ["life_fnc_receiveMoney",_unit];
[] call life_fnc_UpdateMarketView;

ctrlShow[1008,true];

[[(parseNumber(_amount))] call life_fnc_numberText, player getVariable["realname",name player], _unit getVariable["realname",name _unit],0] remoteExecCall ["life_fnc_logDat",2];