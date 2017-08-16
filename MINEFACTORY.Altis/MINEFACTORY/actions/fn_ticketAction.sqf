/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/
params [
	["_unit",objNull,[objNull]]
];
disableSerialization;
if(!(createDialog "life_ticket_give")) exitWith {hint  "Verrechne %1Fail"};
if(isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2651,format[ "Verrechne %1",_unit getVariable["realname",name _unit]]];
life_ticket_unit = _unit;