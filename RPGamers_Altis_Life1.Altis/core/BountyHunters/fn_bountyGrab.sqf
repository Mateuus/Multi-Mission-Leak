#include "..\..\script_macros.hpp"

private ["_display","_tab","_criminal"];
disableSerialization;
_display = findDisplay 69690;
_tab = _display displayCtrl 24020;
_criminal = lbData[6969,(lbCurSel 6969)];
_criminal = call compile format ["%1", _criminal];
if (isNil "_criminal") exitWith {};

if (life_HC_isActive) then {
    [player,_criminal] remoteExec ["HC_fnc_bounCrimes",HC_Life];
} else {
    [player,_criminal] remoteExec ["life_fnc_bountyCrimes",RSERV];
};
