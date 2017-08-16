#include "..\..\macros.hpp"
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

if(__GETC__(DWEV_adminlevel) < 2) exitWith {hint "Du hast keine Berechtigung Spieler zu kicken"}; //ab S

hint format ["Du hast %1 aus dem Spiel gekickt", getPlayerDName(_unit)];

[_unit,"von einem Admin"] remoteExec ["CLIENT_fnc_kickMe",2];