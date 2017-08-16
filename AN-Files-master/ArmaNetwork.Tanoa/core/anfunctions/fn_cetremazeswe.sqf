#include <macro.h>

/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pays the ticket.
*/
if(isNil "life_ticket_val" OR isNil "life_ticket_cop") exitWith {};
if(CASH < life_ticket_val) exitWith {
	if(BANK < life_ticket_val) exitWith {
		hintSilent localize "STR_Cop_Ticket_NotEnough";
		[1,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]] remoteExecCall ["life_fnc_brusathusek",life_ticket_cop];
		closeDialog 0;
	};
	hintSilent format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call life_fnc_rupadudejat];
	[life_ticket_val,1,1] call life_fnc_sewawruk;
	life_ticket_paid = true;
	[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call life_fnc_rupadudejat]] remoteExecCall ["life_fnc_brusathusek",west];
	[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] remoteExecCall ["life_fnc_brusathusek",life_ticket_cop];
	[life_ticket_val,player,life_ticket_cop] remoteExecCall ["life_fnc_crepufefrugu",life_ticket_cop];
	closeDialog 0;
};
[life_ticket_val,0,1] call life_fnc_sewawruk;
life_ticket_paid = true;
[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call life_fnc_rupadudejat]] remoteExecCall ["life_fnc_brusathusek",west];
closeDialog 0;
[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] remoteExecCall ["life_fnc_brusathusek",life_ticket_cop];
[life_ticket_val,player,life_ticket_cop] remoteExecCall ["life_fnc_crepufefrugu",life_ticket_cop];
