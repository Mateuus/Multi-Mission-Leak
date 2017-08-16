#include "..\..\macros.hpp"
/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {DWEV_ticket_val} OR isNil {DWEV_ticket_cop}) exitWith {};
if(dwf_cash < DWEV_ticket_val) exitWith
{
	if(dwf_atmcash < DWEV_ticket_val) exitWith 
	{
		hint "Du hast nicht genug Geld auf dem Konto oder bei dir, um dieses Bußgeld zu begleichen.";
		format["%1 konnte das Bußgeld nicht begleichen, weil er nicht genug Geld hat.",getMyDName] remoteExec ["hint",DWEV_ticket_cop];
		closeDialog 0;
	};
	hint format["Du hast das Bußgeld in höhe von %1€ bezahlt.",[DWEV_ticket_val] call DWEV_fnc_numberText];
	dwf_atmcash = dwf_atmcash - DWEV_ticket_val;
	DWEV_ticket_paid = true;
	[1] call SOCK_fnc_updatePartial;
	
	[getPlayerUID player] remoteExec ["DWEV_fnc_wantedRemove",2];
	
	closeDialog 0;
	
	format["%1 hat das Bußgeld in höhe von %2€ bezahlt.",getMyDName,[DWEV_ticket_val] call DWEV_fnc_numberText] remoteExec ["systemChat",west];
	[DWEV_ticket_val,player,DWEV_ticket_cop] remoteExec ["DWEV_fnc_ticketPaid",DWEV_ticket_cop];
	
};
hint format["Du hast das Bußgeld in höhe von %1€ bezahlt.",[DWEV_ticket_val] call DWEV_fnc_numberText];
dwf_cash = dwf_cash - DWEV_ticket_val;
DWEV_ticket_paid = true;
[0] call SOCK_fnc_updatePartial;
closeDialog 0;

[_unit, _cop, _value] remoteExec ["DWEV_fnc_logTicket",2];
[getPlayerUID player] remoteExec ["DWEV_fnc_wantedRemove",2];
format["%1 hat das Bußgeld in höhe von %2€ bezahlt.",getMyDName,[DWEV_ticket_val] call DWEV_fnc_numberText] remoteExec ["systemChat",west];
format["%1 hat das Bußgeld bezahlt.",getMyDName] remoteExec ["hint",DWEV_ticket_cop];
[DWEV_ticket_val,player,DWEV_ticket_cop] remoteExec ["DWEV_fnc_ticketPaid",DWEV_ticket_cop];
