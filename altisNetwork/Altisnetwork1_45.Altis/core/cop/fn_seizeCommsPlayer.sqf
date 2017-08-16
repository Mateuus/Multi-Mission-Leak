#include "..\..\script_macros.hpp"

// -- Remove their radio
player unassignItem "ItemRadio";
player removeItem   "ItemRadio";

[] call SOCK_fnc_updateRequest; // -- Sync

//systemChat format ["%1's communication has been seized",profileName]; // -- Tell everyone

// -- Notify Target
[0,format["Your communication got seized by a Police Officer."]] remoteExec ["life_fnc_broadcast",_target];
[1,format["Your communication got seized by a Police Officer."]] remoteExec ["life_fnc_broadcast",_target];

// -- Notify Seizer
[0,format["You seized the targets communication successfully."]] remoteExec ["life_fnc_broadcast",player];
[1,format["You seized the targets communication successfully."]] remoteExec ["life_fnc_broadcast",player];

