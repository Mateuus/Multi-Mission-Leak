#include "..\..\script_macros.hpp"
/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Medic_TicketNil"};
if(isNull life_ticket_unit) exitWith {hint localize "STR_Medic_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Medic_TicketNum"};
if((parseNumber _val) > 500000) exitWith {hint localize "STR_Medic_TicketOver100"};
[0,"STR_Medic_TicketGive",true,[profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit GVAR ["realname",name life_ticket_unit]]] remoteExecCall ["life_fnc_broadcast",0];
[player,(parseNumber _val)] remoteExecCall ["life_fnc_ticketPromptmedic",life_ticket_unit];
closeDialog 0;
