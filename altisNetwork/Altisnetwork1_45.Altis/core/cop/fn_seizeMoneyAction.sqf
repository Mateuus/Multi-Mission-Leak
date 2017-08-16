/*
params [
    [ "_target", objNull, [ objNull ] ]
];

if ( isNull _target ) exitWith {};
if ( player distance _target > 5 || !alive player || !alive _target ) exitWith {};

//_target = cursorTarget;

// -- Remove Money
[ player ] remoteExec [ "life_fnc_seizeMoney", _target ]; // -- Do the action

// -- Notify Target
[0,format["Your money got seized by a Police Officer."]] remoteExec ["life_fnc_broadcast",_target];
[1,format["Your money got seized by a Police Officer."]] remoteExec ["life_fnc_broadcast",_target];

// -- Notify Seizer
[0,format["You seized the targets money successfully."]] remoteExec ["life_fnc_broadcast",player];
[1,format["You seized the targets money successfully."]] remoteExec ["life_fnc_broadcast",player];
*/
#include "..\..\script_macros.hpp"

_target = cursorTarget;

// -- Remove the gear
[player] remoteExec ["life_fnc_seizeMoney",_target];

// -- Notify Target
[0,format["Your money got seized by a Police Officer."]] remoteExec ["life_fnc_broadcast",_target];
[1,format["Your money got seized by a Police Officer."]] remoteExec ["life_fnc_broadcast",_target];

// -- Notify Seizer
[0,format["You seized the targets money successfully."]] remoteExec ["life_fnc_broadcast",player];
[1,format["You seized the targets money successfully."]] remoteExec ["life_fnc_broadcast",player];