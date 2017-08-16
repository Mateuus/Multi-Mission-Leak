#include "..\..\macros.hpp"
/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player that he is being ticketed.
*/
private["_med","_val","_display","_control"];
if(!isNull (findDisplay 2800)) exitwith {}; //Already at the ticket menu, block for abuse?
_med = _this select 0;
if(isNull _med) exitWith {};
_val = _this select 1;

createDialog "DWEV_ticketme_pay";
disableSerialization;
waitUntil {!isnull (findDisplay 2800)};
_display = findDisplay 2800;
_control = _display displayCtrl 2801;
DWEV_ticketme_paid = false;
DWEV_ticketme_val = _val;
DWEV_ticketme_med = _med;
_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>%1 wünscht sich von dir eine Zahlung von %2€.",getPlayerDName(_med),_val];

[] spawn
{
	disableSerialization;
	waitUntil {DWEV_ticketme_paid OR (isNull (findDisplay 2800))};
	if(isNull (findDisplay 2800) && !DWEV_ticketme_paid) then
	{
		format["%1 möchte nicht Zahlen.",getMyDName] remoteExec ["hint",DWEV_ticketme_med];
	};
};