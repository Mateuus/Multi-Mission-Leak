#include "..\..\macros.hpp"
/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player that he is being ticketed.
*/
private["_cop","_val","_display","_control"];
if(!isNull (findDisplay 2600)) exitwith {}; //Already at the ticket menu, block for abuse?
_cop = _this select 0;
if(isNull _cop) exitWith {};
_val = _this select 1;

createDialog "DWEV_ticket_pay";
disableSerialization;
waitUntil {!isnull (findDisplay 2600)};
_display = findDisplay 2600;
_control = _display displayCtrl 2601;
DWEV_ticket_paid = false;
DWEV_ticket_val = _val;
DWEV_ticket_cop = _cop;

_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>%1 gab dir ein Bußgeld in höhe von %2€",getPlayerDName(_cop),[_val] call DWEV_fnc_numberText];

[] spawn
{
	disableSerialization;
	waitUntil {DWEV_ticket_paid OR (isNull (findDisplay 2600))};
	if(isNull (findDisplay 2600) && !DWEV_ticket_paid) then
	{
		
		format["%1 lehnte die Zahlung des Bußgeldes ab.",getMyDName] remoteExec ["systemChat",west];
		format["%1 lehnte die Zahlung des Bußgeldes ab.",getMyDName] remoteExec ["hint",DWEV_ticket_cop];
	};
};