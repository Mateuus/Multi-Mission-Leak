/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "Du hast niemanden ausgewaehlt!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!lhm_use_atm) exitWith {hint "Du hast vor kurzem die Bank ausgeraubt, du kannst jetzt noch kein Geld verteilen.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Du hast keine gueltige Zahl eingegeben.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "Du musst eine richtige Menge an Items angeben.";ctrlShow[2001,true];};
if(parseNumber(_amount) > lhm_cash) exitWith {hint "Du hast nicht so viel zum verteilen!";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Der ausgewaehlte Player ist nicht in Reichweite";};
hint format["You gave $%1 to %2",[(parseNumber(_amount))] call lhm_fnc_numberText,_unit getVariable["realname",name _unit]];
lhm_cash = lhm_cash - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[[_unit,_amount,player, name _unit],"lhm_fnc_receiveMoney",_unit,false] call lhm_fnc_mp;		//name _unit fuer logs
[] call lhm_fnc_p_updateMenu;

ctrlShow[2001,true];