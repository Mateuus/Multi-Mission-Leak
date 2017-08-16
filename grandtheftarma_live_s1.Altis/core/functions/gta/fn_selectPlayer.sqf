/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_result";

//--- Reset
missionNamespace setVariable [ "GTA_fnc_selectPlayer_result", nil ];

//--- Create display
createDialog "GTA_RscDisplaySelectPlayer";

//--- Wait for result
waitUntil { !isNil { missionNamespace getVariable "GTA_fnc_selectPlayer_result" } };

//--- Get result
_result = missionNamespace getvariable [ "GTA_fnc_selectPlayer_result", objNull ];

//--- Reset
missionNamespace setVariable [ "GTA_fnc_selectPlayer_result", nil ];

//--- Return
_result
