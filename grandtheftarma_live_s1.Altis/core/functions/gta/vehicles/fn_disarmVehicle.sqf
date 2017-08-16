/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_vehicle", "_whitelist", "_turrets", "_turret", "_magazines" ];
_vehicle = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_whitelist = getArray ( missionConfigFile >> "GTA_CfgVehicles" >> typeOf _vehicle >> "magazinesWhitelisted" );

//--- Get turrets
_turrets = allTurrets [ _vehicle, true ];

//--- Add drivers turret
_turrets pushBack [ -1 ];

{

	_turret = _x;
	_magazines = _vehicle magazinesTurret _turret;

	{

		_magazine = _x;
		_type = ( _x call BIS_fnc_itemType ) select 1;

		if ( { _magazine == _x } count _whitelist == 0 && { _type != "CounterMeasures" } ) then {

			_vehicle removeMagazinesTurret [ _magazine, _turret ];

		};

	} forEach _magazines;

} forEach _turrets;
