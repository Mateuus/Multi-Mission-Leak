/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(life_cash < life_ticket_val) exitWith
{
	if(life_atmcash < life_ticket_val) exitWith 
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		[1,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]] remoteExec ["tanoarpg_fnc_broadcast", life_ticket_cop, false];
		closeDialog 0;
	};
	hint format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call tanoarpg_fnc_numberText];
	life_atmcash = life_atmcash - life_ticket_val;
	life_ticket_paid = true;
	[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call tanoarpg_fnc_numberText]] remoteExec ["tanoarpg_fnc_broadcast", west, false];
	[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] remoteExec ["tanoarpg_fnc_broadcast", life_ticket_cop, false];
	[life_ticket_val,player,life_ticket_cop] remoteExec ["tanoarpg_fnc_ticketPaid", life_ticket_cop, false];
	[getPlayerUID player] remoteExec ["tanoarpg_fnc_wantedRemove", 2, false];
	closeDialog 0;
};

life_cash = life_cash - life_ticket_val;
life_ticket_paid = true;

[getPlayerUID player] remoteExec ["tanoarpg_fnc_wantedRemove", 2, false];
[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call tanoarpg_fnc_numberText]] remoteExec ["tanoarpg_fnc_broadcast", west, false];
closeDialog 0;
[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] remoteExec ["tanoarpg_fnc_broadcast", life_ticket_cop, false];
[life_ticket_val,player,life_ticket_cop] remoteExec ["tanoarpg_fnc_ticketPaid", life_ticket_cop, false];