/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

{

	private [ "_owner", "_setupEH" ];
	_owner = _x getVariable [ "vehicle_owner", "" ];
	_setupEH = _x getVariable [ "GTA_setupVehicleEH", false ];

	//--- Sync keychain
	if ( getPlayerUID player == _owner ) then {

		life_vehicles pushBack _x;

	};

	//--- Setup event handlers
	if ( _setupEH ) then {

		[ _x, true ] call GTA_fnc_vehicleEventHandlers;

	};

} forEach vehicles;
