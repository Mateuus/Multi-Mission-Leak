/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;
if(!(createDialog "life_ticket_givemedic")) exitWith {hint localize "STR_Medic_TicketFail"};
if(isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2651,format[localize "STR_Medic_Ticket",_unit getVariable["realname",name _unit]]];
life_ticket_unit = _unit;