/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2652;


if(isNull _curTarget) exitWith {hint "Kein Ziel"; closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {hint "Ungültiges Ziel"; closeDialog 0;}; //Bad side check?


_unit = life_pInact_curTarget;

if(isNil "_unit") exitWith {closeDialog 0;};
if(_unit == player) exitWith {closeDialog 0;};
if(isNull _unit) exitWith {closeDialog 0;};


if(!life_use_atm) exitWith {hint "Du hast gerade die Bank ausgeraubt...";closeDialog 0;};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "You didn't enter an actual number format.";closeDialog 0;};
if(parseNumber(_amount) <= 0) exitWith {hint "Du musst einen güötigen Betrag angeben..";closeDialog 0;};
if(parseNumber(_amount) > life_cash) exitWith {hint "Soviel Geld hast du nicht bei dir!";closeDialog 0;};
if(isNull _unit) exitWith {closeDialog 0;};
if(isNil "_unit") exitWith {closeDialog 0; hint "Die Person ist nicht mehr in reichweite";};
hint format["Du hast $%1 gegeben",[(parseNumber(_amount))] call life_fnc_numberText];
life_cash = life_cash - (parseNumber(_amount));
closeDialog 0;
[[format ["1|%1 Geld gegeben an %3: %2.",player getVariable["realname",name player],_amount, _unit getVariable["realname",name player]]],"Arma3Log",false,false] call life_fnc_MP;

[0] call SOCK_fnc_updatePartial;
[[_unit,_amount,player],"life_fnc_receiveMoney",_unit,false] spawn life_fnc_MP;
[[player, _unit, _amount, 1, life_atmcash, life_cash],"TON_fnc_handleDBLog",false] spawn life_fnc_MP;
[] call life_fnc_p_updateMenu;


