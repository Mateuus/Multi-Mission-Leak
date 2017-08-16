/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "Niemand ausgewählt!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!eM_use_atm) exitWith {hint "Du hast kürzlich die Bank ausgeraubt, das Geld ist heiß.";ctrlShow[2001,true];};
if(!([_amount] call fnc_isnumber)) exitWith {hint "Kein gültiges Zahlenformat";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "Kein richtiges Zahlenformat";ctrlShow[2001,true];};
if(parseNumber(_amount) > EMonkeys_c164) exitWith {hint "Du hast nicht genug";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Der ausgewählte Spieler ist nicht in Reichweite";};
hint format["Du hast %2 %1€ gegeben!",[(parseNumber(_amount))] call EMonkeys_fnc_numberText,_unit getVariable["realname",name _unit]];
EMonkeys_c164 = EMonkeys_c164 - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[[_unit,_amount,player],"EMonkeys_fnc_receiveMoney",_unit,false] call EMonkeys_fnc_mp;
[] call EMonkeys_fnc_p_updateMenu;

_text = format ["*** Geld geben | SpielerID Empfänger: %1 | Name Empfänger: %2 | SpielerID: %3 | Name: %4 | Betrag: %5 |",getPlayerUID _unit,name _unit,getPlayerUID player ,name player,_val];
[[4,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;

ctrlShow[2001,true];