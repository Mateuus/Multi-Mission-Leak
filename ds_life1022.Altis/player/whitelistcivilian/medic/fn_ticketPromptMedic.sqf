/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Ask the civilian if they would like to pay the ticket
*/

private ["_pay"];

_pay = [
	format ["You have been requested to pay for %2, the amount requested is $%1. Will you pay this charge?",[(_this select 1)] call DS_fnc_numberText,(_this select 2)],
	"Pay Charge?",
	"Pay",
	"Refuse"
] call BIS_fnc_guiMessage;

if((_pay)&&([(_this select 1),true] call DS_fnc_checkMoney))exitWith
	{
	[0,format["%1 does not have enough money in his bank to pay the charge",profileName]] remoteExecCall ["DS_fnc_globalMessage",(_this select 0)];
	};

if(_pay)then
	{
	[0,format["%1 has paid the charge of $%2",profileName,[(_this select 1)] call DS_fnc_numberText]] remoteExecCall ["DS_fnc_globalMessage",(_this select 0)];
	[player,(_this select 1)] remoteExecCall ["DS_fnc_ticketPaidMedic",(_this select 0)];
	[(_this select 1),true,false] call DS_fnc_handleMoney;
	}
	else
	{
	[0,format["%1 has refused to pay the charge",profileName]] remoteExecCall ["DS_fnc_globalMessage",(_this select 0)];
	};