#include "..\..\script_macros.hpp"

_target = cursorTarget;

// -- Remove the gear
removeGoggles _target;
removeHeadgear _target;
removevest _target;

// -- Notify Target
[0,format["Your headgear got seized by a Police Officer."]] remoteExec ["life_fnc_broadcast",_target];
[1,format["Your headgear got seized by a Police Officer."]] remoteExec ["life_fnc_broadcast",_target];

[0,format["Your Vest got seized by a Police Officer."]] remoteExec ["life_fnc_broadcast",_target];
[1,format["Your Vest got seized by a Police Officer."]] remoteExec ["life_fnc_broadcast",_target];

// -- Notify Seizer
[0,format["You seized the targets headgear successfully."]] remoteExec ["life_fnc_broadcast",player];
[1,format["You seized the targets headgear successfully."]] remoteExec ["life_fnc_broadcast",player];

[0,format["You seized the targets Vest successfully."]] remoteExec ["life_fnc_broadcast",player];
[1,format["You seized the targets Vest successfully."]] remoteExec ["life_fnc_broadcast",player];