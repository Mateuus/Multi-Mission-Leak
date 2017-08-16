/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_pos", "_locations", "_location", "_locationDis" ];
_pos = [ [ _this ], 0, position cameraOn ] call GTA_fnc_param;
_pos = _pos call BIS_fnc_position;

//--- Get all locations
_locations = nearestLocations [	_pos, [ "NameVillage", "NameCity", "NameCityCapital" ], 10000 ];

//--- Find the nearest one with text
_location = locationNull;
_locationDis = 1e10;

//--- Determine nearest location
{

	private "_dis";
	_dis = locationPosition _x distance _pos;
	if ( _dis < _locationDIs && text _x != "" ) then { _location = _x; _locationDis = _dis; };

} foreach _locations;

if !( isNull _location ) then {

	private "_text";
	_text = if ( _pos in _location ) then {

		localize "STR_A3_BIS_fnc_locationDescription_near"

	} else {

		private [ "_locationPos", "_dir" ];
		_locationPos = locationPosition _location;
		_dir = [ _locationPos, _pos ] call BIS_fnc_dirto;
		_dir = (_dir + 360) % 360;

		//--- Determine bearing
		switch ( round ( _dir / 45 ) ) do {

			case 8;
			case 0: { localize "STR_A3_BIS_fnc_locationDescription_n" };
			case 1: { localize "STR_A3_BIS_fnc_locationDescription_ne" };
			case 2: { localize "STR_A3_BIS_fnc_locationDescription_e" };
			case 3: { localize "STR_A3_BIS_fnc_locationDescription_se" };
			case 4: { localize "STR_A3_BIS_fnc_locationDescription_s" };
			case 5: { localize "STR_A3_BIS_fnc_locationDescription_sw" };
			case 6: { localize "STR_A3_BIS_fnc_locationDescription_w" };
			case 7: { localize "STR_A3_BIS_fnc_locationDescription_nw" };
			default { localize "STR_A3_BIS_fnc_locationDescription_near" };

		};

	};

	format [ _text, text _location ]

} else {

	"Unknown"

};
