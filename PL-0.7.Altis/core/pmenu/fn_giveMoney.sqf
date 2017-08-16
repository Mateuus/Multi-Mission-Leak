#include "..\..\script_macros.hpp"
/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "Vous n'avez selectionné aucune personne!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
if(_unit == "targetgiveitemmoney") then {
	_unit = cursorObject;
} else {
	_unit = call compile format["%1",_unit];
};
if(isNil "_unit") exitWith {hint "La cible n'est pas un joueur !";ctrlShow[2001,true];};
if(isNull _unit) exitWith {hint "La cible n'est pas un joueur !";ctrlShow[2001,true];};
if(_unit == player) exitWith {hint "La cible n'est pas un joueur !";ctrlShow[2001,true];};
if(!(_unit isKindOf "Man")) exitWith {hint "La cible n'est pas un joueur !";ctrlShow[2001,true];};
if(!isPlayer _unit) exitWith {hint "La cible n'est pas un joueur !";ctrlShow[2001,true];};
if(player distance _unit > 15) exitWith {hint "Cette personne est trop loin";ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "You recently robbed the bank! You can't give money away just yet.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "You didn't enter an actual number format.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "You need to enter an actual amount you want to give.";ctrlShow[2001,true];};
if(parseNumber(_amount) > CASH) exitWith {hint "You don't have that much to give!";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "The selected player is not within range";};

hint format["Vous avez donné %1€ à quelqu'un",[(parseNumber(_amount))] call life_fnc_numberText];
CASH = CASH - (parseNumber(_amount));

[0] call SOCK_fnc_updatePartial;
[_unit,_amount,player] remoteExecCall ["life_fnc_receiveMoney",_unit];
[] call life_fnc_p_updateMenu;

_playerID = getPlayerUID player;
_playerName = name player;
_toPlayerID = getPlayerUID _unit;
_toPlayerName = name _unit;
_type = 2;
_amount = _amount;
_cashAct = [life_cash]call life_fnc_numberText;
_bankAct = [life_atmbank]call life_fnc_numberText;
[_playerID,_playerName,_toPlayerID,_toPlayerName,_type,_amount,_cashAct,_bankAct] remoteExecCall ["TON_fnc_moneyLog", (call life_fnc_HCC)];

ctrlShow[2001,true];