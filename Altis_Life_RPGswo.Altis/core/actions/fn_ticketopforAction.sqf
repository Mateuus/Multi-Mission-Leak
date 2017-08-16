#include "..\..\macros.hpp"
/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/
private["_unit"];
//_unit = cursorTarget; //für rad
_unit = param [0,ObjNull,[ObjNull]];
disableSerialization;
if(!(createDialog "DWEV_ticketopfor_give")) exitWith {hint "Rechnungsblock konnte nicht geöffnet werden."};
if(isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2751,format["%1 eine Rechnung ausstellen.",getPlayerDName(_unit)]];
DWEV_ticketopfor_unit = _unit;