#include "..\script_macros.hpp"
/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];

if(!GeldGeben) exitWith {hint localize "STR_NOTF_Give_Money";};
if(GeldGeben) then {
	GeldGeben = false;
	[] spawn {
		sleep 5;
		GeldGeben = true;
	};
};

_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "No one was selected!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!ES_use_atm) exitWith {hint "You recently robbed the bank! You can't give money away just yet.";ctrlShow[2001,true];};
if(!([_amount] call ES_fnc_isnumber)) exitWith {hint "You didn't enter an actual number format.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "You need to enter an actual amount you want to give.";ctrlShow[2001,true];};
if(parseNumber(_amount) > ES_cash) exitWith {hint "You don't have that much to give!";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "The selected player is not within range";};

hint format["Du hast %1 - %2 $ gegeben",_unit getVariable["realname",name _unit],[(parseNumber(_amount))] call ES_fnc_numberText];
ES_cash = ES_cash - (parseNumber(_amount));

[0] call SOCK_fnc_updatePartial;
[_unit,_amount,player] remoteExec ["ES_fnc_receiveMoney",_unit];
[] call ES_fnc_p_updateMenu;

ctrlShow[2001,true];

_toLog = format ["Name: %1 (%2) hat %3 (%4) gegeben %5 $", player getVariable["realname",name player], getPlayerUID player, _unit getVariable["realname",name _unit], getPlayerUID _unit, [(parseNumber(_amount))] call ES_fnc_numberText];
["GIVE_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];