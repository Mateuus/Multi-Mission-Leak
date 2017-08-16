/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {EMonkeys_ticket_val} OR isNil {EMonkeys_ticket_cop}) exitWith {};
if(EMonkeys_c164 < EMonkeys_ticket_val) exitWith
{
	if(EMonkeys_a164 < EMonkeys_ticket_val) exitWith 
	{
		hint "Du hast weder genügend Geld auf dem Konto noch in Bar um den Strafzettel zu bezahlen.";
		[[1,format["%1 konnte das Ticket nicht bezahlen weil er nicht genügend Geld hat.",profileName]],"EMonkeys_fnc_broadcast",EMonkeys_ticket_cop,false] call EMonkeys_fnc_mp;
		closeDialog 0;
	};
	hint format["Du hast das Bußgeld in Höhe von %1€ bezahlt",[EMonkeys_ticket_val] call EMonkeys_fnc_numberText];
	EMonkeys_a164 = EMonkeys_a164 - EMonkeys_ticket_val;
	EMonkeys_ticket_paid = true;
	[[0,format["%1 hat ein Bußgeld in Höhe von %2€ bezahlt",profileName,[EMonkeys_ticket_val] call EMonkeys_fnc_numberText]],"EMonkeys_fnc_broadcast",west,false] call EMonkeys_fnc_mp;
	[[1,format["%1 hat den Strafzettel bezahlt.",profileName]],"EMonkeys_fnc_broadcast",EMonkeys_ticket_cop,false] call EMonkeys_fnc_mp;
	[[EMonkeys_ticket_val,player,EMonkeys_ticket_cop],"EMonkeys_fnc_ticketPaid",EMonkeys_ticket_cop,false] call EMonkeys_fnc_mp;
	[[getPlayerUID player],"EMonkeys_fnc_wantedRemove",false,false] call EMonkeys_fnc_mp;
	closeDialog 0;

};
EMonkeys_c164 = EMonkeys_c164 - EMonkeys_ticket_val;
EMonkeys_ticket_paid = true;

[[getPlayerUID player],"EMonkeys_fnc_wantedRemove",false,false] call EMonkeys_fnc_mp;
[[0,format["%1 hat ein Bußgeld in Höhe von %2€ bezahlt",profileName,[EMonkeys_ticket_val] call EMonkeys_fnc_numberText]],"EMonkeys_fnc_broadcast",west,false] call EMonkeys_fnc_mp;
closeDialog 0;
[[1,format["%1 hat den Strafzettel bezahlt.",profileName]],"EMonkeys_fnc_broadcast",EMonkeys_ticket_cop,false] call EMonkeys_fnc_mp;
[[EMonkeys_ticket_val,player,EMonkeys_ticket_cop],"EMonkeys_fnc_ticketPaid",EMonkeys_ticket_cop,false] call EMonkeys_fnc_mp;