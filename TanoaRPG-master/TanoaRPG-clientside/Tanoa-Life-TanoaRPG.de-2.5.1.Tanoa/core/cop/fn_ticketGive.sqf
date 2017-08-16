/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call TEX_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 1000000) exitWith {hint localize "STR_Cop_TicketOver100"};
[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call tanoarpg_fnc_numberText,life_ticket_unit getVariable["realname",name life_ticket_unit]]] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
[player,(parseNumber _val)] remoteExec ["tanoarpg_fnc_ticketPrompt", life_ticket_unit, false];
closeDialog 0;