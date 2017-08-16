/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_milRank";
_milRank = ["GTA_milRank"] call GTA_fnc_const;

//--- Whitelist
if (_milRank <= 0) exitWith {
	["NotWhitelisted", false, 0] call BIS_fnc_endMission;
};

//--- Set group ID
if (groupID group player != "NATO") then {
	group player setGroupIdGlobal ["NATO"];
};
