#include "..\..\macros.hpp"
/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {DWEV_ticketopfor_val} OR isNil {DWEV_ticketopfor_opfor}) exitWith {};
if(dwf_cash < DWEV_ticketopfor_val) exitWith
{
	if(dwf_atmcash < DWEV_ticketopfor_val) exitWith 
	{
		hint "Du hast nicht genug Geld auf dem Konto oder bei dir, um die Rechnung zu begleichen.";
		format["%1 konnte die Rechnung nicht begleichen, weil er nicht genug Geld hat.",getMyDName] remoteExec ["hint",DWEV_ticketopfor_opfor];
		closeDialog 0;
	};
	hint format["Du hast die Rechnung in höhe von %1 € bezahlt.",[DWEV_ticketopfor_val] call DWEV_fnc_numberText];
	dwf_atmcash = dwf_atmcash - DWEV_ticketopfor_val;
	DWEV_ticketopfor_paid = true;
	closeDialog 0;

	format["%1 hat die Rechnung in höhe von %2 € bezahlt.",getMyDName,[DWEV_ticketopfor_val] call DWEV_fnc_numberText] remoteExec ["systemChat",DWEV_ticketopfor_opfor];
	format["%1 hat die Rechnung bezahlt.",getMyDName] remoteExec ["hint",DWEV_ticketopfor_opfor];
	[DWEV_ticketopfor_val,player,DWEV_ticketopfor_opfor] remoteExec ["DWEV_fnc_ticketopforPaid",DWEV_ticketopfor_opfor];
	
};
hint format["Du hast die Rechnung in höhe von %1 € bezahlt.",[DWEV_ticketopfor_val] call DWEV_fnc_numberText];
dwf_cash = dwf_cash - DWEV_ticketopfor_val;
DWEV_ticketopfor_paid = true;

closeDialog 0;
format["%1 hat die Rechnung in höhe von %2 € gezahlt.",getMyDName,[DWEV_ticketopfor_val] call DWEV_fnc_numberText] remoteExec ["systemChat",DWEV_ticketopfor_opfor];
format["%1 hat die Rechnung bezahlt.",getMyDName] remoteExec ["hint",DWEV_ticketopfor_opfor];
[DWEV_ticketopfor_val,player,DWEV_ticketopfor_opfor] remoteExec ["DWEV_fnc_ticketopforPaid",DWEV_ticketopfor_opfor];