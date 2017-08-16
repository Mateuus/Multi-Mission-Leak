/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_result";

//--- Reset
missionNamespace setVariable [ "GTA_fnc_selectMessageType_result", nil ];

//--- Create display
createDialog "GTA_RscDisplayMessageType";

//--- Wait for result
waitUntil { !isNil { missionNamespace getVariable "GTA_fnc_selectMessageType_result" } };

//--- Get result
_result = missionNamespace getvariable [ "GTA_fnc_selectMessageType_result", [ -1, [] ] ];

//--- Reset
missionNamespace setVariable [ "GTA_fnc_selectMessageType_result", nil ];

//--- Return
_result
