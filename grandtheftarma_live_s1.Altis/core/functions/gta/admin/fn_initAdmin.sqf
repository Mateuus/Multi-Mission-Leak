/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if ( !isServer && !hasInterface ) exitWith {};

private "_mode";
_mode = [ _this, 0, "", [""] ] call GTA_fnc_param;

switch _mode do {

	case "preInit": {

		if ( isServer ) then {

			GTA_admin_admins = [];

		};

	};

	case "postInit": {

	};

};
