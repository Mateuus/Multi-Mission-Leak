/*
	File: fn_ticketAction.sqf
	
	
	Description:
	Starts the ticketing process.
*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
disableSerialization;
if(!(createDialog "life_ticket_give")) exitWith {[localize "STR_Cop_TicketFail", false] spawn domsg;};
if(isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2651,format[localize "STR_Cop_Ticket",_unit getVariable["realname",name _unit]]];
life_ticket_unit = _unit;