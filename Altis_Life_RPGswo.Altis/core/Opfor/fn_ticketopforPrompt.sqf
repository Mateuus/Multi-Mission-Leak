#include "..\..\macros.hpp"
/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player that he is being ticketed.
*/
private["_opfor","_val","_display","_control"];
if(!isNull (findDisplay 2700)) exitwith {}; //Already at the ticket menu, block for abuse?
_opfor = _this select 0;
if(isNull _opfor) exitWith {};
_val = _this select 1;

createDialog "DWEV_ticketopfor_pay";
disableSerialization;
waitUntil {!isnull (findDisplay 2700)};
_display = findDisplay 2700;
_control = _display displayCtrl 2701;
DWEV_ticketopfor_paid = false;
DWEV_ticketopfor_val = _val;
DWEV_ticketopfor_opfor = _opfor;
_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>%1 hat dir eine Rechnung in höhe von %2 € ausgestellt.",getPlayerDName(_opfor),_val];

[] spawn
{
	disableSerialization;
	waitUntil {DWEV_ticketopfor_paid OR (isNull (findDisplay 2700))};
	if(isNull (findDisplay 2700) && !DWEV_ticketopfor_paid) then
	{
		format["%1 lehnt die Zahlung der Rechnung ab.",getMyDName] remoteExec ["hint",DWEV_ticketopfor_opfor];
	};
};