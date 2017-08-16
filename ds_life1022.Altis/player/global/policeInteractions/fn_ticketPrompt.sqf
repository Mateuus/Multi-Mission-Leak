/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Asks a civilian if they would like to pay the ticket
*/

private ["_pay"];

_pay = [
	format ["You have been issued with a ticket for %2, the amount requested is $%1. Will you pay this ticket?",[(_this select 1)] call DS_fnc_numberText,(_this select 2)],
	"Pay Ticket?",
	"Pay",
	"Refuse"
] call BIS_fnc_guiMessage;

if((_pay)&&([(_this select 1),true] call DS_fnc_checkMoney))exitWith
	{
	[0,format["%1 does not have enough money in his bank to pay the charge",profileName]] remoteExecCall ["DS_fnc_globalMessage",(_this select 0)];
	};

if(_pay)then
	{
	[0,format["%1 has paid his ticket of $%2",profileName,[(_this select 1)] call DS_fnc_numberText]] remoteExecCall ["DS_fnc_globalMessage",west];
	[player,(_this select 1)] remoteExec ["DS_cop_ticketPaid",(_this select 0)];
	[(_this select 1),true,false] call DS_fnc_handleMoney;
	[] spawn DS_fnc_removeCharges;
	}
	else
	{
	[0,format["%1 has refused to pay the ticket",profileName]] remoteExecCall ["DS_fnc_globalMessage",(_this select 0)];
	};