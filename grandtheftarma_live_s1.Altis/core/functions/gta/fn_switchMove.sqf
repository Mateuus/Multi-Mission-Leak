/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit", "_anim", "_player" ];
_unit = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_anim = [ _this, 1, "", [""] ] call GTA_fnc_param;
_player = [ _this, 2, true, [true] ] call GTA_fnc_param;

//--- Error checks
if ( isNull _unit ) exitWith {};
if ( !_player && { _unit == player } ) exitWith {};

//--- Switch move
_unit switchMove _anim;
