#include "..\..\script_macros.hpp"
/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isNil "life_ticket_val" OR isNil "life_ticket_cop") exitWith {};
if(CASH < life_ticket_val) exitWith {
	if(BANK < life_ticket_val) exitWith {
		hint "Du hast den Strafzettel bezahlt!";
		[1, format["%1 hat deinen Stafzettel in höhe von $%2bezahlt.", profileName, [life_ticket_val] call life_fnc_numberText],false] remoteExecCall ["life_fnc_broadcast",life_ticket_cop];
		closeDialog 0;
	};
	
	hint format[ "Verrechne %1_Paid",[life_ticket_val] call life_fnc_numberText];
	SUB(BANK,life_ticket_val);
	life_ticket_paid = true;
	
	[0, format["%1 hat den Strafzettel in höhe von $%2 bezahlt.", profileName, [life_ticket_val] call life_fnc_numberText], false] remoteExecCall ["life_fnc_broadcast",west];
	[1, format["%1 hat deinen Stafzettel in höhe von $%2bezahlt.", profileName, [life_ticket_val] call life_fnc_numberText],false] remoteExecCall ["life_fnc_broadcast",life_ticket_cop];
	[life_ticket_val,player,life_ticket_cop] remoteExecCall ["life_fnc_ticketPaid",life_ticket_cop];
	
	if(life_HC_isActive) then {
		[getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
	} else {
		[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
	};
	
	closeDialog 0;
};

SUB(CASH,life_ticket_val);
life_ticket_paid = true;

if(life_HC_isActive) then {
	[getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
} else {
	[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
};

[0, format["%1 hat den Strafzettel in höhe von $%2 bezahlt.", profileName, [life_ticket_val] call life_fnc_numberText], false] remoteExecCall ["life_fnc_broadcast",west];
closeDialog 0;
[1, format["%1 hat deinen Stafzettel in höhe von $%2bezahlt.", profileName, [life_ticket_val] call life_fnc_numberText],false] remoteExecCall ["life_fnc_broadcast",life_ticket_cop];
[life_ticket_val,player,life_ticket_cop] remoteExecCall ["life_fnc_ticketPaid",life_ticket_cop];