/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Ask the civilian if he would like to pay the ticket
*/

private ["_pay"];

_pay = [
	format ["You have been issued with a ticket for %2, the amount requested is $%1. Will you pay this ticket?",[(_this select 1)] call DS_fnc_numberText,(_this select 2)],
	"Pay Ticket?",
	"Pay",
	"Refuse"
] call BIS_fnc_guiMessage;

if(_pay)then
	{
	[[0,format["%1 has paid his ticket of $%2",profileName,[(_this select 1)] call DS_fnc_numberText]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	[[player,(_this select 1)],"DS_cop_ticketPaid",(_this select 0),false] spawn BIS_fnc_MP;
	[(_this select 1),true,false] call DS_fnc_handleMoney;
	}
	else
	{
	[[0,format["%1 has refused to pay the ticket",profileName]],"DS_fnc_globalMessage",(_this select 0),false] spawn BIS_fnc_MP;
	};










