/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_copRank";
_copRank = ["GTA_copRank"] call GTA_fnc_const;

//--- Whitelist
if (_copRank <= 0) exitWith {
	["NotWhitelisted", false, 0] call BIS_fnc_endMission;
};

//--- Set group ID
if (groupID group player != "Police") then {
	group player setGroupIdGlobal ["Police"];
};
