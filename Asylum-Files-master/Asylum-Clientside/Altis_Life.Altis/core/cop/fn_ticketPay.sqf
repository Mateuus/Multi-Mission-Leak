/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};

life_ticket_attempted = true; // mark that the player tried to pay the ticket

_copPaidAmount = life_ticket_val; // was 0.5

// where is the money coming from?
if(life_atmmoney < life_ticket_val) exitWith {
	hint "You don't have enough money in your bank account or on you to pay the ticket.";
	[[1,format["%1 couldn't pay the ticket due to not having enough money.",name player]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
	closeDialog 0;
};

life_ticket_paid = true;

hint format["You have paid the ticket of $%1",[life_ticket_val] call life_fnc_numberText];
["atm","take",life_ticket_val] call life_fnc_uC;
[[0,format["%1 paid the ticket of $%2",name player,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

[life_ticket_cop, _copPaidAmount] spawn life_fnc_copSplit;
[[2,format["$%1 has been spread amongst the active police force for a ticket paid by %2",[_copPaidAmount] call life_fnc_numberText,name player]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;

[[(getPlayerUID player),life_ticket_val],"life_fnc_wantedTicket",false,false] spawn life_fnc_MP;

// [[55, player, format["Paid the ticket of %1", life_ticket_val]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
closeDialog 0;

if (life_ticket_val > 250) then
{
	[[(life_ticket_val * 0.0012)],"life_fnc_addExperience",life_ticket_cop,false] spawn life_fnc_MP;
	[[floor (life_ticket_val / 25)],"life_fnc_earnPrestige",life_ticket_cop,false] spawn life_fnc_MP;
};

player setVariable ["parole",nil,true];
player setVariable ["paroleViolated", nil, true];