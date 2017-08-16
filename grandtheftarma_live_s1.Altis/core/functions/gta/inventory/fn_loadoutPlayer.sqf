/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Default loadout
switch playerSide do {

	case west: {

		if ( [] call GTA_fnc_isMilitary ) then {

			[] call GTA_fnc_loadoutMilitary;

		} else {

			[] call GTA_fnc_loadoutCop;

		};

	};

	case independent: {

		if ( [] call GTA_fnc_isMedic ) then {

			[] call GTA_fnc_loadoutMedic;

		} else {

			[] call GTA_fnc_loadoutHATO;

		};

	};

	case civilian: { [] call GTA_fnc_loadoutCivilian; };

};

//--- Holster weapon
player action [ "SwitchWeapon", player, player, 100 ];
player switchcamera cameraView;

//--- Update clothing
[ [ player, uniform player, uniformContainer player ], "GTA_fnc_setUnitTextures" ] call GTA_fnc_remoteExec;
