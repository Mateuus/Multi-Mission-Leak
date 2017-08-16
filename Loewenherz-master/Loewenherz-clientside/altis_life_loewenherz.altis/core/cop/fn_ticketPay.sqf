/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {lhm_ticket_val} OR isNil {lhm_ticket_cop}) exitWith {};
if(lhm_cash < lhm_ticket_val) exitWith
{
	if(lhm_atmcash < lhm_ticket_val) exitWith 
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		[[1,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]],"lhm_fnc_broadcast",lhm_ticket_cop,false] call lhm_fnc_mp;
		closeDialog 0;
	};
	hint format[localize "STR_Cop_Ticket_Paid",[lhm_ticket_val] call lhm_fnc_numberText];
	lhm_atmcash = lhm_atmcash - lhm_ticket_val;
	lhm_ticket_paid = true;
	[[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[lhm_ticket_val] call lhm_fnc_numberText]],"lhm_fnc_broadcast",west,false] call lhm_fnc_mp;
	[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"lhm_fnc_broadcast",lhm_ticket_cop,false] call lhm_fnc_mp;
	[[lhm_ticket_val,player,lhm_ticket_cop],"lhm_fnc_ticketPaid",lhm_ticket_cop,false] call lhm_fnc_mp;
	[[getPlayerUID player],"lhm_fnc_wantedRemove",false,false] call lhm_fnc_mp;
	closeDialog 0;
};

lhm_cash = lhm_cash - lhm_ticket_val;
lhm_ticket_paid = true;

[[getPlayerUID player],"lhm_fnc_wantedRemove",false,false] call lhm_fnc_mp;
[[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[lhm_ticket_val] call lhm_fnc_numberText]],"lhm_fnc_broadcast",west,false] call lhm_fnc_mp;
closeDialog 0;
[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"lhm_fnc_broadcast",lhm_ticket_cop,false] call lhm_fnc_mp;
[[lhm_ticket_val,player,lhm_ticket_cop],"lhm_fnc_ticketPaid",lhm_ticket_cop,false] call lhm_fnc_mp;