/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_position", "_distance", "_location" ];
_position = [ _this, 0, [], [[]] ] call GTA_fnc_param;
_distance = [ _this, 1, 10000, [0] ] call GTA_fnc_param;

//--- Retrive nearest location
_location = nearestLocations [ _position, [ "NameCity", "NameCityCapital", "NameVillage" ], _distance ];
_location = if ( count _location > 0 ) then { text ( _location select 0 ) } else { "" };

//--- Return
_location
