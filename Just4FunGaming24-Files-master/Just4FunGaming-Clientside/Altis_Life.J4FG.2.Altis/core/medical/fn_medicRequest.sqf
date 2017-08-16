// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
private["_caller", "_callerName"];

_caller = [_this, 0, objNull, [objNull] ] call BIS_fnc_param;
_callerName = [ _this, 1 , "Unbekannter Spieler", [""]] call BIS_fnc_param;

if(isNull _caller) exitWith {};

playSound "notification";
hint parseText format["<t color='#FF0000' size='2'>Hilferuf von %1</t>", _callerName];
systemChat format["Hilferuf von %1", _callerName];
titleText[ format["Hilferuf von %1", _callerName], "PLAIN"];