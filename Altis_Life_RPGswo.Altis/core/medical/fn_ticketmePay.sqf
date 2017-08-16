#include "..\..\macros.hpp"
/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {DWEV_ticketme_val} OR isNil {DWEV_ticketme_med}) exitWith {};
if(dwf_cash < DWEV_ticketme_val) exitWith
{
	if(dwf_atmcash < DWEV_ticketme_val) exitWith 
	{
		hint "Du hast nicht genug Geld auf dem Konto oder bei dir, um zu die Zahlung zu zahlen.";
		format["%1 konnte nicht zahlen, weil er nicht genug Geld hat.",getMyDName] remoteExec ["hint",DWEV_ticketme_med];
		closeDialog 0;
	};
	hint format["Du hast %1€ bezahlt.",[DWEV_ticketme_val] call DWEV_fnc_numberText];
	dwf_atmcash = dwf_atmcash - DWEV_ticketme_val;
	DWEV_ticketme_paid = true;
	closeDialog 0;
	
	format["%1 hat %2€ an dich gezahlt.",getMyDName,[DWEV_ticketme_val] call DWEV_fnc_numberText] remoteExec ["systemChat",DWEV_ticketme_med];
	format["%1 hat dich bezahlt.",getMyDName] remoteExec ["hint",DWEV_ticketme_med];
	[DWEV_ticketme_val,player,DWEV_ticketme_med] remoteExec ["DWEV_fnc_ticketmePaid",DWEV_ticketme_med];

	
};
hint format["Du hast %1€ bezahlt.",[DWEV_ticketme_val] call DWEV_fnc_numberText];
dwf_cash = dwf_cash - DWEV_ticketme_val;
DWEV_ticketme_paid = true;

closeDialog 0;
format["%1 hat %2€ an dich gezahlt.",getMyDName,[DWEV_ticketme_val] call DWEV_fnc_numberText] remoteExec ["systemChat",DWEV_ticketme_med];
format["%1 hat dich bezahlt.",getMyDName] remoteExec ["hint",DWEV_ticketme_med];
[DWEV_ticketme_val,player,DWEV_ticketme_med] remoteExec ["DWEV_fnc_ticketmePaid",DWEV_ticketme_med];