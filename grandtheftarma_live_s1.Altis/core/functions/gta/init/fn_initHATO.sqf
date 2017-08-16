/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_hatoRank";
_hatoRank = ["GTA_hatoRank"] call GTA_fnc_const;

//--- Whitelist
if (_hatoRank <= 0) exitWith {
	["NotWhitelisted", false, 0] call BIS_fnc_endMission;
};

//--- Set group ID
if (groupID group player != "HATO") then {
	group player setGroupIdGlobal ["HATO"];
};
