#include "..\script_macros.hpp"
/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {ES_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull ES_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};

_val = ctrlText 2652;

if(!([_val] call ES_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 200000) exitWith {hint localize "STR_Cop_TicketOver100"};

[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call ES_fnc_numberText,ES_ticket_unit getVariable ["realname",name ES_ticket_unit]]] remoteExec ["ES_fnc_broadcast",-2];
[player,(parseNumber _val)] remoteExec ["ES_fnc_ticketPrompt",ES_ticket_unit];
closeDialog 0;

_toLog = format ["Name: %1 (%2) hat An: %3 (%4) Was: Ticket ausgestellt Geld: %5 $", player getVariable["realname",name player], getPlayerUID player, ES_ticket_unit getVariable["realname",name ES_ticket_unit], getPlayerUID ES_ticket_unit, [_val] call ES_fnc_numberText];
["TICKET_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2]; 