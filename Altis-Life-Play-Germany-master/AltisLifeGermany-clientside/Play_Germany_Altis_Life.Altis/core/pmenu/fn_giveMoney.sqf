#include <macro.h>
/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "Du hast niemanden ausgewählt!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "Du hast gerade die Bank ausgeraubt, du kannst das Geld jetzt nicht weitergeben.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Du musst schon eine Zahl eingeben.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "Du kannst dir nicht einfach Geld nehmen.";ctrlShow[2001,true];};
if(parseNumber(_amount) > CASH) exitWith {hint "So viel hast du nicht!";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Der gewählte Spieler ist nicht mehr in Reichweite";};
hint format["Du hast $%1 an %2 gegeben",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
CASH = CASH - (parseNumber(_amount));
[] call life_fnc_hudUpdate;
[6] call SOCK_fnc_updatePartial;
[[_unit,_amount,player],"life_fnc_receiveMoney",_unit,false] call life_fnc_MP;
[] call life_fnc_p_updateMenu;

ctrlShow[2001,true];