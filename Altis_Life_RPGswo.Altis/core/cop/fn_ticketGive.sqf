#include "..\..\macros.hpp"
/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {DWEV_ticket_unit}) exitWith {hint "Diese Person ist nichts."};
if(isNull DWEV_ticket_unit) exitWith {hint "Diese Person existiert nicht."};
_val = ctrlText 2652;
if(!([_val] call DWF_fnc_isnumber)) exitWith {hint "Du hast keine richtige Zahlen eingegeben."};
if((parseNumber _val) > 1000000) exitWith {hint "Bußgelder können nicht höher als 1.000.000€ sein!"};

format["%1 erhob ein Bußgeld von %2€ gegen %3",getMyDName,[(parseNumber _val)] call DWEV_fnc_numberText,getPlayerName(DWEV_ticket_unit)] remoteExec ["systemChat",-2];
[player,(parseNumber _val)] remoteExec ["DWEV_fnc_ticketPrompt",DWEV_ticket_unit]; // Kein remoteExec !!!!

closeDialog 0;