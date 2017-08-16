/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_unit";
_unit = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;

//--- Error checks
if ( isNull _unit ) exitWith {};
if ( !alive _unit ) exitWith {};

if ( [ 45, format [ "Eating %1", name _unit ], nil, { !isNull _this && { [ _this ] call GTA_fnc_reviveStatus == "INCAPACITATED" } }, _unit ] call GTA_fnc_action ) then {

	//--- Kill the incapacitated player
	_unit setVariable [ "GTA_revive_damage", 1, true ];

	//--- Heal the player
	player setDamage ( getDammage player - 0.5 );

	//--- Add fatigue
	player setFatigue ( getFatigue player + 0.8 );

	//--- Wanted
	[ [ getPlayerUID player, profileName, "186" ], "life_fnc_wantedAdd", false ] call GTA_fnc_remoteExec;

} else {

	titleText [ "Meal interrupted", "PLAIN" ];

};
