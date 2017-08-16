#include "..\..\macros.hpp"
/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/
private["_unit"];
//_unit = cursorTarget; // für rad
_unit = param [0,ObjNull,[ObjNull]];
disableSerialization;
if(!(createDialog "DWEV_ticketme_give")) exitWith {hint "Quittungsblock konnte nicht geöffnet werden."};
if(isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2851,format["%1 um eine Zahlung bitten.",getPlayerDName(_unit)]];
DWEV_ticketme_unit = _unit;