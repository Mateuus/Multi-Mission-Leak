#include "..\script_macros.hpp"
/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isNil "ES_ticket_val" OR isNil "ES_ticket_cop") exitWith {};
if(ES_cash < ES_ticket_val) exitWith {
	if(ES_atmbank < ES_ticket_val) exitWith {
		hint localize "STR_Cop_Ticket_NotEnough";
		[1,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]] remoteExec ["ES_fnc_broadcast",ES_ticket_cop];
		closeDialog 0;
	};
	
	hint format[localize "STR_Cop_Ticket_Paid",[ES_ticket_val] call ES_fnc_numberText];
	ES_atmbank = ES_atmbank - ES_ticket_val;
	ES_ticket_paid = true;
	
	[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[ES_ticket_val] call ES_fnc_numberText]] remoteExec ["ES_fnc_broadcast",west];
	[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] remoteExec ["ES_fnc_broadcast",ES_ticket_cop];
	[ES_ticket_val,player,ES_ticket_cop] remoteExec ["ES_fnc_ticketPaid",ES_ticket_cop];
	[getPlayerUID player] remoteExec ["ES_fnc_wantedRemove",2];
	closeDialog 0;
};

ES_cash = ES_cash - ES_ticket_val;

ES_ticket_paid = true;

[getPlayerUID player] remoteExec ["ES_fnc_wantedRemove",2];
[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[ES_ticket_val] call ES_fnc_numberText]] remoteExec ["ES_fnc_broadcast",west];
closeDialog 0;
[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] remoteExec ["ES_fnc_broadcast",ES_ticket_cop];
[ES_ticket_val,player,ES_ticket_cop] remoteExec ["ES_fnc_ticketPaid",ES_ticket_cop];