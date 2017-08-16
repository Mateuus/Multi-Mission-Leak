#include "..\..\macros.hpp"
/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount","_empfaenger","_sender"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "Du hast niemanden ausgewählt!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if (!DWEV_use_atm) exitWith {hint "Wegen deinem Raub kannst du einige Zeit kein Geld weiter geben.";ctrlShow[2001,true];};
if (!([_amount] call DWF_fnc_isnumber)) exitWith {hint "Gebe eine Nummer ein.";ctrlShow[2001,true];};
if (parseNumber(_amount) > dwf_cash) exitWith {hint "Soviel besitzt du nicht!";ctrlShow[2001,true];};
if (isNull _unit) exitWith {ctrlShow[2001,true];};
if (isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Der Ausgewähle Spieler ist nicht in Reichweite.";};
if (parseNumber(_amount) <= 0) exitWith {hint "Gebe ein wieviel du geben möchtest.";ctrlShow[2001,true];};
if ((parseNumber (_amount)) < 1000) exitWith {hint "Du kannst nicht weniger als 1000€ an jemanden geben"; ctrlShow[2001,true];};
if ((parseNumber (_amount)) > 10000000) exitWith {hint "Du kannst nicht mehr als 10000000€ an jemanden geben"; ctrlShow[2001,true];};
hint format["Du hast %1€ an %2 gegeben.",[(parseNumber(_amount))] call DWEV_fnc_numberText,getPlayerDName(_unit)];

if (parseNumber(_amount) >= 25000) then 
{
	_sender = switch (side player) do 
	{
		case civilian: {"ZIV"};
		case west: {"COP"};
		case independent: {"MED"};
		case east: {"WSC"};
	};

	_empfaenger = switch (side _unit) do 
	{
		case civilian: {"ZIV"};
		case west: {"COP"};
		case independent: {"MED"};
		case east: {"WSC"};
	};
	
	[4,player,format ["%1 %2 hat %3 %4 (%5) %6€ gegeben - Sender Bargeld. %7 € Bankkonto. %8 €",_sender,getMyDName,_empfaenger,getPlayerDName(_unit),getPlayerUID _unit,[(parseNumber(_amount))] call DWEV_fnc_numberText,[dwf_cash] call DWEV_fnc_numberText,[dwf_atmcash] call DWEV_fnc_numberText]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
};
	
dwf_cash = dwf_cash - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[_unit,_amount,player] remoteExec ["DWEV_fnc_receiveMoney",_unit];
[] call DWEV_fnc_p_updateMenu;

ctrlShow[2001,true];