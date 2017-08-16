#include "..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Verifies that the ticket was paid.
*/
params [
	["_value",5,[0]],
	["_unit",objNull,[objNull]],
	["_cop",objNull,[objNull]]
];
if(isNull _unit OR {_unit != ES_ticket_unit}) exitWith {}; //NO
if(isNull _cop OR {_cop != player}) exitWith {}; //Double NO

ES_atmbank = ES_atmbank + _value;

["PolizeiTicket"] call ES_fnc_xp_add;

_toLog = format ["Name: %1 (%2) hat An: %3 (%4) Was: Ticket Bezahlt Geld: %5 $", _cop getVariable["realname",name _cop], getPlayerUID _cop, _unit getVariable["realname",name _unit], getPlayerUID ES_ticket_unit, [_value] call ES_fnc_numberText];
["TICKET_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];