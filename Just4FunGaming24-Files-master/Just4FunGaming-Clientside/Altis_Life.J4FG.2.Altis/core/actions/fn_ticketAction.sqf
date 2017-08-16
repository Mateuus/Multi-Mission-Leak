// File: fn_ticketAction.sqf
// Author: Bryan "Tonic" Boardwine
// Rewritten by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_unit"];

_unit = [ _this, 0, objNull, [objNull] ] call BIS_fnc_param;

disableSerialization;
if( !(createDialog "XY_dialog_giveTicket") ) exitWith {
    hint "Da ist was schief gelaufen"
};
if( isNull _unit || { !(isPlayer _unit) } ) exitWith {};

if( playerSide == civilian ) exitWith {};

ctrlSetText[2651, format["%1 %2", (switch (true) do {
    case (west): { "Strafticket ausstellen für" };
    case (east): { "Rechnung ausstellen für" };
    case (independent): { "Spendenanfrage an" };
    default { "ERROR" };
}), _unit getVariable["realName", name _unit]] ];

XY_ticketUnit = _unit;