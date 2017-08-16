/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_cfgs", "_spawns", "_return" ];
_cfgs = [];
_spawns = "true" configClasses ( missionConfigFile >> "GTA_CfgSpawns" );

_return = [];

//--- Loop through GTA_CfgSpawnLocations
{

	private [ "_cfg", "_factions", "_gang", "_license", "_perks" ];
	_cfg = _x;

	//--- Check faction
	_factions = if ( isArray ( _cfg >> "factions" ) ) then {

		( [ player, true ] call GTA_fnc_faction ) in ( getArray ( _cfg >> "factions" ) )

	} else { true };

	//--- Check gang
	_gang = if ( isNumber ( _cfg >> "gang" ) ) then {

		_gangID = life_gangData select 0;
		_gangID = if !( isNil { _gangID } ) then { _gangID } else { 0 };

		//--- Check player gang vs config
		_gangID == getNumber ( _cfg >> "gang" );

	} else { true };

	//--- Check licenses
	_licenses = if ( isArray ( _cfg >> "licenses" ) ) then {

		{
			//--- Convert license handle to var
			_x = [ _x, 0 ] call life_fnc_licenseType;

			//--- Exit if player doesn't have license
			if !( missionNamespace getVariable [ _x select 0, false ] ) exitWith { false };

			true

		} forEach getArray ( _cfg >> "licenses" );

	} else { true };

	//--- Check perks
	_perks = if ( isArray ( _cfg >> "perks" ) ) then {

		{

			//--- Exit if player doesn't have perk
			if !( [ _x ] call GTA_fnc_hasPerk ) exitWith { false };

			true

		} forEach getArray ( _cfg >> "perks" );

	} else { true };

	//--- Push if conditions are met
	if ( _factions && _gang && _licenses && _perks ) then { _cfgs pushBack _cfg };

} forEach _spawns;

//--- Process _cfgs
{

	_name = getText ( _x >> "name" );
	_pos = getText ( _x >> "marker" );
	_icon = getText ( _x >> "icon" );
	_color = getArray ( _x >> "color" );
	_buildingTypes = getArray ( _x >> "buildingTypes" );
	_radius = getNumber ( _x >> "radius" );

	//--- Default color
	if ( count _color == 0 ) then {

		_color = [ 1, 1, 1, 1 ];

	};

	//--- Convert marker to position
	_dir = markerDir _pos;
	_pos = getMarkerPos _pos;

	//--- Check if building spawn is set
	if ( count _buildingTypes == 0 ) then {

		_return pushBack [ _name, _icon, _color, _pos, _dir ];

	} else {

		_return pushBack [ _name, _icon, _color, _pos, _buildingTypes, _radius ];

	};

} forEach _cfgs;

//--- Check player houses
if ( count life_houses > 0 ) then {

	{
		_pos = call compile format [ "%1", _x select 0 ];
		_house = [_pos] call GTA_fnc_nearestBuilding;
		_houseName = getText ( configFile >> "CfgVehicles" >> typeOf _house >> "displayName" );

		_return pushBack [ _houseName, "\a3\modules_f_curator\Data\portraitobjectivesector_ca.paa", [ 0.5, 0.85, 0.2, 1 ], _house ];

	} foreach life_houses;

};

_return
