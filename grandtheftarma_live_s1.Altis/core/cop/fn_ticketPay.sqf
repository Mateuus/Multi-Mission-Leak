/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(GTA_money_cash < life_ticket_val) exitWith
{
	if(GTA_money_bank < life_ticket_val) exitWith 
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		[[1,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]],"life_fnc_broadcast",life_ticket_cop,false] call GTA_fnc_remoteExec;
		closeDialog 0;
	};
	hint format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call life_fnc_numberText];
	GTA_money_bank = GTA_money_bank - life_ticket_val;
	life_ticket_paid = true;
	[[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] call GTA_fnc_remoteExec;
	[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"life_fnc_broadcast",life_ticket_cop,false] call GTA_fnc_remoteExec;
	[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] call GTA_fnc_remoteExec;
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] call GTA_fnc_remoteExec;
	closeDialog 0;
};

GTA_money_cash = GTA_money_cash - life_ticket_val;
life_ticket_paid = true;

[[getPlayerUID player],"life_fnc_wantedRemove",false,false] call GTA_fnc_remoteExec;
[[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] call GTA_fnc_remoteExec;
closeDialog 0;
[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"life_fnc_broadcast",life_ticket_cop,false] call GTA_fnc_remoteExec;
[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] call GTA_fnc_remoteExec;