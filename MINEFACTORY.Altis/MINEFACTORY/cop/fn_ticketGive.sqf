#include "..\..\script_macros.hpp"
/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith { hint "Du hast keinen Spieler ausgewählt!"; };
if(isNull life_ticket_unit) exitWith { hint "Diesen Spieler gibt es nicht!"; };

_val = ctrlText 2652;

if(!([_val] call TON_fnc_isnumber)) exitWith { hint "Du hast keine Zahl eingegeben!"; };
if((parseNumber _val) > 3000000) exitWith { hint "Du kannst nicht mehr als 3 Millionen verrechnen!"; };

[0, format["%1 erhielt einen Strafzettel von %1 in höhe von $%3.", [(parseNumber _val)] call life_fnc_numberText, profileName, life_ticket_unit GVAR ["realname",name life_ticket_unit]], false] remoteExec ["life_fnc_broadcast",RCLIENT];
[player,(parseNumber _val)] remoteExec ["life_fnc_ticketPrompt",life_ticket_unit];
closeDialog 0;