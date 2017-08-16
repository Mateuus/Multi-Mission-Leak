#include "..\..\macros.hpp"
/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/
private["_unit"];
_unit = cursorTarget;
disableSerialization;
if(!(createDialog "DWEV_ticket_give")) exitWith {hint "Bußgeldblock konnte nicht geöffnet werden."};
if(isNull _unit OR !isPlayer _unit) exitwith {};
if((player distance _unit > 3)) exitWith {};
ctrlSetText[2651,format["%1 ein Bußgeld geben.",getPlayerDName(_unit)]];
DWEV_ticket_unit = _unit;