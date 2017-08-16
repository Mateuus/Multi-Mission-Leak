/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call GTA_fnc_param;
disableSerialization;
if(!(createDialog "life_ticket_give")) exitWith {hint localize "STR_Cop_TicketFail"};
if(isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2651,format[localize "STR_Cop_Ticket",_unit getVariable["nametag_title",name _unit]]];
life_ticket_unit = _unit;