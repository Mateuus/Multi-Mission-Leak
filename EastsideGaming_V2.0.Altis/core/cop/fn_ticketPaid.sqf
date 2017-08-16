#include "..\..\script_macros.hpp"
/*
    File: fn_ticketPaid.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Verifies that the ticket was paid.
*/
params [
    ["_value",5,[0]],
    ["_unit",objNull,[objNull]],
    ["_cop",objNull,[objNull]]
];
if (isNull _unit || {_unit != life_ticket_unit}) exitWith {}; //NO
if (isNull _cop || {_cop != player}) exitWith {}; //Double NO

BANK = BANK + _value;
[1] call SOCK_fnc_updatePartial;
_log = format["%1 (%2) hat %3 (%4) ein Ticket von %5$ gegeben (Bezahlt).", _cop getVariable["realname", name _cop], getPlayerUID _cop, _unit getVariable["realname", name _unit], getPlayerUID _unit, [_value]call life_fnc_numberText];
["TICKET_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];