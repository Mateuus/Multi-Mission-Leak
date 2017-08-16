/*---------------------------------------------------------------------------
	File: fn_adacTicketPay.sqf
	Author: Skrow & Skyfezzer
	
	Description:
	Pays the ticket.
---------------------------------------------------------------------------*/

if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(life_cash < life_ticket_val) exitWith
{
	if(life_atmcash < life_ticket_val) exitWith 
	{
		hint "Vous n'avez pas assez d'argent pour payer la facture.";
		[[1,format["%1 ne peut pas payer la facture parce qu'il n'a pas assez d'argent sur son compte.",player getVariable["realname",name player]]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
		closeDialog 0;
	};
	hint format["Vous avez payé la facture de %1€.",[life_ticket_val] call life_fnc_numberText];
	life_atmcash = life_atmcash - life_ticket_val;
	adaclife_ticket_paid = true;
	[[0,format["%1 a payé la facture de %2€.",profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
	[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] spawn life_fnc_MP;
	closeDialog 0;
};

life_cash = life_cash - life_ticket_val;
adaclife_ticket_paid = true;

[[0,format["%1 a payé la facture: $%2",profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
closeDialog 0;
[[1,format["%1 a payé la facture.",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] spawn life_fnc_MP;