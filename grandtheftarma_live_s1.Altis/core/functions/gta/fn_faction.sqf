/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit", "_short" ];
_unit = [ _this, 0, player, [objNull] ] call GTA_fnc_param;
_short = [ _this, 1, true, [true] ] call GTA_fnc_param;

if ( _short ) then {

	switch true do {

		case ( _unit call GTA_fnc_isCop ): { "cop" };
		case ( _unit call GTA_fnc_isMilitary ): { "mil" };
		case ( _unit call GTA_fnc_isMedic ): { "med" };
		case ( _unit call GTA_fnc_isHATO ): { "hato" };
		case ( side group _unit == civilian ): { "civ" };
		default {};

	}

} else {

	switch true do {

		case ( _unit call GTA_fnc_isCop ): { "cop" };
		case ( _unit call GTA_fnc_isMilitary ): { "military" };
		case ( _unit call GTA_fnc_isMedic ): { "medic" };
		case ( _unit call GTA_fnc_isHATO ): { "hato" };
		case ( side group _unit == civilian ): { "civilian" };
		default {};

	}

}
