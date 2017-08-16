// File: fn_ticketGive.sqf
// Author: Bryan "Tonic" Boardwine
// Rewritten by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_val"];

if( isNil "XY_ticketUnit" || { isNull XY_ticketUnit } ) exitWith {};

_val = ctrlText 2652;

if( !([_val] call XY_fnc_isnumber) ) exitWith {
    hint "Das ist keine Zahl";
};
_val = parseNumber _val;

if( playerSide == civilian ) exitWith {};
if( playerSide == west && { _val > 9999999 } ) exitWith {
    hint "Die Obergrenze für Tickets ist überschritten";
};
if( playerSide == east && { _val > 150000 } ) exitWith {
    hint "Die Obergrenze für Rechnungen ist 150.000";
};
if( playerSide == independent && { _val > 150000 } ) exitWith {
    hint "Die Obergrenze für Spenden ist 150.000";
};
closeDialog 0;

if( playerSide == west ) then {
    [0, format[ "%1 hat %2 ein Ticket über %3€ ausgestellt", profileName, XY_ticketUnit getVariable["realName", name XY_ticketUnit], [_val] call XY_fnc_numberText ]] remoteExec ["XY_fnc_broadcast"];
};
[player, _val] remoteExec ["XY_fnc_ticketPrompt", XY_ticketUnit];
