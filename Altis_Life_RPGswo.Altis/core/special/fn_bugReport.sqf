/*
	File: fn_bugreport.sqf
	Author: Jonas, MineFactory Altis Life
	Edit by: www.division-wolf.de
	Description: Spieler Bugreport.
*/
private ["_filter", "_message", "_trigger"];

_message = ctrlText 1400;
_pos = mapGridPosition player;

_filter = "'/\`:|;{}-<>";
_message = toArray _message;
_filter = toArray _filter;
_trigger = false;
{if(_x in _filter) exitWith {_trigger = true;};} foreach _message;
if(_trigger) exitWith {hint "Bitte entferne die Characters: '/\`:|;{}-<>"};

if (isNil "DWEV_lastBugReport") then {DWEV_lastBugReport = 0;};

_time = (DWEV_lastBugReport - (time - 60));

if (_time > 0) exitWith {hint format ["Du kannst du einen BugReport pro Minute senden, bitte warte noch %1 bis zum nächsten",[_time] call DWEV_fnc_formatTime];};


_message = toString _message;
if([_message] call KRON_StrLen < 10 || [_message] call KRON_StrLen > 256) exitWith {hint "Ihr Text ist entweder kleiner als 10 Zeichen, oder größer als 256 Zeichen. Bitte reduzieren / hinzufügen, Text.";};
if(_message == "Gib hier deine Fehlerbeschreibung ein.") exitWith {hint "Es wurde kein Text eingegeben";};

closeDialog 0;
DWEV_lastBugReport = time;
hint "Vielen Dank für deine Hilfe, wir werden deine Meldung so bald wie möglich prüfen, unter forum.division-wolf.de kannst du den Status deiner Meldung einsehen";
[player,_message,_pos] remoteExec ["DB_fnc_bugreport",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];