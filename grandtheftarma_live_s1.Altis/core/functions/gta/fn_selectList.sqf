/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_list", "_result" ];
_list = [ _this, 0, [], [[]] ] call GTA_fnc_param;

//--- Set list
GTA_RscDisplaySelect_list = +_list;

//--- Defaults
missionNamespace setVariable [ "GTA_fnc_selectList_result", nil ];

//--- Create the display
createDialog "GTA_RscDisplaySelect";

//--- Wait for result
waitUntil { !isNil { missionNamespace getVariable "GTA_fnc_selectList_result" } };

//--- Get result
_result = missionNamespace getvariable [ "GTA_fnc_selectList_result", objNull ];

//--- Reset
GTA_fnc_selectList_result = nil;
GTA_RscDisplaySelect_list = nil;

//--- Return
_result
