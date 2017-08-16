/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_target";
_target = cursorObject;

//--- Error checks
if ( isNull _target ) exitWith {};
if ( !isPlayer _target ) exitWith {};

//--- Action
if ( [ 5 + random 5, format [ "Robbing %1", name _target ], "", { player distance _this < 4 || { [ _this ] call GTA_fnc_reviveStatus == "ALIVE" } }, _target ] call GTA_fnc_action ) then {

	//--- Rob the player (local)
	[ [ player ], "life_fnc_robPerson", _target ] call GTA_fnc_remoteExec;

};
