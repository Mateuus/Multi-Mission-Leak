/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_medRank";
_medRank = ["GTA_medRank"] call GTA_fnc_const;

//--- Whitelist
if (_medRank <= 0) exitWith {
	["NotWhitelisted", false, 0] call BIS_fnc_endMission;
};

//--- Set group ID
if (groupID group player != "NHS") then {
	group player setGroupIdGlobal ["NHS"];
};
