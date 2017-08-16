/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit", "_sound", "_distance" ];
_unit = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_sound = [ _this, 1, "", [""] ] call GTA_fnc_param;
_distance = [ _this, 2, 30, [0] ] call GTA_fnc_param;

//--- Error checks
if ( isNull _unit ) exitWith {};

//--- Check distance
if ( vehicle player distance _unit > _distance ) exitWith {};

//--- Play sound
_unit say3D _sound;
